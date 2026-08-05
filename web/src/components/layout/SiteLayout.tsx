import { Footer } from "@/components/layout/Footer";
import { HashScrollSync } from "@/components/layout/HashScrollSync";
import { Header } from "@/components/layout/Header";

export function SiteLayout({ children }: { children: React.ReactNode }) {
  return (
    <>
      <HashScrollSync />
      <Header />
      {children}
      <Footer />
    </>
  );
}
