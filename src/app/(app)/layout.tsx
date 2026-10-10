import { AppFrame } from "@/components/app/app-frame";
import { isAdmin } from "@/lib/admin/guard";
import { requireDemo } from "@/lib/demo/session";

export default async function AppLayout({ children }: { children: React.ReactNode }) {
  const { user, state } = await requireDemo("/panel");
  return (
    <AppFrame state={state} admin={await isAdmin(user.id)}>
      {children}
    </AppFrame>
  );
}
