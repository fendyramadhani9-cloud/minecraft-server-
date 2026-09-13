# minecraft-server-

# Minecraft Fabric 1.21.11 Server + Bedrock Crossplay Bridge (All-in-One)

Server Minecraft Java Edition berbasis **Fabric 1.21.11** yang mendukung **Crossplay Bedrock Edition** (Android, iOS, Windows 10/11, Konsol) secara instan menggunakan arsitektur modern terisolasi **ViaProxy** dan **Geyser-ViaProxy**.

Dilengkapi mod optimasi performa tinggi (**Lithium, FerriteCore, Krypton**), struktur RPG megah (**Towns & Towers, Dungeons & Taverns**), fitur quality-of-life lengkap (**Vanilla Graves, Vein Mining, Tree Harvester, Fullbright**), perintah esensial (`/home`, `/tpa`, `/back`, `/spawn`), serta dukungan **Dual-Wielding / Offhand bebas untuk pemain Bedrock HP** (`/offhand` & gerakan emote).

> 💡 **Panduan Lengkap Perintah Konsol & Kontrol**: Lihat [KENDALI_SERVER.md](file:///D:/games/Server/KENDALI_SERVER.md).

---

## ⚡ Cara Pasang & Menjalankan (Quickstart Guide)

### 1. Kebutuhan Sistem
* **Sistem Operasi**: Windows 10 / 11 (64-bit)
* **Java**: **Java 21 (JDK / JRE 64-bit)**.
  * Jika belum memiliki Java 21, unduh dan install dari [Eclipse Adoptium Temurin 21 (LTS)](https://adoptium.net/temurin/releases/?version=21) atau letakkan portable JRE 21 di folder `runtime/`.
* **RAM**: Minimal 4 GB RAM pada komputer host (Server dialokasikan 3 GB).

### 2. Cara Download / Clone Repository
Buka terminal / Git Bash di komputer Anda, lalu jalankan:
```bash
git clone https://github.com/fendyramadhani9-cloud/minecraft-server-.git
cd minecraft-server-
```

### 3. Cara Menjalankan Server
Cukup klik dua kali (double-click) atau jalankan script:
```cmd
scripts\start-server.bat
```
* Script otomatis mendeteksi Java 21 pada komputer Anda.
* Script akan menyalakan **Bridge Bedrock (ViaProxy + Geyser)** di port UDP **19132**.
* Script akan menyalakan **Backend Minecraft Fabric 1.21.11** di port TCP **25565**.
* Tunggu sampai muncul tulisan `[INFO] Done! For help, type "help"` di jendela server.

### 4. Cara Masuk ke Server (Join Game)
* **Pemain Java Edition (Komputer / Laptop):**
  * Versi: Minecraft Java 1.21.11 (Resmi maupun Offline/Cracked Launcher).
  * Masuk via: `localhost:25565` (jika main di PC host) atau IP lokal WiFi `192.168.x.x:25565`.
* **Pemain Bedrock Edition (HP Android / iPhone / Windows 10/11 / Konsol):**
  * Versi: Bedrock terbaru.
  * Server IP: IP komputer host (misal `192.168.1.2` jika 1 WiFi) atau alamat Public Tunnel Playit.
  * Port: `19132` (atau port Playit publik).
  * Login akun Microsoft/Xbox gratis (tanpa perlu beli Java Edition).

---

## 📋 Tabel Perintah Server (Member & Admin)

Panduan lengkap kendali server dan daftar perintah terperinci dapat dilihat di [KENDALI_SERVER.md](file:///D:/games/Server/KENDALI_SERVER.md).

> ⚠️ **PENTING: Jangan Salah Ketik Perintah Rumah/Base!**
> Mod Fabric modern menggunakan kata **`home` di depan** (bukan `/sethome` seperti plugin lama):
> * ❌ **SALAH (Command tidak dikenal):** `/sethome`, `/set home`, `/gotohome`, `/delhome`, `/setspawn`
> * ✅ **BENAR (Resmi):** `/home set base`, `/home base`, `/home list`, `/home delete base`, `/spawn set`

### A. Perintah Member (Semua Pemain Java & Bedrock / Tanpa OP)
| Kategori | Perintah di Chat | Fungsi / Kegunaan | Contoh Penggunaan |
| :--- | :--- | :--- | :--- |
| **Tandai Base** | `/home set [nama]` | Menandai lokasi berdiri saat ini sebagai Base. | `/home set base` *(atau `/home set rumah`)* |
| **Pulang Base** | `/home [nama]` | Teleportasi instan kembali ke Base yang ditandai. | `/home base` |
| **Daftar Base** | `/home list` | Melihat daftar nama semua Base yang Anda miliki. | `/home list` |
| **Hapus Base** | `/home delete [nama]` | Menghapus titik Base yang sudah tidak terpakai. | `/home delete tambang` |
| **Kembali Kematian** | `/back` | Teleportasi instan ke titik mati untuk ambil barang. | `/back` |
| **Titik Mati** | *(Otomatis)* | Koordinat mati otomatis tercetak di layar & chat. | *(Otomatis saat mati)* |
| **Mabar Teleport** | `/tpa <nama_teman>` | Mengirim permintaan teleportasi ke teman. | `/tpa ChoppyMite4355` |
| | `/tpaccept` | Menerima ajakan teleport dari teman. | `/tpaccept` |
| | `/tpdeny` | Menolak ajakan teleport dari teman. | `/tpdeny` |
| **Titik Spawn** | `/spawn` | Teleportasi kembali ke titik Spawn utama server. | `/spawn` |
| **Tangan Kiri HP** | `/offhand` *(atau `/switchhand`)* | Menukar barang tangan kanan ke tangan kiri (Offhand) di Bedrock HP. | `/offhand` |
| **Malam Terang** | `/trigger ToggleFullBright` | Menyalakan/mematikan malam terang (FullBright). | `/trigger ToggleFullBright` |
| **Pesan & List** | `/msg <nama> <pesan>` | Mengirim bisikan pribadi ke teman. | `/msg ChoppyMite4355 sini ada diamond` |
| | `/list` | Melihat siapa saja pemain yang sedang online. | `/list` |

> 🎮 **Fitur Pasif & Kontrol Otomatis Member:**
> * **Dual-Wielding Bedrock (Tangan Kiri HP):** Ada 2 cara praktis menaruh obor/makanan/blok di tangan kiri:
>   1. **Ketik `/offhand` di chat** (Paling mudah & instan!).
>   2. **Mainkan Emote** di layar HP (pilih gerakan emote di menu emote).
> * **Vanilla Graves:** Saat mati, semua barang dan armor masuk ke Peti (Chest) terlindungi. Tidak hilang dan tidak terbakar lava. Tinggal ketik `/back` untuk ambil kembali.
> * **Vein Mining:** Tambang 1 blok bijih (Diamond, Iron, Gold, dll) dengan Pickaxe, seluruh urat bijih hancur bersamaan.
> * **Tree Harvester:** Tebang 1 kayu paling bawah dengan Kapak, seluruh pohon roboh seketika.

---

### B. Perintah Admin (Khusus Pemilik Server / OP)
| Kategori | Perintah di Chat Game | Fungsi / Kegunaan | Contoh |
| :--- | :--- | :--- | :--- |
| **Cari Struktur RPG** | `/locate structure towns_and_towers:village_classic` | Mencari koordinat desa kerajaan Towns & Towers terdekat. | `/locate structure towns_and_towers:village_classic` |
| | `/locate structure nova_structures:firewatch_tower_forest` | Mencari menara/kastil Dungeons & Taverns terdekat. | `/locate structure nova_structures:firewatch_tower_forest` |
| | `/locate structure #minecraft:village` | Mencari desa apa saja (vanilla maupun mod) terdekat. | `/locate structure #minecraft:village` |
| **Atur Titik Spawn** | `/spawn set` | Menjadikan lokasi berdiri saat ini sebagai spawn server. | `/spawn set` |
| **Warp Publik** | `/warp set <nama>` | Membuat titik warp publik untuk semua pemain. | `/warp set pasar` |
| | `/warp <nama>` | Teleport ke titik warp bersama. | `/warp pasar` |
| | `/warp delete <nama>` | Menghapus titik warp bersama. | `/warp delete pasar` |
| **Mode Game** | `/gamemode <survival\|creative\|spectator>` | Mengubah mode permainan pemain. | `/gamemode creative fendy` |
| **Teleport Admin** | `/tp <pemain>` / `/tp @a @s` | Teleportasi instan ke pemain atau panggil semua. | `/tp ChoppyMite4355` |
| **Waktu & Cuaca** | `/time set day` / `night` | Mengubah waktu menjadi pagi atau malam. | `/time set day` |
| | `/weather clear` | Menghilangkan hujan dan badai. | `/weather clear` |
| **Aturan Dunia** | `/gamerule keepInventory true` | Barang dan exp tidak hilang saat mati. | `/gamerule keepInventory true` |
| **Konsol CMD** | `op <nama>` / `deop <nama>` | Mengangkat / mencabut admin (di jendela CMD). | `op fendy` |

---

## 1. Spesifikasi Server

* **Minecraft Java Edition**: 1.21.11 (Vanilla release terakhir seri 1.x)
* **Server Platform / Mod Loader**: Fabric Loader
* **Gameplay Mode**: Survival Vanilla
* **Kesulitan (Difficulty)**: Normal
* **Autentikasi Java**: Offline / Cracked (`online-mode=false`)
* **Autentikasi Bedrock**: Floodgate (`auth-type: floodgate`, login via akun Microsoft/Xbox tanpa perlu membeli Java Edition)
* **Alokasi RAM**: 3 GB Minimum (`-Xms3G`), 3 GB Maksimum (`-Xmx3G`)
* **Alokasi CPU**: 2 Logical Processors (`-XX:ActiveProcessorCount=2`)
* **Server GUI**: Headless (`nogui`)
* **Host OS**: Windows 11 / Windows Laptop
* **Network Mode**: Local LAN / Loopback testing (tidak diexpose ke internet publik)

---

## 2. Struktur Folder

```
D:\games\Server\
├── runtime\                     # Portable OpenJDK 21 Temurin Runtime
│   ├── bin\
│   │   ├── java.exe
│   │   └── ...
│   └── ...
├── server\                      # Direktori Server Utama Fabric 1.21.11 (Terisolasi)
│   ├── fabric-server-launch.jar # Fabric Server Launcher resmi
│   ├── server.jar               # Minecraft Vanilla 1.21.11 server jar
│   ├── server.properties        # Konfigurasi server (port 25565, offline-mode, survival)
│   ├── eula.txt                 # EULA Mojang (eula=true)
│   ├── world\                   # World data survival (dibuat otomatis)
│   ├── mods\                    # Mod optimasi server-side
│   │   ├── fabric-api-0.141.6+1.21.11.jar
│   │   ├── lithium-fabric-0.21.4+mc1.21.11.jar
│   │   └── ferritecore-8.2.0-fabric.jar
│   └── libraries\               # Library runtime Minecraft & Fabric
├── bridge\                      # Direktori Bridge Crossplay (Terisolasi)
│   ├── ViaProxy-3.4.12.jar      # Standalone multi-version proxy by ViaVersion
│   ├── viaproxy.yml             # Konfigurasi ViaProxy (Target: 127.0.0.1:25565)
│   └── plugins\
│       ├── Geyser-ViaProxy.jar  # Plugin Geyser untuk ViaProxy
│       └── Geyser\
│           └── config.yml       # Konfigurasi Geyser (Bedrock UDP 19132, auth: floodgate)
├── scripts\                     # Script otomasi Windows
│   ├── start-server.bat         # Start terkoordinasi (Server + Bridge)
│   ├── stop-server.bat          # Menghentikan server & bridge
│   ├── start-backend.bat        # Start backend Java server saja
│   └── start-bridge.bat         # Start bridge saja
├── backups\                     # Direktori penyimpanan cadangan world
└── README.md                    # Dokumentasi ini
```

---

## 3. Versi Setiap Komponen

Semua dependensi diverifikasi dari sumber dan API resmi:

| Komponen | Versi | Sumber Resmi | Keterangan |
| :--- | :--- | :--- | :--- |
| **Java Runtime** | OpenJDK 21.0.12.1+1 LTS | Eclipse Adoptium Temurin | Portable JRE 21, 64-bit |
| **Minecraft Server** | 1.21.11 | Mojang Studios | Versi target backend |
| **Fabric Loader** | 0.19.5 | FabricMC Meta API | Loader stabil untuk 1.21.11 |
| **Fabric Installer** | 1.1.2 | FabricMC Maven | Komponen bootstrapper |
| **Fabric API** | 0.141.6+1.21.11 | Modrinth (FabricMC) | Library API Fabric untuk 1.21.11 |
| **Lithium** | 0.21.4+mc1.21.11 | Modrinth (CaffeineMC) | Optimasi fisika, chunk, & AI entity |
| **FerriteCore** | 8.2.0-fabric | Modrinth (malte0811) | Optimasi alokasi RAM & memory data |
| **ViaProxy** | 3.4.12 | GitHub ViaVersion | Standalone protocol translation proxy |
| **Geyser** | 2.11.2 (Build 1235) | GeyserMC Downloads API | Mendukung Bedrock 26.0–26.45 |
| **Floodgate** | Terintegrasi di Geyser | GeyserMC | Mode autentikasi Microsoft/Xbox |

---

## 4. Cara Menjalankan Server (Start)

Cukup jalankan script batch utama:

```cmd
scripts\start-server.bat
```

Atau double-click `scripts\start-server.bat` dari File Explorer Windows.

### Apa yang dilakukan script ini?
1. Otomatis mendeteksi Java 21 dari `runtime\bin\java.exe` (atau sistem `JAVA_HOME` jika ada).
2. Menjalankan **Bedrock Bridge (ViaProxy + Geyser)** di jendela terpisah yang diminimalkan.
3. Menjalankan **Minecraft Fabric 1.21.11 Server** pada jendela utama dengan parameter:
   `-Xms3G -Xmx3G -XX:ActiveProcessorCount=2 nogui`
4. Menunggu hingga console server menampilkan `Done!`.

> **Catatan Troubleshooting Terisolasi:**
> - Jika hanya ingin menjalankan backend Java server tanpa bridge: jalankan `scripts\start-backend.bat`.
> - Jika hanya ingin menguji bridge: jalankan `scripts\start-bridge.bat`.

---

## 5. Cara Menghentikan Server (Stop)

1. **Cara Utama (Sangat Direkomendasikan)**:
   Pada jendela console server utama yang sedang berjalan, ketik:
   ```text
   stop
   ```
   Lalu tekan `Enter`.
   Server akan menyimpan seluruh chunk dunia (`world`), menyimpan data pemain, menutup port TCP 25565, dan secara otomatis menutup proses bridge.

2. **Cara Darurat**:
   Jalankan script:
   ```cmd
   scripts\stop-server.bat
   ```

---

## 6. Panduan Koneksi Java Edition

### A. Main di Komputer/Laptop yang Sama (Lokal):
* **Versi Client**: Minecraft Java Edition 1.21.11
* **Server Address**: `localhost:25565` atau `127.0.0.1:25565`

### B. Main Jarak Jauh / Internet (Teman di Luar Rumah):
* **Versi Client**: Minecraft Java Edition 1.21.11
* **Server Address**:
  ```text
  schmidt-affairs.tun.ply.gg
  ```
  *(Tanpa perlu port tambahan, teman tinggal ketik domain ini di Direct Connect/Add Server)*
* **Akun**: Akun resmi (Microsoft) maupun Offline/Cracked Launcher dapat bergabung langsung.

---

## 7. Panduan Koneksi Bedrock Edition

### A. Main di Komputer/Laptop yang Sama atau Satu Wi-Fi:
* **Server Address**: `127.0.0.1` (atau IP LAN `192.168.1.2`)
* **Port**: `19132`

### B. Main Jarak Jauh / Internet (Teman di Luar Rumah):
* **Versi Client**: Bedrock terbaru (Android, iOS, Windows 10/11, Konsol)
* **Server Name**: Bebas diisi (misal `Server Mabar`)
* **Server Address**:
  ```text
  schmidt-challenge.tun.ply.gg
  ```
* **Port**:
  ```text
  61426
  ```
* **Autentikasi**: Pemain Bedrock masuk menggunakan akun Microsoft/Xbox mereka secara gratis. **Tidak memerlukan pembelian Minecraft Java Edition**.

---

## 8. Alokasi RAM (Memory Allocation)

JVM dikonfigurasi dengan alokasi heap yang presisi dan stabil:
* **Minimum Heap (`-Xms3G`)**: 3 GB dialokasikan sejak server pertama kali boot untuk mencegah jeda garbage collection akibat resize heap berkala.
* **Maksimum Heap (`-Xmx3G`)**: 3 GB batas maksimal memori JVM.
* Didukung oleh mod **FerriteCore** yang mengurangi penggunaan heap memori untuk data blockstate dan model hingga 30-40%.

---

## 9. Alokasi CPU (Processor Count)

JVM dibatasi untuk hanya menggunakan 2 logical processor cores:
* **Flag JVM**: `-XX:ActiveProcessorCount=2`
* **Tujuan**: Mencegah proses server membebani seluruh CPU laptop, menjaga temperatur dan konsumsi daya tetap stabil selama bermain bersamaan dengan game client.
* Mod **Lithium** mengoptimalkan algoritma kalkulasi tick, chunk loading, dan mob AI agar berjalan sangat efisien di dalam batasan 2 threads ini.

---

## 10. Troubleshooting

### 1. Port 25565 atau 19132 sudah digunakan (Address already in use)
Jika port bertabrakan dengan proses server lain yang belum tertutup:
1. Buka PowerShell dan cari PID proses yang menggunakan port:
   ```powershell
   Get-NetTCPConnection -LocalPort 25565 -ErrorAction SilentlyContinue
   Get-NetUDPEndpoint -LocalPort 19132 -ErrorAction SilentlyContinue
   ```
2. Tutup proses menggunakan PID tersebut:
   ```powershell
   Stop-Process -Id <PID> -Force
   ```

### 2. Pemain Bedrock tidak bisa connect ke UDP 19132
* Pastikan Windows Defender Firewall tidak memblokir koneksi lokal untuk Java atau UDP.
* Pastikan bridge sedang berjalan (cek apakah jendela `Minecraft Bridge` ada di taskbar).

### 3. Server tiba-tiba lambat (lag / tick drop)
* Kurangi `view-distance` di `server/server.properties` dari 10 menjadi 8 atau 6.
* Kurangi `simulation-distance` dari 10 menjadi 6 atau 4.

### 4. Kenapa Pemain Terputus Saat AFK / Layar HP Terkunci?
* **Penyebab (Sisi HP Android / iOS)**:
  * Di server utama, waktu timeout sudah diatur ke `0` (`player-idle-timeout=0`), artinya **server tidak pernah menendang pemain yang diam**.
  * Namun pada HP Android dan iPhone, ketika layar mati (screen lock) atau pemain beralih ke aplikasi lain (minimize), sistem operasi HP secara otomatis **mematikan koneksi background WiFi / data dan men-suspend aplikasi Minecraft** untuk menghemat baterai.
  * Karena Bedrock menggunakan UDP RakNet, ketika HP berhenti mengirim paket heartbeat/keepalive selama ~30 detik, bridge Geyser mendeteksi `Bedrock client timed out` lalu memutuskan koneksi.
* **Solusi**:
  * Matikan fitur *Battery Optimization / Hemat Daya* khusus untuk aplikasi Minecraft di pengaturan HP.
  * Atur waktu mati layar HP (Screen Timeout) menjadi lebih lama atau *Never* saat ingin AFK di farm/base.
  * Tetap biarkan aplikasi Minecraft berada di layar aktif (tidak di-minimize).

---

## 11. Catatan Keamanan Penting (`online-mode=false`)

Server ini dikonfigurasi dengan:
```properties
online-mode=false
enforce-secure-profile=false
```

### Implikasi Keamanan:
1. **Pemalsuan Identitas / Nickname**:
   Dalam mode `online-mode=false`, server tidak memvalidasi session token pemain ke Mojang authentication server. Siapapun yang mengetahui nickname seorang pemain (termasuk nickname OP / admin) dapat masuk menggunakan cracked launcher dengan nickname tersebut dan memperoleh privilege pemilik akun.
2. **UUID Pemain Tidak Terikat Akun Mojang**:
   UUID dihitung secara offline berdasarkan hash nama. Jika nickname diubah, inventory dan status pemain akan reset.
3. **Peringatan Jaringan Publik**:
   **JANGAN PERNAH** mem-forward port 25565 ke internet publik (via router port forwarding atau tunnel publik seperti Playit/ngrok) tanpa proteksi tambahan!
4. **Rekomendasi Proteksi Jika Dibuka ke Teman**:
   - Aktifkan whitelist:
     Ketik `/whitelist on` di console, lalu daftarkan nickname pemain dengan `/whitelist add <nama_pemain>`.
   - Atau pasang mod login/password autentikasi (seperti SimpleLogin / AuthMe equivalent untuk Fabric) jika server ingin dimainkan secara offline oleh beberapa orang.

---

## 12. Analisis Kompatibilitas Dependensi

Arsitektur server ini dibangun mengikuti prinsip kehati-hatian kompatibilitas:

1. **Backend Fabric 1.21.11**:
   Menggunakan Fabric Loader 0.19.5 dan Fabric API 0.141.6 khusus 1.21.11. Optimasi Lithium dan FerriteCore dipilih pada versi rilis stabil yang secara eksplisit mendukung 1.21.11.
2. **Kebutuhan Bridge Terisolasi**:
   Geyser rilis terbaru (2.11.2) mengemulasi protokol Java modern (26.x) agar dapat menerima Bedrock client terkini (26.0–26.45). Jika Geyser dihubungkan langsung ke backend Java 1.21.11, koneksi akan ditolak karena perbedaan protokol packet.
3. **Peran ViaProxy**:
   ViaProxy bertindak sebagai penerjemah protokol bidirectional antara Geyser (protokol 26.x) dan backend Fabric (protokol 1.21.11), sehingga Bedrock versi terbaru dapat bermain di dunia Fabric 1.21.11 secara stabil tanpa lag atau mod gameplay tambahan.
