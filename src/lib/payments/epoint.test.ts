import { createHash } from "node:crypto";
import { describe, expect, it } from "vitest";
import { encodeData, signData, verifyEpoint } from "./epoint";

const KEY = "test-private-key";

describe("Epoint imzası", () => {
  it("data = base64(json), signature = base64(sha1_raw(key + data + key))", () => {
    const data = encodeData({ public_key: "i000000001", amount: 12.9, order_id: "2v-1" });
    expect(JSON.parse(Buffer.from(data, "base64").toString("utf8"))).toEqual({ public_key: "i000000001", amount: 12.9, order_id: "2v-1" });
    const raw = createHash("sha1").update(KEY + data + KEY).digest();
    expect(raw).toHaveLength(20);
    expect(signData(data, KEY)).toBe(raw.toString("base64"));
  });

  it("düzgün imzalı bildirişi açır, dəyişdirilmişi və başqa açarla imzalanmışı rədd edir", () => {
    const data = encodeData({ order_id: "2v-1", status: "success", amount: 6.9 });
    expect(verifyEpoint(data, signData(data, KEY), KEY)).toEqual({ order_id: "2v-1", status: "success", amount: 6.9 });

    const forged = encodeData({ order_id: "2v-1", status: "success", amount: 0.01 });
    expect(verifyEpoint(forged, signData(data, KEY), KEY)).toBeNull();
    expect(verifyEpoint(data, signData(data, "other-key"), KEY)).toBeNull();
    expect(verifyEpoint(data, "", KEY)).toBeNull();
  });

  it("imza düzgün, amma data JSON deyilsə — null", () => {
    const data = Buffer.from("not json").toString("base64");
    expect(verifyEpoint(data, signData(data, KEY), KEY)).toBeNull();
  });
});
