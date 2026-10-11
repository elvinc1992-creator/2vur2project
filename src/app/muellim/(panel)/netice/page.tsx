import { redirect } from "next/navigation";

/** Menyudakı "Kağız nəticələri" — nəticəsi yazılmamış kağız sınaqları. */
export default function PaperResults() {
  redirect("/muellim/sinaqlar?netice=1");
}
