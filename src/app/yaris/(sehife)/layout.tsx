import { auth } from "@/auth";
import { AppFrame } from "@/components/app/app-frame";
import { roleOf } from "@/lib/admin/guard";
import { ensureActive } from "@/lib/auth/account";
import { getDemoState } from "@/lib/demo/state";

// Yarış səhifələri (açılış, nəticə, imtina): daxil olan istifadəçi tətbiq çərçivəsində (sol panel / alt menyu
// gizlənmir), qonaq — yarışın öz başlığı ilə. Onlayn tur (/yaris/[slug]/tur) çərçivəsiz, fokus rejimindədir.
export default async function ContestLayout({ children }: { children: React.ReactNode }) {
  const session = await auth();
  if (!session?.user?.id) return children;
  await ensureActive(session.user.id);
  const [state, role] = await Promise.all([getDemoState(session.user.id), roleOf(session.user.id)]);
  return (
    <AppFrame state={state} admin={role === "admin"} teacher={role === "teacher"}>
      <div className="row-span-2 min-w-0">{children}</div>
    </AppFrame>
  );
}
