import { siteConfig } from "@/config/site.config";

const VIRASTACK_START_URL = "https://www.virastack.com/start";

export function Footer() {
  return (
    <footer className="mt-24 border-t border-border/80 pt-8 pb-12">
      <div className="mx-auto flex max-w-7xl flex-col items-center gap-4 px-4 text-center text-sm text-pretty text-muted-foreground">
        <p className="text-xs sm:text-sm">
          <a
            href={VIRASTACK_START_URL}
            target="_blank"
            rel="noreferrer"
            className="underline-offset-4 transition-opacity duration-150 hover:underline"
          >
            <span className="font-medium text-foreground">ViraStack</span>{" "}
            <span className="font-medium text-teal-500 italic">Start</span>
          </a>{" "}
          ile geliştirildi.
        </p>

        <p className="flex flex-wrap items-center justify-center gap-x-3 gap-y-1 text-xs">
          <a
            href={siteConfig.links.github}
            target="_blank"
            rel="noreferrer"
            className="underline-offset-4 transition-opacity duration-150 hover:underline"
          >
            GitHub
          </a>
          <span aria-hidden="true">·</span>
          <a
            href="https://omergulcicek.com/"
            target="_blank"
            rel="noreferrer"
            className="underline-offset-4 transition-opacity duration-150 hover:underline"
          >
            omergulcicek.com
          </a>
        </p>
      </div>
    </footer>
  );
}
