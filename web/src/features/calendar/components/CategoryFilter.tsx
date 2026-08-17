import { useMemo } from "react";
import type { JSX } from "react";

import { Check, ChevronDown } from "lucide-react";

import { cn } from "@/lib/utils";

import { Button } from "@/components/ui/button";
import {
  DropdownMenu,
  DropdownMenuContent,
  DropdownMenuGroup,
  DropdownMenuItem,
  DropdownMenuLabel,
  DropdownMenuSub,
  DropdownMenuSubContent,
  DropdownMenuSubTrigger,
  DropdownMenuTrigger,
} from "@/components/ui/dropdown-menu";
import { getCategoryColor } from "@/features/calendar/helpers/categories";
import { groupCategoriesForSelect } from "@/features/calendar/helpers/category-groups";

type FilterCategory = {
  key: string;
  name: string;
  slug: string | null;
};

type CategoryFilterProps = {
  categories: FilterCategory[];
  value: string;
  allValue: string;
  allLabel: string;
  onValueChange: (value: string) => void;
};

function CategoryMenuItem({
  category,
  selected,
  onSelect,
}: {
  category: FilterCategory;
  selected: boolean;
  onSelect: (key: string) => void;
}): JSX.Element {
  const color = getCategoryColor(category.slug);

  return (
    <DropdownMenuItem className="pr-8" onSelect={() => onSelect(category.key)}>
      <span className={cn("size-2 shrink-0 rounded-full", color.dot)} aria-hidden />
      <span className="min-w-0 flex-1 truncate">{category.name}</span>
      {selected ? <Check className="absolute right-2 size-4" strokeWidth={2} /> : null}
    </DropdownMenuItem>
  );
}

export function CategoryFilter({
  categories,
  value,
  allValue,
  allLabel,
  onValueChange,
}: CategoryFilterProps): JSX.Element {
  const { groups, ungrouped } = useMemo(() => groupCategoriesForSelect(categories), [categories]);

  const selectedCategory = categories.find((category) => category.key === value);
  const selectedColor = getCategoryColor(selectedCategory?.slug);
  const triggerLabel = selectedCategory?.name ?? allLabel;

  return (
    <DropdownMenu>
      <DropdownMenuTrigger asChild>
        <Button
          type="button"
          variant="outline"
          size="sm"
          static={true}
          className="h-8 w-full max-w-56 min-w-0 justify-between text-sm font-normal md:w-56"
          aria-label="Kategori seç"
        >
          <span className="flex min-w-0 items-center gap-2">
            {selectedCategory ? (
              <span className={cn("size-2 shrink-0 rounded-full", selectedColor.dot)} aria-hidden />
            ) : null}
            <span className="truncate">{triggerLabel}</span>
          </span>
          <ChevronDown className="size-4 opacity-50" />
        </Button>
      </DropdownMenuTrigger>
      <DropdownMenuContent align="end" className="w-56">
        <DropdownMenuItem className="pr-8" onSelect={() => onValueChange(allValue)}>
          <span className="min-w-0 flex-1 truncate">{allLabel}</span>
          {value === allValue ? (
            <Check className="absolute right-2 size-4" strokeWidth={2} />
          ) : null}
        </DropdownMenuItem>
        {groups.map((group) =>
          group.nested ? (
            <DropdownMenuSub key={group.label}>
              <DropdownMenuSubTrigger
                className={cn(
                  group.categories.some((category) => category.key === value) && "bg-accent",
                )}
              >
                {group.label}
              </DropdownMenuSubTrigger>
              <DropdownMenuSubContent className="w-56">
                {group.categories.map((category) => (
                  <CategoryMenuItem
                    key={category.key}
                    category={category}
                    selected={value === category.key}
                    onSelect={onValueChange}
                  />
                ))}
              </DropdownMenuSubContent>
            </DropdownMenuSub>
          ) : (
            <DropdownMenuGroup key={group.label}>
              <DropdownMenuLabel className="px-2 py-1.5 text-xs font-medium text-muted-foreground">
                {group.label}
              </DropdownMenuLabel>
              {group.categories.map((category) => (
                <CategoryMenuItem
                  key={category.key}
                  category={category}
                  selected={value === category.key}
                  onSelect={onValueChange}
                />
              ))}
            </DropdownMenuGroup>
          ),
        )}
        {ungrouped.length > 0 ? (
          <DropdownMenuGroup>
            <DropdownMenuLabel className="px-2 py-1.5 text-xs font-medium text-muted-foreground">
              Diğer
            </DropdownMenuLabel>
            {ungrouped.map((category) => (
              <CategoryMenuItem
                key={category.key}
                category={category}
                selected={value === category.key}
                onSelect={onValueChange}
              />
            ))}
          </DropdownMenuGroup>
        ) : null}
      </DropdownMenuContent>
    </DropdownMenu>
  );
}
