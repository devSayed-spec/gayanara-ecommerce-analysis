# Gayanara: Analisis Produk Terlaris vs Dead Stock

**Peran:** Data Analyst (Proyek Mandiri) | **Tools:** MySQL | **Tanggal:** Juni 2026

*Dataset dan studi kasus disediakan oleh platform Ngulik Data, dikerjakan secara mandiri sebagai bagian dari proses belajar SQL dan analisis bisnis.*

## Pemahaman Bisnis

**Masalah:** Tim buying Gayanara memiliki anggaran restock yang terbatas, tetapi belum punya data yang jelas mengenai produk mana yang benar-benar paling laku, brand mana yang paling banyak menyumbang revenue, dan produk mana yang berisiko kehabisan stok atau justru menumpuk tidak laku di gudang.

**Tujuan:** Menganalisis data penjualan dan inventori Gayanara untuk membantu tim buying mengalokasikan anggaran restock secara lebih tepat sasaran.

**Pertanyaan Bisnis:**

1. Produk apa saja yang termasuk dalam Top 10 produk terlaris?
2. Brand mana yang menghasilkan revenue tertinggi, dan apakah sama dengan brand yang unit terjualnya paling banyak?
3. Produk apa saja yang tergolong *dead stock* (stok tinggi, penjualan nol) dan layak dipertimbangkan untuk diskon?
4. Produk apa saja yang tergolong *lost sales* (riwayat penjualan bagus tapi stok saat ini habis) dan perlu diprioritaskan untuk direstock?

## Proses

- Mengimpor 5 dataset mentah (customers, orders, order_items, products, reviews) ke MySQL
- Memperbaiki tipe data kolom tanggal menggunakan `ALTER TABLE` setelah import awal gagal
- Mengidentifikasi dan mengeluarkan status order yang tidak valid (dibatalkan, dikembalikan) sebelum analisis
- Menggabungkan `order_items`, `orders`, dan `products` untuk mengurutkan Top 10 produk terlaris
- Mengagregasi revenue per brand untuk dibandingkan dengan unit terjual
- Menggunakan subquery dengan `LEFT JOIN` untuk mengidentifikasi dead stock (inventori tidak terjual)
- Menggunakan `INNER JOIN` dengan `WHERE` untuk mengidentifikasi lost sales (stok habis, permintaan tinggi)

## Temuan Utama

**Top 10 Produk Terlaris**
Didominasi oleh dua brand: **Riang Apparel** (4 dari 10 produk) dan **Tropika Style** (3 dari 10 produk), yang bersama-sama menyumbang 70% dari daftar. Sisanya tersebar di Senja Wear, Pesona Indo, dan Kanvas Lokal, menunjukkan permintaan terkonsentrasi pada kategori fashion kasual (dress, kemeja, celana).

**Brand dengan Revenue Tertinggi**
Riang Apparel dan NusaBrand adalah dua brand teratas dari sisi revenue (Rp67,9M vs Rp67,4M, selisih kurang dari 1%). Menariknya, NusaBrand berada di posisi ke-2 meskipun tidak muncul di Top 10 produk terlaris, mengindikasikan brand ini menjual lebih sedikit unit namun dengan harga rata-rata lebih tinggi (kemungkinan strategi premium/margin tinggi dibanding brand volume-driven seperti Riang Apparel).

**Dead Stock (Rekomendasi Diskon)**
Ditemukan satu produk dengan 120 unit stok tidak terjual, kandidat kuat untuk diskon atau bundling.

**Lost Sales (Rekomendasi Prioritas Restock)**
11 produk dengan riwayat penjualan kuat saat ini berstok nol. "Dress Mini Casual" (Riang Apparel) muncul dengan volume lost sales tertinggi, memperkuat posisi Riang Apparel sebagai brand dengan permintaan terkuat, konsisten dengan dominasinya di Top 10.

## Rekomendasi

- **Prioritas restock:** alokasikan anggaran terlebih dahulu untuk produk di daftar Lost Sales, khususnya varian Dress Mini Casual (Riang Apparel), mengingat permintaannya konsisten di Top 10 maupun Lost Sales
- **Diskon/bundling:** dead stock "Leather Belt" (Kanvas Lokal) dengan 120 unit tidak terjual sebaiknya didorong keluar lewat promosi, bukan direstock
- **Evaluasi tingkat brand:** Riang Apparel unggul di permintaan berbasis volume, sementara NusaBrand tampak lebih cocok untuk strategi premium/margin tinggi, kedua brand ini mungkin memerlukan pendekatan restock dan pricing yang berbeda

## Apa yang Saya Pelajari

- `LEFT JOIN` diperlukan agar produk tidak terjual tetap terlihat (dead stock), sementara `INNER JOIN` sudah cukup untuk lost sales karena hanya butuh produk dengan riwayat penjualan
- Pre-agregasi data dalam subquery sebelum join membantu memisahkan order valid dari yang dibatalkan/dikembalikan secara akurat
- Revenue dan unit terjual tidak selalu selaras, brand bisa punya revenue tertinggi tanpa menjual unit paling banyak
- Stok rendah bukan satu masalah tunggal: dead stock butuh diskon, lost sales butuh restock mendesak
- Klaim naratif perlu dicek ulang terhadap hasil data aktual, bukan hanya logika query. Draf awal analisis ini sempat menyebut permintaan merata antar brand, tapi setelah dicek ulang, dua brand ternyata menyumbang 70% dari Top 10

## Files

- `Gayanara_top_10_produk_terlaris.sql` — Top 10 best-selling products
- `Gayanara_Brand_dengan_Revenue_Terbesar.sql` — Revenue by brand
- `Gayanara_Lost_Sales.sql` — Products with strong sales history but zero stock
- `Gayanara_Dead_Stock.sql` — Unsold inventory (zero sales, stock > 0)

## Full Project Write-up
[Notion Portfolio](https://bit.ly/4fgJ6Zv)
