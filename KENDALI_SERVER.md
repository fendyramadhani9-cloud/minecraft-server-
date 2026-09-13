# Panduan Kendali & Perintah Server Minecraft (Fabric 1.21.11)

Dokumen ini berisi daftar perintah resmi yang dibagi menjadi **Perintah Member (Semua Pemain)**, **Perintah Admin (OP)**, dan **Perintah Konsol Terminal**.

---

## 📋 1. TABEL PERINTAH MEMBER (Semua Pemain / Tanpa OP)
Perintah ini bisa diketik langsung di chat game oleh **semua pemain** (baik pemain Java di PC maupun pemain Bedrock di HP) tanpa memerlukan izin admin / OP:

> ⚠️ **PENTING: Jangan Salah Ketik Perintah Rumah/Base!**
> Mod Fabric modern menggunakan kata **`home` di depan** (bukan `/sethome` seperti plugin server Spigot lama):
> * ❌ **SALAH (Muncul 'Command tidak dikenal'):** `/sethome`, `/set home`, `/gotohome`, `/delhome`, `/setspawn`
> * ✅ **BENAR (Resmi Berfungsi):** `/home set base`, `/home base`, `/home list`, `/home delete base`, `/spawn set`

| Kategori | Perintah di Chat Game | Fungsi / Kegunaan | Contoh Penggunaan |
| :--- | :--- | :--- | :--- |
| **Menandai Base** | `/home set [nama]` | **Menandai lokasi berdiri saat ini sebagai Base/Rumah.** *(Gunakan spasi)* | `/home set base`<br>`/home set tambang` |
| | `/home [nama]` | **Teleportasi instan kembali ke Base/Rumah yang sudah ditandai.** | `/home base` |
| | `/home list` | Melihat daftar nama semua Base/Rumah yang Anda miliki. | `/home list` |
| | `/home delete <nama>` | Menghapus penanda Base yang sudah tidak terpakai. | `/home delete tambang` |
| **Lokasi Mati** | **Otomatis di Layar & Chat** | Saat mati, koordinat persis tempat Anda mati otomatis muncul di layar dan chat! | *(Otomatis saat mati)* |
| | `/back` | **Teleportasi instan kembali ke tempat Anda mati** untuk mengambil barang/drop sebelum hilang! | `/back` |
| **Teleport Mabar**| `/tpa <nama_teman>` | Mengirim permintaan teleportasi ke teman mabar. | `/tpa Yaszhenn` |
| | `/tpaccept` | Menyetujui/menerima permintaan teleport dari teman. | `/tpaccept` |
| | `/tpdeny` | Menolak permintaan teleport dari teman. | `/tpdeny` |
| | `/spawn` | Teleportasi kembali ke titik Spawn utama dunia. | `/spawn` |
| **Tangan Kiri HP** | `/offhand` *(atau `/switchhand`)* | Menukar barang tangan kanan ke tangan kiri (Offhand) untuk pemain HP Bedrock. | `/offhand` |
| **Malam Terang** | `/trigger ToggleFullBright` | Menyalakan / mematikan malam terang (FullBright) permanen. Gua dan malam hari langsung terang benderang. | `/trigger ToggleFullBright` |
| **Chat & Info** | `/msg <nama> <pesan>` | Mengirim pesan pribadi/bisikan rahasia ke teman. | `/msg Yaszhenn sini ada diamond` |
| | `/list` | Melihat siapa saja pemain yang sedang online di dalam server. | `/list` |

