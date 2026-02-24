#  PlantCare Pro: Management Koleksi Tanaman

![Flutter](https://img.shields.io/badge/Flutter-%2302569B.svg?style=for-the-badge&logo=Flutter&logoColor=white)
![Dart](https://img.shields.io/badge/dart-%230175C2.svg?style=for-the-badge&logo=dart&logoColor=white)

## Deskripsi Aplikasi

**PlantCare Pro** adalah solusi digital yang dirancang khusus untuk para pecinta tanaman. Fokus utama dari proyek aplikasi ini adalah menyediakan sistem pencatatan yang rapi, mulai dari identifikasi spesies tanaman hingga pemantauan jadwal perawatan harian secara efisien dan mudah digunakan.

---

## Fitur Utama & Alur CRUD

Aplikasi ini telah mendukung operasi CRUD (Create, Read, Update, Delete) secara penuh dengan detail sebagai berikut:

### 1. Penampilan Data (Read)
Aplikasi menyajikan daftar koleksi tanaman secara dinamis. Setiap data ditampilkan di dalam `Card` yang elegan untuk memberikan kesan antarmuka (UI) yang bersih dan modern.

### 2. Tambah & Unggah Foto (Create)
Pengguna dapat menambahkan koleksi tanaman baru dengan dua cara:
- Mengambil foto langsung melalui kamera.
- Memilih foto dari galeri menggunakan library `image_picker`.

### 3. Pembaruan Data (Update)
Memungkinkan pengguna untuk mengubah detail informasi (seperti nama tanaman) atau mengganti foto lama dengan foto terbaru tanpa harus menghapus entri sebelumnya.

### 4. Keamanan Hapus (Delete)
Kami mengimplementasikan `AlertDialog` sebagai lapisan keamanan tambahan. Fitur ini memastikan pengguna memberikan konfirmasi terlebih dahulu sebelum data koleksi benar-benar dihapus dari sistem.

---

## 🛠️ Widget & Teknologi Teknis

Dalam pengembangan aplikasi ini, beberapa widget inti Flutter digunakan untuk mendukung performa yang maksimal dan UI yang menarik:

- **`ListView.builder`** : Digunakan untuk merender daftar tanaman dalam jumlah banyak secara *lazy-loading* sehingga tidak membebani memori perangkat.
- **`Image.file`** : Fungsi utama untuk memanggil dan menampilkan file gambar yang disimpan dari penyimpanan internal ponsel.
- **`Navigator`** : Mengatur alur perpindahan antar halaman (*Routing*), misalnya dari halaman daftar ke halaman formulir.
- **`ClipRRect`** : Memberikan efek visual melengkung (rounded corners) pada sudut foto agar tampilan antarmuka terlihat lebih profesional dan halus.

---

## Dokumentasi Program (Alur Aplikasi)

Berikut adalah penjelasan alur antarmuka (UI) saat menggunakan aplikasi ini:

* **Halaman Utama (Daftar Tanaman)**
    Ini adalah menu utama (Home) dari aplikasi. Saat pertama kali dibuka dan belum ada data, layar akan menampilkan pesan *"Belum ada koleksi tanaman."* Jika data sudah ditambahkan, koleksi akan tampil menyusun ke bawah. Untuk menambahkan tanaman baru, cukup klik logo **+** (Floating Action Button) di sudut kanan bawah.
    
* **Form Tambah & Edit Data**
    Setelah menekan tombol **+** (atau menekan kartu tanaman yang sudah ada untuk mengedit), Anda akan masuk ke halaman Form. Di sini, Anda **wajib** mengisi `Nama Tanaman` (data tidak bisa disimpan jika nama kosong). Untuk pengisian `Spesies`, `Jadwal Siram`, serta Foto Tanaman (via Kamera atau Galeri) sifatnya opsional, jadi tidak wajib diisi.

* **Keamanan Penghapusan Data**
    Pada Halaman Utama, terdapat logo tempat sampah (🗑️) berwarna merah di setiap kartu tanaman. Jika ikon ini diklik, aplikasi tidak akan langsung menghapus data. Akan muncul *Pop-up Dialog* untuk menanyakan *"Apakah Anda yakin ingin menghapus...?"*. Jika klik "HAPUS", data akan hilang dan muncul notifikasi kecil (*SnackBar*) di bawah layar bahwa penghapusan berhasil.

---

## Dokumentasi Program (Alur Aplikasi)

Berikut adalah panduan langkah demi langkah (*user journey*) dalam menggunakan aplikasi PlantCare Pro:


1. **Halaman Utama (Home Page)** Saat pertama kali membuka aplikasi, Anda akan disambut oleh Halaman Utama. Jika belum ada data yang dimasukkan, layar akan menampilkan teks informasi *"Belum ada koleksi tanaman."*

<div align="center">
    <img width="250" height="600" alt="Screenshot_20260224_213328" src="https://github.com/user-attachments/assets/bb58223a-122c-4646-91ca-e59b942d64d9" />
</div>

2. **Menambah Data Baru (+)** Untuk memulai pencatatan, klik tombol bundar dengan logo **+** (Floating Action Button) yang berada di sudut kanan bawah layar. Anda akan langsung diarahkan ke halaman "Tambah Tanaman".
<div align="center">
    <img width="250" height="600" alt="Screenshot_20260224_121031" src="https://github.com/user-attachments/assets/7bfa77ef-77f9-4b8f-9adc-5944e60e69d4" />
</div>

3. **Input Data Tanaman** Pada form ini, Anda **wajib** mengisi kolom `Nama Tanaman`. Sementara itu, pengisian `Spesies`, `Jadwal Siram`, dan penambahan foto (baik dari Kamera maupun Galeri) bersifat opsional. Setelah selesai mengisi, klik tombol **"Simpan"** dan data akan langsung muncul di Halaman Utama dalam bentuk *Card*.
<div align="center">
    <img width="250" height="600" alt="Screenshot_20260224_121656" src="https://github.com/user-attachments/assets/e2cd49d4-a348-427b-aa7d-56835dcf2251" />
    <img width="250" height="600" alt="Screenshot_20260224_121755" src="https://github.com/user-attachments/assets/6d727d4f-352e-4059-adbd-80e951d73212" />
</div>

4. **Mengedit Data yang Sudah Ada** Jika Anda ingin mengubah detail tanaman yang sudah disimpan, cukup *tap* (klik) pada *Card* tanaman tersebut di Halaman Utama. Form akan kembali terbuka beserta data lama yang sudah terisi. Anda bisa memperbarui teks maupun mengganti fotonya, lalu klik **"Simpan"** kembali.

<div align="center">
    <img width="250" height="600" alt="Screenshot_20260224_124229" src="https://github.com/user-attachments/assets/54d0a963-0ceb-44a9-9585-6822c1dbda95" />
    <img width="250" height="600" alt="Screenshot_20260224_131515" src="https://github.com/user-attachments/assets/9d9b3f11-9f75-46da-b9b1-78752dc1b265" />
    <img width="250" height="600" alt="Screenshot_20260224_151116" src="https://github.com/user-attachments/assets/32182e8e-ac17-41e4-a4a8-266f157a305a" />
</div>

5. **Menghapus Data (Delete)** Pada setiap *Card* tanaman di Halaman Utama, terdapat ikon **tong sampah berwarna merah** di sebelah kanan. Jika ikon ini diklik, akan muncul *Pop-up* konfirmasi (*AlertDialog*). Pilih opsi **"HAPUS"** jika Anda yakin ingin menghapus data tersebut dari daftar koleksi Anda selamanya.

<div align="center">
   <img width="250" height="600" alt="Screenshot_20260224_151116" src="https://github.com/user-attachments/assets/1c281f40-b190-450a-97b3-a034410af7c8" />
    <img width="250" height="600" alt="Screenshot_20260224_213045" src="https://github.com/user-attachments/assets/56f70456-4fa5-4014-98eb-402b1da8cd59" />
    <img width="250" height="600" alt="Screenshot_20260224_213056" src="https://github.com/user-attachments/assets/e4710ee6-4829-4fb8-9dfc-43d3f02076e7" />
</div>

---
