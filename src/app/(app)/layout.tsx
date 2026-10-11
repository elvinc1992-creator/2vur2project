import { AppFrame } from "@/components/app/app-frame";
import { roleOf } from "@/lib/admin/guard";
import { requireDemo } from "@/lib/demo/session";

export default async function AppLayout({ children }: { children: React.ReactNode }) {
  const { user, state } = await requireDemo("/panel");
  const role = await roleOf(user.id);
  return (
    <AppFrame state={state} admin={role === "admin"} teacher={role === "teacher"}>
      {children}
    </AppFrame>
  );
}
