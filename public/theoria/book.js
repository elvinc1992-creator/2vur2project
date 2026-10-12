// 2vur2.az — nəzəriyyə kitabının oxuyucusu.
// Müəllifin HTML-indən (hero + <section>-lar) vərəqlənən kitab qurur: məzmun ölçülüb səhifələrə bölünür,
// ona görə heç bir səhifənin altı kəsilmir. Geniş ekranda iki səhifə yan-yana, dar ekranda bir səhifə.
// Vərəqləmə: StPageFlip (public/theoria/page-flip-*.js, MIT).
(async function () {
  "use strict";
  if (document.readyState !== "complete") await new Promise((r) => addEventListener("load", r, { once: true }));
  // Bütün şriftlər (KaTeX-in ölçü/qalın şriftləri də) ölçmədən ƏVVƏL yüklənir — sonra yüklənən şrift eni/hündürlüyü dəyişməsin.
  if (document.fonts) {
    await Promise.all([...document.fonts].map((f) => f.load().catch(() => {})));
    await document.fonts.ready;
  }

  const meta = (n) => document.querySelector(`meta[name="${n}"]`)?.content || "";
  const OWNER = "Bu material 2vur2.az saytına məxsusdur";
  const main = document.querySelector("main");
  const hero = main.querySelector(".hero");
  const secs = [...main.querySelectorAll(":scope > section")];
  const titles = secs.map((s) => (s.querySelector("h2")?.textContent || "").replace(/^\s*\d+\s*/, "").trim());
  const topic = meta("topic") || hero.querySelector("h1")?.textContent.trim() || "";
  const next = meta("next-topic");
  // Ölçmə zamanı "Həllə bax" həlləri açıq olur — sonra açanda səhifə daşmasın deyə onlara yer saxlanılır.
  const details = [...main.querySelectorAll("details")];
  const wasOpen = details.map((d) => d.open);
  details.forEach((d) => (d.open = true));

  const el = (tag, cls, html) => {
    const e = document.createElement(tag);
    if (cls) e.className = cls;
    if (html != null) e.innerHTML = html;
    return e;
  };
  const esc = (s) => s.replace(/[&<>"]/g, (c) => ({ "&": "&amp;", "<": "&lt;", ">": "&gt;", '"': "&quot;" })[c]);

  /* ---------- Çərçivə ---------- */
  const coarse = matchMedia("(pointer: coarse)").matches;
  const bk = el(
    "div",
    "bk",
    `<div class="bk-top">
      <label class="bk-lbl"><span class="sr">Bölmə</span><select class="bk-sel" id="bkSel"></select></label>
      <span class="bk-hint">${coarse ? "Vərəqləmək üçün səhifəni sürüşdür" : "← → düymələri və ya səhifənin kənarından tutub çevir"}</span>
    </div>
    <div class="stage" id="stage"><div id="book"></div></div>
    <div class="bk-nav">
      <button type="button" id="prv" aria-label="Əvvəlki səhifə">‹</button>
      <div class="bk-mid"><span id="cnt" aria-live="polite"></span><div class="bk-bar"><i id="bar"></i></div></div>
      <button type="button" id="nxt" aria-label="Növbəti səhifə">›</button>
    </div>`,
  );
  document.body.appendChild(bk);
  document.body.classList.add("book");
  const stage = bk.querySelector("#stage");
  const book = bk.querySelector("#book");

  /* ---------- Səhifə ölçüsü ---------- */
  const SW = stage.clientWidth;
  const SH = stage.clientHeight;
  const spread = SW >= 820 && SH >= 420;
  const pw = spread ? Math.min(Math.floor(SW / 2), 620) : Math.min(SW, 640);
  const ph = SH;
  book.style.width = `${spread ? pw * 2 : pw}px`;
  book.style.height = `${ph}px`;

  /* ---------- Səhifələmə ---------- */
  const holder = el("div", "measure");
  document.body.appendChild(holder);
  const pages = [];
  let cur, box, wrap, curSec, curTitle;

  function newPage(cls = "") {
    cur = el("div", `page ${cls}`.trim());
    cur.style.width = `${pw}px`;
    cur.style.height = `${ph}px`;
    cur.innerHTML = `<div class="pg-in"><div class="in"></div><div class="ft"><span>${OWNER}</span><span class="no"></span></div></div>`;
    cur.dataset.sec = String(curSec);
    holder.appendChild(cur);
    pages.push(cur);
    box = cur.querySelector(".in");
  }
  const fits = () => box.scrollHeight <= box.clientHeight + 1;
  const isHeading = (n) => n && /^H[2-4]$/.test(n.tagName);

  // Növbəti səhifəyə keçid; sonda qalan başlıq (h2/h3) özündən sonrakı məzmunla birgə köçür.
  // Səhifədə başlıqdan başqa heç nə yoxdursa, keçid edilmir (false).
  function breakPage() {
    const carry = [];
    while (isHeading(wrap.lastElementChild)) carry.unshift(wrap.removeChild(wrap.lastElementChild));
    if (!wrap.children.length) {
      carry.forEach((h) => wrap.appendChild(h));
      return false;
    }
    const shell = wrap.cloneNode(false);
    shell.removeAttribute("id");
    newPage();
    box.appendChild(el("div", "run", `${esc(curTitle)} <span>(davamı)</span>`));
    wrap = shell;
    box.appendChild(wrap);
    carry.forEach((h) => wrap.appendChild(h));
    return true;
  }

  // Səhifəyə sığmayan geniş düstur kiçildilir (kəsilmir, sürüşdürmə zolağı da yaranmır).
  function fitMath(node) {
    if (node.nodeType !== 1) return;
    const list = node.matches(".katex-display") ? [node] : [...node.querySelectorAll(".katex-display")];
    for (const d of list) {
      // Düstur kiçildikcə onu saxlayan blokun eni də dəyişə bilər (cədvəl xanası) — bir neçə addım, 2% ehtiyatla
      for (let k = 0; k < 6 && d.scrollWidth > d.clientWidth + 1; k++) {
        const now = parseFloat(getComputedStyle(d).fontSize);
        d.style.fontSize = `${Math.max(9, ((now * d.clientWidth) / d.scrollWidth) * 0.98)}px`;
      }
    }
  }

  // Dar səhifəyə sığmayan cədvəl kart görünüşünə keçir: hər sətir bir kart, xananın üstündə sütun adı.
  function fitTable(node) {
    if (node.nodeType !== 1) return;
    const tables = node.tagName === "TABLE" ? [node] : [...node.querySelectorAll("table")];
    for (const t of tables) {
      const cells = [...t.querySelectorAll("td, th")];
      const over = t.scrollWidth > t.parentElement.clientWidth + 1 || cells.some((c) => c.scrollWidth > c.clientWidth + 1);
      if (!over) continue;
      const rows = [...t.querySelectorAll("tr")];
      const head = rows.find((r) => [...r.children].every((c) => c.tagName === "TH"));
      const labels = head ? [...head.children].map((c) => c.textContent.trim()) : [];
      rows.forEach((r) => [...r.children].forEach((c, i) => labels[i] && c.tagName === "TD" && (c.dataset.label = labels[i])));
      t.classList.add("stack");
    }
  }

  function add(node) {
    wrap.appendChild(node);
    fitTable(node);
    fitMath(node);
    if (fits()) return;
    wrap.removeChild(node);
    if (split(node)) return;
    if (breakPage()) return add(node);
    if (node.nodeType === 1 && node.matches(".ex") && node.querySelector("details .sol")) return flowExample(node);
    wrap.appendChild(node);
    if (shrinkPic(node)) return; // boş səhifəyə də sığmayan şəkil kiçildilir
    // hələ də sığmır — həmin səhifə daxildə sürüşdürülür
    cur.classList.add("tall");
  }

  // Həlli bir səhifəyə sığmayan nümunə (uzun isbat): həll açıq göstərilir və sətir-sətir (<br>) növbəti
  // səhifələrə "Həll (davamı)" ilə keçir — səhifənin içində sürüşdürmə qalmır.
  function flowExample(ex) {
    const lines = [];
    for (const d of ex.querySelectorAll("details")) {
      const sol = d.querySelector(".sol");
      let ln = el("div", "ln");
      for (const n of [...sol.childNodes]) {
        if (n.nodeName === "BR") {
          lines.push(ln);
          ln = el("div", "ln");
        } else if (n.nodeType === 1 && /^(FIGURE|DIV|P|UL|OL|TABLE)$/.test(n.nodeName)) {
          lines.push(ln, n); // blok (şəkil, siyahı, düstur qutusu) ayrıca sətirdir
          ln = el("div", "ln");
        } else ln.appendChild(n);
      }
      lines.push(ln);
      d.remove();
    }
    const real = lines.filter((l) => l.textContent.trim() || l.querySelector("*"));
    let head = "Həll";
    let sol;
    const open = (shell) => {
      sol = el("div", "sol sol-open");
      sol.appendChild(el("div", "sol-h", head));
      shell.appendChild(sol);
      wrap.appendChild(shell);
    };
    open(ex);
    let n = 0;
    for (const ln of real) {
      sol.appendChild(ln);
      fitMath(ln);
      if (fits()) {
        n++;
        continue;
      }
      // Sığmırsa yeni səhifəyə: əvvəlki sətirlər və ya (ilk hissədə) sualın özü bu səhifədə qalır
      if (n || sol.parentElement === ex) {
        sol.removeChild(ln);
        if (!n) sol.remove(); // həllin başlığı sualla tək qalmasın
        breakPage();
        head = "Həll (davamı)";
        open(ex.cloneNode(false));
        sol.parentElement.classList.add("cont");
        sol.appendChild(ln);
      }
      n = 1;
      if (!fits()) shrinkPic(ln);
    }
    if (!fits()) cur.classList.add("tall");
  }

  // Səhifəyə sığmayan yeganə şəkil kiçildilir (ən azı 120px qalır).
  function shrinkPic(node) {
    const pics = node.nodeType === 1 ? [...node.querySelectorAll("svg, img")].filter((s) => !s.closest(".katex")) : [];
    if (node.nodeType === 1 && /^(svg|IMG)$/.test(node.nodeName)) pics.push(node);
    if (pics.length !== 1) return false;
    const pic = pics[0];
    const h = pic.getBoundingClientRect().height - (box.scrollHeight - box.clientHeight) - 4;
    if (h < 120) return false;
    pic.style.maxHeight = `${Math.floor(h)}px`;
    pic.style.width = "auto";
    return fits();
  }

  // Siyahı, cədvəl və kart qrupları sətir-sətir bölünür; nömrəli siyahının nömrələri davam edir.
  function split(node) {
    if (node.nodeType !== 1) return false;
    let items, make;
    if (node.tagName === "TABLE") {
      const rows = [...node.querySelectorAll(":scope > tbody > tr, :scope > tr")];
      const thead = node.querySelector(":scope > thead");
      const headRow = !thead && rows[0] && [...rows[0].children].every((c) => c.tagName === "TH") ? rows.shift() : null;
      if (rows.length < 2) return false;
      items = rows;
      make = () => {
        const t = node.cloneNode(false);
        if (thead) t.appendChild(thead.cloneNode(true));
        const tb = el("tbody");
        if (headRow) tb.appendChild(headRow.cloneNode(true));
        t.appendChild(tb);
        return [t, tb];
      };
    } else if (/^(UL|OL)$/.test(node.tagName) || node.matches(".mist, .grid2, .toc-list")) {
      items = [...node.children];
      if (items.length < 2) return false;
      make = (no) => {
        const s = node.cloneNode(false);
        if (node.tagName === "OL") s.start = no;
        return [s, s];
      };
    } else return false;

    let no = node.tagName === "OL" ? node.start || 1 : 1;
    let [shell, inner] = make(no);
    wrap.appendChild(shell);
    let n = 0;
    for (const it of items) {
      inner.appendChild(it);
      fitMath(it);
      if (!fits()) {
        inner.removeChild(it);
        if (!n) wrap.removeChild(shell);
        breakPage(); // alınmasa (səhifədə yalnız başlıq var), element burada qalır
        [shell, inner] = make(no);
        wrap.appendChild(shell);
        inner.appendChild(it);
        if (!fits()) cur.classList.add("tall");
      }
      n++;
      no++;
    }
    return true;
  }

  // 1) Üz qabığı
  curSec = 0;
  curTitle = topic;
  newPage("cover-page");
  cur.dataset.density = "hard";
  cur.querySelector(".ft").remove();
  const cov = el("div", "cov");
  cov.appendChild(hero);
  cov.appendChild(el("div", "cov-brand", `<b>2×2</b><span>2vur2.az</span>`));
  box.appendChild(cov);
  if (!fits()) cur.classList.add("tall");

  // 2) Mündəricat (səhifə nömrələri sonda yazılır)
  curSec = 1;
  curTitle = "Mündəricat";
  newPage("toc-page");
  wrap = el("div", "toc-wrap");
  box.appendChild(wrap);
  wrap.appendChild(el("h2", "toc-h", "Mündəricat"));
  const tocList = el("div", "toc-list");
  titles.forEach((x, i) => {
    const a = el("a", "", `<span>${i + 1}. ${esc(x)}</span><b></b>`);
    a.href = "#";
    a.dataset.sec = String(i + 2);
    tocList.appendChild(a);
  });
  add(tocList);

  // 3) Bölmələr — hər biri yeni səhifədən
  secs.forEach((sec, i) => {
    curSec = i + 2;
    curTitle = `${i + 1}. ${titles[i]}`;
    newPage();
    wrap = sec.cloneNode(false);
    box.appendChild(wrap);
    [...sec.childNodes].forEach((n) => {
      if (n.nodeType === 8 || (n.nodeType === 3 && !n.textContent.trim())) return;
      add(n);
    });
  });

  // 4) Son səhifə. İki səhifəli rejimdə yalnız sağa düşəndə əlavə olunur — solda tək qalıb sağı boş qoymasın.
  curSec = secs.length + 2;
  const hasEnd = !spread || pages.length % 2 === 1;
  if (hasEnd) {
    newPage("end-page");
    cur.dataset.density = "hard";
    cur.querySelector(".ft").remove();
    box.appendChild(
      el(
        "div",
        "end",
        `<b>2×2</b><div>2vur2.az</div><p>«${esc(topic)}» mövzusunun nəzəriyyəsi bitdi.</p>` +
          `${next ? `<p class="end-next">Növbəti mövzu: <strong>${esc(next)}</strong></p>` : ""}<small>${OWNER}</small>`,
      ),
    );
  }

  // Səhifə nömrələri və mündəricat
  const firstOf = new Map();
  pages.forEach((p, i) => {
    const no = p.querySelector(".no");
    if (no) no.textContent = String(i + 1);
    if (!firstOf.has(p.dataset.sec)) firstOf.set(p.dataset.sec, i);
  });
  holder.querySelectorAll(".toc-list a[data-sec]").forEach((a) => {
    a.querySelector("b").textContent = String(firstOf.get(a.dataset.sec) + 1);
  });
  details.forEach((d, i) => (d.open = wasOpen[i]));
  document.querySelector(".layout")?.remove();
  pages.forEach((p) => book.appendChild(p));
  holder.remove();

  /* ---------- Vərəqləmə ---------- */
  const reduce = matchMedia("(prefers-reduced-motion: reduce)").matches;
  const pf = new St.PageFlip(book, {
    width: pw,
    height: ph,
    size: "fixed",
    showCover: false,
    usePortrait: true,
    autoSize: false,
    drawShadow: true,
    maxShadowOpacity: 0.45,
    flippingTime: reduce ? 250 : 900,
    startZIndex: 0,
    mobileScrollSupport: true,
    clickEventForward: true,
    useMouseEvents: true,
    swipeDistance: 30,
    showPageCorners: !coarse,
    disableFlipByClick: true,
  });
  pf.loadFromHTML(book.querySelectorAll(".page"));

  // Siçanla yalnız səhifənin kənarından tutanda vərəqlənir (ortada mətn seçmək, "Həllə bax" sıxmaq olur).
  const edge = () => Math.min(110, book.getBoundingClientRect().width * (spread ? 0.09 : 0.18));
  const inEdge = (x) => {
    const r = book.getBoundingClientRect();
    return x - r.left < edge() || r.right - x < edge();
  };
  stage.addEventListener("mousedown", (e) => !inEdge(e.clientX) && e.stopPropagation(), true);
  stage.addEventListener("mousemove", (e) => (book.style.cursor = inEdge(e.clientX) ? "grab" : ""));

  const N = pf.getPageCount();
  const sel = bk.querySelector("#bkSel");
  sel.innerHTML =
    `<option value="0">Üz qabığı</option><option value="1">Mündəricat</option>` +
    titles.map((x, i) => `<option value="${i + 2}">${i + 1}. ${esc(x)}</option>`).join("") +
    (hasEnd ? `<option value="${secs.length + 2}">Son</option>` : "");
  function upd() {
    const i = pf.getCurrentPageIndex();
    const two = pf.getOrientation() !== "portrait";
    const last = two ? Math.min(i + 1, N - 1) : i;
    bk.querySelector("#cnt").textContent = `${last > i ? `${i + 1}–${last + 1}` : i + 1} / ${N}`;
    bk.querySelector("#bar").style.width = `${((last + 1) / N) * 100}%`;
    bk.querySelector("#prv").disabled = i === 0;
    bk.querySelector("#nxt").disabled = last >= N - 1;
    sel.value = pages[i]?.dataset.sec ?? "0";
    try {
      sessionStorage.setItem(`bk:${location.pathname}`, sel.value);
    } catch {}
  }
  const go = (sec) => pf.flip(firstOf.get(String(sec)) ?? 0, "top");
  pf.on("flip", upd);
  pf.on("changeOrientation", upd);
  bk.querySelector("#prv").onclick = () => pf.flipPrev("bottom");
  bk.querySelector("#nxt").onclick = () => pf.flipNext("bottom");
  sel.onchange = (e) => go(e.target.value);
  book.addEventListener(
    "click",
    (e) => {
      const a = e.target.closest("a[data-sec]");
      if (!a) return;
      e.preventDefault();
      e.stopPropagation();
      go(a.dataset.sec);
    },
    true,
  );
  addEventListener("keydown", (e) => {
    if (e.target.closest?.("select")) return;
    if (e.key === "ArrowRight") pf.flipNext("bottom");
    if (e.key === "ArrowLeft") pf.flipPrev("bottom");
  });

  // Ölçü dəyişəndə kitab yenidən qurulur (çərçivə 100svh ilə ölçülür — telefonda ünvan sətri onu dəyişmir).
  let rt;
  addEventListener("resize", () => {
    clearTimeout(rt);
    rt = setTimeout(() => {
      if (Math.abs(stage.clientWidth - SW) > 24 || Math.abs(stage.clientHeight - SH) > 24) location.reload();
    }, 300);
  });
  try {
    const s = sessionStorage.getItem(`bk:${location.pathname}`);
    if (s && s !== "0" && firstOf.has(s)) pf.turnToPage(firstOf.get(s));
  } catch {}
  upd();
  document.body.classList.add("ready");
})();
