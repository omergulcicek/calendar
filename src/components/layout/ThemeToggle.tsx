import { Moon, Sun } from "lucide-react";

import { cn } from "@/lib/utils";

import { useTheme } from "@/providers/ThemeProvider";

import { Button } from "@/components/ui/button";

/**
 * High-frequency control — no enter/exit motion (Emil: never animate
 * often-repeated toggles). Icons cross-fade with a short CSS opacity change.
 */
export function ThemeToggle() {
  const { resolvedTheme, setTheme } = useTheme();
  const isDark = resolvedTheme === "dark";

  return (
    <Button
      type="button"
      variant="ghost"
      size="icon"
      static
      aria-label={isDark ? "Açık temaya geç" : "Koyu temaya geç"}
      title={isDark ? "Açık temaya geç" : "Koyu temaya geç"}
      className="relative size-9"
      onClick={() => setTheme(isDark ? "light" : "dark")}
    >
      <Sun
        aria-hidden
        size={16}
        strokeWidth={1.75}
        className={cn(
          "absolute transition-opacity duration-100 ease-out",
          isDark ? "opacity-0" : "opacity-100",
        )}
      />
      <Moon
        aria-hidden
        size={16}
        strokeWidth={1.75}
        className={cn(
          "absolute transition-opacity duration-100 ease-out",
          isDark ? "opacity-100" : "opacity-0",
        )}
      />
    </Button>
  );
}
