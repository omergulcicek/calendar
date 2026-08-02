import { Link } from "@tanstack/react-router";

import { Button } from "@/components/ui/button";

export function NotFound() {
  return (
    <div className="mx-auto flex flex-1 flex-col items-center justify-center gap-4 px-6 py-24 text-center">
      <p className="text-sm font-medium text-muted-foreground">404</p>
      <h1 className="text-2xl font-semibold tracking-tight">Sayfa bulunamadı</h1>
      <p className="max-w-md text-sm text-muted-foreground">
        Aradığınız sayfa yok veya taşınmış olabilir.
      </p>
      <Button asChild>
        <Link to="/">Ana sayfa</Link>
      </Button>
    </div>
  );
}
