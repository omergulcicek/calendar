import type { ErrorComponentProps } from "@tanstack/react-router";
import { Link, rootRouteId, useMatch, useRouter } from "@tanstack/react-router";

import { Button } from "@/components/ui/button";

export function DefaultCatchBoundary({ error }: ErrorComponentProps) {
  const router = useRouter();
  const isRoot = useMatch({
    strict: false,
    select: (state) => state.id === rootRouteId,
  });

  console.error(error);

  return (
    <div className="mx-auto flex flex-1 flex-col items-center justify-center gap-4 px-6 py-24 text-center">
      <h1 className="text-2xl font-semibold tracking-tight">Bir şeyler ters gitti</h1>
      <p className="max-w-md text-sm text-muted-foreground">
        Bu sayfa yüklenirken beklenmeyen bir hata oluştu. Tekrar deneyebilir veya ana sayfaya
        dönebilirsiniz.
      </p>
      <div className="flex gap-3">
        <Button onClick={() => router.invalidate()}>Tekrar dene</Button>
        {isRoot ? (
          <Button variant="outline" asChild>
            <Link to="/">Ana sayfa</Link>
          </Button>
        ) : (
          <Button variant="outline" onClick={() => window.history.back()}>
            Geri
          </Button>
        )}
      </div>
    </div>
  );
}
