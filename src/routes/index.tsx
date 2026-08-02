import { createFileRoute } from "@tanstack/react-router";

import { Pending } from "@/components/shared/Pending";
import { CalendarPage, categoriesQueryOptions, eventsQueryOptions } from "@/features/calendar";

export const Route = createFileRoute("/")({
  loader: ({ context }) =>
    Promise.all([
      context.queryClient.ensureQueryData(eventsQueryOptions),
      context.queryClient.ensureQueryData(categoriesQueryOptions),
    ]),
  pendingComponent: Pending,
  component: Home,
});

function Home() {
  return <CalendarPage />;
}
