<div align="center">

<img src="https://capsule-render.vercel.app/api?type=waving&color=gradient&customColorList=1,11,21&height=200&section=header&text=Minecraft%20Fabric%201.21.11&fontSize=42&fontColor=ffffff&animation=fadeIn&fontAlignY=38&desc=Universal%20Crossplay%20Server%20(Java%20%2B%20Bedrock)&descAlignY=62&descAlign=50" width="100%" alt="Header Banner"/>

# Minecraft Fabric 1.21.11 Server + Bedrock Crossplay Bridge

[![Minecraft Version](https://img.shields.io/badge/Minecraft-1.21.11-2ea44f?style=for-the-badge&logo=minecraft&logoColor=white)](https://www.minecraft.net/)
[![Fabric Loader](https://img.shields.io/badge/Fabric-0.19.5-dbaf7b?style=for-the-badge&logo=fabric&logoColor=white)](https://fabricmc.net/)
[![Java Runtime](https://img.shields.io/badge/Java-21%20LTS-ED8B00?style=for-the-badge&logo=openjdk&logoColor=white)](https://adoptium.net/)
[![GeyserMC](https://img.shields.io/badge/Bedrock%20Crossplay-GeyserMC%202.11.2-2ecc71?style=for-the-badge&logo=geysermc&logoColor=white)](https://geysermc.org/)
[![Status](https://img.shields.io/badge/Performance-Optimized%20Aikar%27s%20Flags-00ffcc?style=for-the-badge)](https://github.com/fendyramadhani9-cloud/minecraft-server-)

<p align="center">
  <b>Server Minecraft Java Edition berbasis Fabric 1.21.11 yang mendukung koneksi lintas platform (Crossplay) Bedrock Edition (Android, iOS, Windows 10/11, Konsol) secara native, ringan, dan stabil.</b>
</p>

</div>

---

## Ringkasan Fitur & Keunggulan

* **Arsitektur Terisolasi Modern**: Backend Java 1.21.11 berjalan murni dan bersih; komponen penerjemah protokol Bedrock ditangani oleh ViaProxy dan Geyser-ViaProxy di proses terpisah.
* **Performa Tinggi & Anti-Lag**:
  * Menggunakan mod optimasi inti: **Lithium** (tick physics & AI), **FerriteCore** (efisiensi RAM 30–40%), dan **Krypton** (optimasi stack jaringan).
  * Dilengkapi **Aikar's Garbage Collector Flags** untuk mencegah lag spike dan membatasi konsumsi CPU tetap sejuk (2 core).
  * Penyetelan MTU 1280 dan penonaktifan pembatasan paket agresif RakNet untuk kelancaran koneksi di jaringan seluler maupun Wi-Fi.
* **Eksplorasi Dunia & Struktur RPG**:
  * **Towns & Towers**: Menghadirkan desa dan benteng kerajaan yang bervariasi di seluruh bioma.
  * **Dungeons & Taverns**: Menara pengawas, kastil bawah tanah, dan struktur petualangan baru.
* **Fitur Quality-of-Life (QoL)**:
  * **Vanilla Graves**: Barang dan EXP tersimpan aman di dalam peti saat mati (bebas hilang atau terbakar lava).
  * **Vein Mining & Tree Harvester**: Menambang urat bijih dan menebang satu pohon utuh dalam satu ayunan alat.
  * **Fullbright**: Fitur pencahayaan malam melalui perintah `/trigger ToggleFullBright`.
  * **Essential Commands**: Sistem Base (`/home`), Teleportasi Mabar (`/tpa`), Titik Mati (`/back`), dan Titik Kumpul (`/spawn`).
* **Dukungan Penuh Pemain Bedrock HP**:
  * Mendukung **Dual-Wielding Bebas** (menaruh obor, makanan, atau blok apa saja di tangan kiri) melalui perintah `/offhand` atau langsung via gerakan emote di layar HP.
  * Autentikasi Floodgate: Pemain Bedrock masuk menggunakan akun Microsoft/Xbox gratis tanpa kewajiban membeli Java Edition.

> [!NOTE]
> Panduan lengkap perintah konsol dan kendali server dapat dibaca pada [KENDALI_SERVER.md](file:///D:/games/Server/KENDALI_SERVER.md).

---

## Panduan Pemasangan & Menjalankan (Quickstart Guide)

### 1. Kebutuhan Sistem
* **Sistem Operasi**: Windows 10 / 11 (64-bit).
* **Java Runtime**: **Java 21 (JDK / JRE 64-bit)**.
  * Unduh resmi: [Eclipse Adoptium Temurin 21 (LTS)](https://adoptium.net/temurin/releases/?version=21).
  * Atau gunakan portable runtime di dalam folder `runtime/`.
* **Memori (RAM)**: Komputer host disarankan memiliki minimal 4 GB RAM (Server dialokasikan 3 GB).

### 2. Unduh / Clone Repository
Buka terminal (PowerShell / Command Prompt / Git Bash), lalu jalankan:
```bash
git clone https://github.com/fendyramadhani9-cloud/minecraft-server-.git
cd minecraft-server-
```

### 3. Menjalankan Server (1-Klik)
Jalankan script batch utama:
```cmd
scripts\start-server.bat
```
Atau klik dua kali pada file `scripts\start-server.bat` di File Explorer.

Script otomatis melakukan:
1. Mendeteksi lokasi instalasi Java 21.
2. Menjalankan **Bedrock Bridge (ViaProxy + Geyser)** pada port **19132 UDP**.
3. Menjalankan **Server Utama Fabric 1.21.11** pada port **25565 TCP** dengan alokasi RAM optimal.
4. Server siap dimainkan setelah muncul teks `[INFO] Done! For help, type "help"`.

### 4. Cara Bergabung ke Server (Join Game)

#### A. Pemain Java Edition (PC / Laptop)
* **Versi Client**: Minecraft Java Edition 1.21.11 (Akun Resmi atau Launcher Offline).
* **Server Address**:
  * Komputer yang sama (Localhost): `localhost:25565` atau `127.0.0.1:25565`
  * Satu jaringan Wi-Fi (LAN): `192.168.x.x:25565`
  * Jarak Jauh (Internet Publik): `schmidt-affairs.tun.ply.gg` *(Direct Connect tanpa port)*

#### B. Pemain Bedrock Edition (Android, iOS, Windows 10/11, Konsol)
* **Versi Client**: Minecraft Bedrock versi terbaru (26.0–26.45).
* **Server Name**: Bebas (misal: `Server Mabar`)
* **Server Address & Port**:
  * Satu jaringan Wi-Fi (Lokal): IP komputer host (contoh: `192.168.1.2`), Port: `19132`
  * Jarak Jauh (Internet Publik): `schmidt-challenge.tun.ply.gg`, Port: `61426`
* **Autentikasi**: Masuk menggunakan akun Microsoft / Xbox masing-masing secara gratis.

---

## Daftar Perintah Lengkap (Member & Admin)

> [!IMPORTANT]
> **Format Perintah Base / Rumah:**
> Mod Fabric modern menggunakan sintaks kata **`home` di depan**:
> * **SALAH:** `/sethome`, `/set home`, `/gotohome`, `/delhome`
> * **BENAR:** `/home set base`, `/home base`, `/home list`, `/home delete base`, `/spawn set`

### 1. Perintah Member (Semua Pemain / Tanpa OP)

| Kategori | Perintah di Chat | Kegunaan | Contoh |
| :--- | :--- | :--- | :--- |
| **Base Pribadi** | `/home set [nama]` | Menandai lokasi berdiri saat ini sebagai Base. | `/home set base` |
| | `/home [nama]` | Teleportasi instan kembali ke Base. | `/home base` |
| | `/home list` | Menampilkan daftar seluruh Base yang dimiliki. | `/home list` |
| | `/home delete [nama]` | Menghapus titik Base yang sudah tidak digunakan. | `/home delete base` |
| **Kembali Kematian** | `/back` | Teleportasi instan ke titik mati terakhir. | `/back` |
| | *(Otomatis)* | Koordinat kematian tercetak otomatis di layar & chat. | *(Otomatis saat mati)* |
| **Teleportasi Mabar** | `/tpa <nama>` | Mengajukan permintaan teleportasi ke teman. | `/tpa ChoppyMite4355` |
| | `/tpaccept` | Menerima permintaan teleportasi dari teman. | `/tpaccept` |
| | `/tpdeny` | Menolak permintaan teleportasi dari teman. | `/tpdeny` |
| **Titik Kumpul** | `/spawn` | Teleportasi kembali ke titik Spawn utama server. | `/spawn` |
| **Tangan Kiri Bedrock** | `/offhand` | Menukar barang tangan kanan ke tangan kiri di Bedrock HP. | `/offhand` |
| **Pencahayaan** | `/trigger ToggleFullBright` | Menyalakan / mematikan fitur malam terang (FullBright). | `/trigger ToggleFullBright` |
| **Komunikasi** | `/msg <nama> <pesan>` | Mengirim pesan bisikan rahasia ke teman. | `/msg ChoppyMite4355 sini` |
| | `/list` | Melihat daftar siapa saja pemain yang sedang online. | `/list` |

> [!TIP]
> **Dua Cara Menggunakan Offhand di HP Bedrock:**
> 1. **Ketik `/offhand` di chat** (Instan dan langsung memindahkan barang yang dipegang).
> 2. **Gunakan Emote** pada tombol emote di layar HP untuk menukar barang secara otomatis.

---

### 2. Perintah Admin (Khusus OP / Pemilik Server)

| Kategori | Perintah di Chat Game | Kegunaan | Contoh |
| :--- | :--- | :--- | :--- |
| **Pencarian Struktur RPG** | `/locate structure towns_and_towers:village_classic` | Mencari desa kerajaan Towns & Towers terdekat. | `/locate structure towns_and_towers:village_classic` |
| | `/locate structure nova_structures:firewatch_tower_forest` | Mencari menara pengawas Dungeons & Taverns. | `/locate structure nova_structures:firewatch_tower_forest` |
| | `/locate structure #minecraft:village` | Mencari desa apa saja (vanilla maupun mod) terdekat. | `/locate structure #minecraft:village` |
| **Titik Spawn Server** | `/spawn set` | Menjadikan koordinat saat ini sebagai titik spawn server. | `/spawn set` |
| **Warp Bersama** | `/warp set <nama>` | Membuat lokasi warp publik untuk semua member. | `/warp set pasar` |
| | `/warp <nama>` | Teleportasi langsung ke titik warp publik. | `/warp pasar` |
| | `/warp delete <nama>` | Menghapus titik warp bersama. | `/warp delete pasar` |
| **Mode Permainan** | `/gamemode <survival\|creative\|spectator>` | Mengubah mode permainan pemain. | `/gamemode creative fendy` |
| **Teleportasi Instan** | `/tp <pemain>` / `/tp @a @s` | Menarik atau mengunjungi pemain secara instan. | `/tp ChoppyMite4355` |
| **Waktu & Cuaca** | `/time set day` / `night` | Mengatur waktu dunia game. | `/time set day` |
| | `/weather clear` | Membersihkan hujan dan badai petir. | `/weather clear` |
| **Aturan Dunia** | `/gamerule keepInventory true` | Mengatur agar barang tidak hilang saat mati. | `/gamerule keepInventory true` |
| **Hak Akses Console** | `op <nama>` / `deop <nama>` | Memberi atau mencabut hak admin di jendela CMD. | `op fendy` |

---

## Struktur Direktori Proyek

```
D:\games\Server\
├── .gitignore                   # Proteksi data pribadi, world, dan token tunnel
├── README.md                    # Dokumentasi utama proyek
├── KENDALI_SERVER.md            # Dokumentasi panduan operasional server
├── scripts\                     # Script otomasi pengelolaan server
│   ├── start-server.bat         # Start terkoordinasi (Server + Bridge)
│   ├── stop-server.bat          # Menghentikan seluruh proses server
│   ├── start-backend.bat        # Start server Fabric saja
│   ├── start-bridge.bat         # Start bridge Bedrock saja
│   ├── check-status.bat         # Cek status port dan proses aktif
│   ├── export-world.bat         # Cadangkan / export data dunia
│   └── import-world.bat         # Pulihkan / import data dunia
├── server\                      # Direktori Server Utama Fabric 1.21.11
│   ├── fabric-server-launch.jar # Bootstrapper Fabric Server
│   ├── server.properties        # Konfigurasi parameter server
│   ├── eula.txt                 # Persetujuan EULA Mojang
│   ├── config\                  # Konfigurasi mod (EssentialCommands, Lithium, dll)
│   └── mods\                    # Mod server-side terpasang
└── bridge\                      # Direktori Bridge Crossplay Terisolasi
    ├── ViaProxy-3.4.12.jar      # Proxy multi-version translator
    ├── viaproxy.yml             # Konfigurasi ViaProxy (Target: 127.0.0.1:25565)
    └── plugins\
        ├── Geyser-ViaProxy.jar  # Plugin Geyser untuk Bedrock UDP 19132
        └── Geyser\
            ├── config.yml       # Konfigurasi Geyser (Floodgate, MTU, dsb)
            └── extensions\
                └── EmoteOffhand.jar # Ekstensi Dual-Wielding Bedrock
```

---

## Spesifikasi Teknis Server

| Komponen | Spesifikasi | Keterangan |
| :--- | :--- | :--- |
| **Minecraft Java Backend** | Versi 1.21.11 | Rilis resmi terakhir lini 1.21.x |
| **Mod Loader** | Fabric Loader 0.19.5 | Menggunakan Fabric API 0.141.6 |
| **Java Virtual Machine** | OpenJDK 21 LTS (64-bit) | Dijalankan dengan Aikar's Garbage Collection Flags |
| **Alokasi Memori Heap** | `-Xms3G -Xmx3G` | Heap tetap 3 GB untuk mencegah jeda alokasi RAM |
| **Pembatasan Prosesor** | `-XX:ActiveProcessorCount=2` | Menjaga CPU tetap dingin dan hemat daya |
| **Crossplay Engine** | ViaProxy 3.4.12 + Geyser 2.11.2 | Mendukung protokol Bedrock 26.0–26.45 |
| **Mode Autentikasi** | Hybrid (`offline-mode` + Floodgate) | Java Offline/Cracked & Bedrock Xbox resmi |

---

## Panduan Troubleshooting

### 1. Port 25565 atau 19132 Sudah Digunakan (Address Already in Use)
Jika proses sebelumnya belum tertutup sempurna:
1. Buka PowerShell dan periksa PID:
   ```powershell
   Get-NetTCPConnection -LocalPort 25565 -ErrorAction SilentlyContinue
   Get-NetUDPEndpoint -LocalPort 19132 -ErrorAction SilentlyContinue
   ```
2. Hentikan proses terkait:
   ```powershell
   Stop-Process -Id <PID> -Force
   ```
   Atau cukup jalankan script `scripts\stop-server.bat`.

### 2. Kenapa Pemain Terputus Saat Diam / Layar HP Mati (AFK Disconnect)?
* **Penyebab**:
  * Server utama tidak pernah menendang pemain yang diam (`player-idle-timeout=0`).
  * Pada perangkat Android dan iOS, saat layar mati atau aplikasi di-minimize, sistem operasi HP secara otomatis **mematikan transmisi Wi-Fi di latar belakang dan men-suspend proses Minecraft** untuk menghemat baterai.
  * Akibatnya, HP berhenti merespons sinyal detak jantung (*keepalive*) selama 30 detik, sehingga Geyser menganggap HP telah keluar dari permainan (`Bedrock client timed out`).
* **Solusi**:
  * Atur waktu mati layar HP (*Screen Timeout*) menjadi lebih lama atau *Never* saat ingin AFK di dekat farm/base.
  * Nonaktifkan fitur *Battery Optimization / Hemat Daya* untuk aplikasi Minecraft pada pengaturan HP.
  * Pertahankan aplikasi Minecraft tetap berada di layar aktif (tidak di-minimize).

### 3. Pemain Bedrock Mengalami Lag atau Gerakan Ditarik (Rubberbanding)
* Pastikan Geyser dijalankan dengan script resmi `scripts\start-server.bat` atau `scripts\start-bridge.bat` yang sudah memuat argumen optimasi:
  `-DGeyser.RakRateLimitingDisabled=true -DGeyser.RakPacketLimit=100000`
* Pengaturan `mtu: 1280` di `bridge\plugins\Geyser\config.yml` sudah aktif untuk mencegah fragmentasi paket di jaringan Wi-Fi dan seluler.

---

## Catatan Keamanan

Server ini menggunakan pengaturan `online-mode=false` untuk fleksibilitas launcher Java:
1. **Verifikasi Identitas**: Dalam mode offline, server tidak memverifikasi token ke server Mojang. Siapapun dapat menggunakan nama apa saja.
2. **Perlindungan Akses Admin**: Jangan berikan hak OP kepada pemain sembarangan. Gunakan whitelist jika membuka server ke publik luas:
   ```cmd
   whitelist on
   whitelist add <nama_pemain>
   ```
3. **Kerahasiaan Kunci Tunnel**: File `playit.toml` berisi token autentikasi rahasia dan telah dilindungi oleh `.gitignore` agar tidak pernah terunggah ke publik.

---

<div align="center">
  <sub>Dikembangkan dan dioptimalkan secara khusus untuk kestabilan server lokal & internet crossplay.</sub>
</div>