> 🗺️ **Panduan Peta & Minimap:**
> * **Pemain PC Java (Laptop Anda):** Tekan tombol **`B`** di keyboard untuk membuat Waypoint penanda baru di radar minimap Anda. Tekan tombol **`M`** untuk membuka peta dunia layar penuh (*Xaero's World Map*).
> * **Pemain HP Bedrock:** Cukup gunakan perintah `/home set base`, `/home base`, dan `/back` di atas. Begitu mati, koordinat kematian otomatis tercetak di layar!

> ⛏️ **Fitur Pasif Otomatis Member (Tanpa Perlu Perintah):**
> * **Dual-Wielding / Tangan Kiri Bebas untuk Bedrock (EmoteOffhand):** Bedrock aslinya hanya bisa memasang tameng/totem di tangan kiri. Sekarang ada **2 cara mudah** memasang barang apa saja (obor, makanan, blok, alat) ke tangan kiri:
>   1. **Ketik `/offhand` di chat** (Paling gampang, cepat, dan pasti!).
>   2. **Mainkan Emote** di layar HP (pilih gerakan emote di menu emote).
> * **Vanilla Graves (Peti Kematian Otomatis):** Saat pemain mati (karena jatuh, monster, atau lava), seluruh isi tas dan armor **otomatis tersimpan rapi di dalam Peti (Chest)** di lokasi kematian. Barang tidak akan berserakan, tidak hangus kena lava, dan tidak akan hilang karena batas waktu 5 menit! Tinggal ketik `/back` untuk langsung sampai di depan peti dan ambil kembali semua barang Anda.
> * **Vein Mining (Ores):** Menambang 1 blok bijih (Diamond, Iron, Gold, Coal, Redstone, Lapis, Netherite) dengan Pickaxe akan **langsung memecahkan seluruh urat bijih** yang bersambung.
> * **Tree Harvester (Pohon):** Menebang 1 balok kayu paling bawah pohon dengan Kapak (*Axe*) akan **langsung merobohkan seluruh pohon**, merontokkan daun, dan menjatuhkan kayu serta bibit pohon.
> * **Petualangan RPG Struktur (Dungeons & Taverns + Towns & Towers):** Menjelajahi area baru akan memunculkan kastil, desa kerajaan, menara pengawas, dan dungeon bawah tanah yang megah dengan 100% blok vanilla (aman dan tampak sangat indah baik di Java PC maupun Bedrock HP).

---

## 👑 2. TABEL PERINTAH ADMIN (Khusus Operator / OP)
Perintah ini hanya bisa dijalankan oleh pemain yang memiliki status Admin / OP (diawali tanda `/` di chat game):

| Kategori | Perintah di Chat Game | Fungsi / Kegunaan |
| :--- | :--- | :--- |
| **Cari Struktur RPG** | `/locate structure towns_and_towers:village_classic` | Mencari titik koordinat desa kerajaan Towns & Towers terdekat. |
| | `/locate structure nova_structures:firewatch_tower_forest` | Mencari benteng/kastil Dungeons & Taverns terdekat. |
| | `/locate structure #minecraft:village` | Mencari desa terdekat apa saja (desa vanilla atau mod). |
| **Atur Spawn Server** | `/spawn set` | Mengatur titik berdiri saat ini menjadi Spawn utama server. |
| **Mode Game** | `/gamemode survival [pemain]` | Mengubah mode ke Survival biasa. |
| | `/gamemode creative [pemain]` | Mengubah mode ke Kreatif (terbang, item tak terbatas). |
| | `/gamemode spectator [pemain]` | Mengubah mode ke Penonton (bisa tembus dinding/tanah). |
| **Teleport** | `/tp <tujuan>` | Teleport diri sendiri ke lokasi pemain lain. Contoh: `/tp Yaszhenn` |
| | `/tp <pemain1> <pemain2>` | Memindahkan pemain 1 ke lokasi pemain 2. |
| | `/tp @s <X> <Y> <Z>` | Teleport ke koordinat tertentu. Contoh: `/tp @s 100 64 -200` |
| | `/tp @a @s` | Memanggil seluruh pemain di server untuk kumpul ke posisi Anda. |
| **Warp Publik** | `/setwarp <nama>` | Membuat titik tujuan publik untuk semua pemain (contoh: `/setwarp pasar`). |
| | `/delwarp <nama>` | Menghapus titik warp publik. |
| | `/warp <nama>` | Teleport ke titik warp publik yang sudah dibuat. |
| **Waktu & Cuaca** | `/time set day` | Mengubah waktu menjadi pagi/siang hari. |
| | `/time set night` | Mengubah waktu menjadi malam hari. |
| | `/weather clear` | Membuat cuaca cerah (menghilangkan hujan/badai). |
| | `/weather rain` / `/weather thunder` | Memunculkan hujan biasa atau badai petir. |
| **Peraturan Dunia** | `/gamerule keepInventory true` | **Keep Inventory Aktif**: Barang dan exp tidak hilang saat mati. |
| | `/gamerule keepInventory false` | Keep Inventory mati (barang jatuh saat mati - default). |
| | `/gamerule mobGriefing false` | Ledakan Creeper / Ghast tidak merusak blok & bangunan. |
| | `/gamerule doFireTick false` | Api tidak bisa membakar atau merambat ke kayu bangunan. |
| **Spawn & Darah** | `/spawnpoint [pemain]` | Mengatur titik respawn saat mati di lokasi berdiri saat ini. |
| | `/kill [pemain]` | Mematikan pemain atau mob tertentu. |
| | `/effect give @s <efek> [detik]` | Memberi efek ramuan (contoh: `/effect give @s speed 60 2`). |
| | `/effect clear [pemain]` | Menghapus semua efek status dari pemain. |

---

## 💻 3. TABEL PERINTAH KONSOL TERMINAL (Jendela CMD Hitam di Laptop)
Ketik perintah ini langsung di jendela hitam server yang sedang berjalan di laptop Anda **(tanpa tanda `/`)**, lalu tekan **Enter**:

| Perintah di Konsol | Fungsi / Kegunaan | Contoh di Terminal CMD |
| :--- | :--- | :--- |
| `stop` | **Mematikan server dengan aman.** Menyimpan semua chunk dan data pemain sebelum menutup. | `stop` |
| `save-all` | Menyimpan seluruh perubahan dunia dan inventori pemain secara instan. | `save-all` |
| `op <nama>` | **Mengangkat pemain menjadi Admin / OP.** | `op fendy`<br>*(Bedrock: `op .NamaBedrock`)* |
| `deop <nama>` | Mencabut hak admin dari seorang pemain. | `deop NamaPemain` |
| `whitelist on` / `off` | Mengaktifkan / mematikan sistem proteksi daftar pemain yang diizinkan masuk. | `whitelist on` |
| `whitelist add <nama>` | Menambahkan teman ke daftar whitelist agar bisa masuk server. | `whitelist add fendy` |
| `whitelist remove <nama>`| Menghapus teman dari whitelist. | `whitelist remove NamaPemain` |
| `kick <nama> [alasan]` | Mengeluarkan paksa pemain yang sedang online dari server. | `kick PemainNakal` |
| `ban <nama> [alasan]` | Memblokir nama pemain secara permanen dari server. | `ban PemainNakal` |
| `say <pesan>` | Mengirim pengumuman resmi server berwarna ungu ke seluruh pemain. | `say Server akan restart dalam 5 menit!` |

---

## 🚀 4. Panduan Menyalakan & Mematikan Server

### A. Cara Menyalakan:
1. Buka folder `D:\games\Server\scripts\`.
2. Double-click file **`start-server.bat`**.
3. Tunggu hingga muncul tulisan `[Server thread/INFO]: Done (...s)!`. Server sekarang online.

### B. Cara Mematikan:
1. Klik pada jendela CMD server yang sedang jalan.
2. Ketik `stop` lalu tekan **Enter**.
3. Tunggu hingga proses penyimpanan dunia selesai sebelum menutup jendela.

---

## 🌐 5. Rangkuman Alamat Sambungan Server

| Jenis Pemain | Tipe Koneksi | Alamat Server (Server Address) | Port |
| :--- | :--- | :--- | :--- |
| **Minecraft Java** (PC Anda Sendiri) | Lokal di Laptop | `localhost` | `25565` (Default) |
| **Minecraft Java** (Teman Luar Rumah) | Publik Internet | `schmidt-affairs.tun.ply.gg` | `25565` (Default) |
| **Minecraft Bedrock** (HP di 1 Wi-Fi Rumah) | Lokal Wi-Fi | `192.168.1.2` | `19132` (Default) |
| **Minecraft Bedrock** (Teman Luar Rumah) | Publik Internet | `schmidt-challenge.tun.ply.gg` | **`61426`** *(Wajib diubah!)* |
