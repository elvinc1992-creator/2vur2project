import { SkeletonCard } from "@/components/stats/charts";
import { az } from "@/content/az";

export default function Loading() {
  return (
    <main className="grid content-start gap-6 px-4 pt-5 pb-8 lg:p-8" aria-busy="true">
      <p className="sr-only" role="status">
        {az.app.stats.filters.updating}
      </p>
      <SkeletonCard className="h-20 max-w-xl" />
      <SkeletonCard className="h-28" />
      <div className="grid gap-4 sm:grid-cols-2 lg:grid-cols-4">
        {[0, 1, 2, 3].map((i) => (
          <SkeletonCard key={i} className="h-32" />
        ))}
      </div>
      <SkeletonCard className="h-96" />
    </main>
  );
}
