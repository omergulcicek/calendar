import type { ReactNode } from "react";

import { motion, useReducedMotion } from "framer-motion";

import {
  easeOut,
  fadeInUp,
  reducedMotionFade,
  staggerContainer,
  viewport,
} from "@/features/calendar/helpers/motion";

type RevealProps = {
  children: ReactNode;
  className?: string;
  delay?: number;
  mode?: "mount" | "view";
  y?: number;
  fadeOpacity?: boolean;
};

export function Reveal({
  children,
  className,
  delay = 0,
  mode = "view",
  y = 12,
  fadeOpacity = true,
}: RevealProps) {
  const prefersReducedMotion = useReducedMotion();

  if (mode === "mount") {
    if (prefersReducedMotion) {
      return <div className={className}>{children}</div>;
    }

    return (
      <motion.div
        className={className}
        initial={fadeOpacity ? { opacity: 0, y } : { y }}
        animate={fadeOpacity ? { opacity: 1, y: 0 } : { y: 0 }}
        transition={{ duration: 0.45, delay, ease: easeOut }}
      >
        {children}
      </motion.div>
    );
  }

  return (
    <motion.div
      className={className}
      initial="hidden"
      whileInView="visible"
      viewport={viewport}
      variants={prefersReducedMotion ? reducedMotionFade : fadeInUp}
    >
      {children}
    </motion.div>
  );
}

export function RevealGroup({
  children,
  className,
  mode = "view",
}: {
  children: ReactNode;
  className?: string;
  mode?: "mount" | "view";
}) {
  const prefersReducedMotion = useReducedMotion();

  if (prefersReducedMotion) {
    return <div className={className}>{children}</div>;
  }

  if (mode === "mount") {
    return (
      <motion.div
        className={className}
        initial="hidden"
        animate="visible"
        variants={staggerContainer}
      >
        {children}
      </motion.div>
    );
  }

  return (
    <motion.div
      className={className}
      initial="hidden"
      whileInView="visible"
      viewport={viewport}
      variants={staggerContainer}
    >
      {children}
    </motion.div>
  );
}

export function RevealItem({ children, className }: { children: ReactNode; className?: string }) {
  const prefersReducedMotion = useReducedMotion();

  if (prefersReducedMotion) {
    return <div className={className}>{children}</div>;
  }

  return (
    <motion.div className={className} variants={fadeInUp}>
      {children}
    </motion.div>
  );
}
