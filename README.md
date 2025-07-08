# 🎬 Flix ID – Aplikasi Simulasi Pemesanan Tiket Bioskop

Flix ID adalah aplikasi mobile yang dikembangkan menggunakan Flutter, bertujuan untuk mensimulasikan proses pencarian film dan pemesanan tiket bioskop. Aplikasi ini menggunakan arsitektur bersih (Clean Architecture) dan berbagai teknologi modern untuk memberikan pengalaman pengguna yang responsif dan terstruktur. dan sudah menerapkan konsep Seperation of Concerns.

## 🚀 Fitur Utama

- 🔐 Autentikasi pengguna (Login & Register) menggunakan Firebase Authentication
- 🎞️ Menampilkan daftar dan detail film dari TMDB API
- 🗓️ Pemilihan jadwal dan simulasi pemesanan tiket bioskop
- 💾 Penyimpanan data pengguna dan transaksi di Firebase Firestore
- 🌐 Tampilan UI yang responsif dan mendukung berbagai ukuran layar
- 📦 Struktur proyek mengikuti Clean Architecture

## 🧰 Teknologi yang Digunakan

| Kategori           | Teknologi/Tools                             |
|--------------------|---------------------------------------------|
| **Frontend**       | Flutter, Dart                               |
| **State Management** | Riverpod, Freezed                        |
| **Routing**        | GoRouter                                    |
| **API**            | TMDB API, HTTP Package                      |
| **Backend/Cloud**  | Firebase Authentication, Firestore, Storage |
| **Local Storage**  | Shared Preferences                          |
| **UI Support**     | Responsive Framework, Lottie                |
| **Architecture**   | Clean Architecture                          |

## 📁 Struktur Proyek

```
lib/
├── data/
│ ├── dummies/
│ ├── firebase/
│ ├── repositories/
│ └── tmdb/
├── domain/
│ ├── entities/
│ └── usecases/
│ └── login/
│ └── usecase.dart
├── presentation/
│ ├── extensions/
│ ├── misc/
│ ├── pages/
│ ├── providers/
│ │ ├── repositories/
│ │ │ ├── authentication/
│ │ │ ├── user_repository/
│ │ │ └── usecases/
│ └── widgets/
```

## 🛠️ Instalasi & Menjalankan Proyek

1. Clone repositori:
   ```bash
   git clone https://github.com/username/flix-id.git
   cd flix-id
   ```

2. Install dependency:
   ```bash
   flutter pub get
   ```

3. Jalankan aplikasi:
   ```bash
   flutter run
   ```

> Pastikan sudah menghubungkan project dengan Firebase menggunakan `flutterfire configure` dan sudah memiliki API key dari TMDB.

## 👨‍💻 Kontributor

- Rahman Nurhadi – Flutter Developer

