# 🌿 PlantCare Pro: Management Koleksi Tanaman

![Flutter](https://img.shields.io/badge/Flutter-%2302569B.svg?style=for-the-badge&logo=Flutter&logoColor=white)
![Dart](https://img.shields.io/badge/dart-%230175C2.svg?style=for-the-badge&logo=dart&logoColor=white)

## 📖 Deskripsi Aplikasi

**PlantCare Pro** adalah solusi digital yang dirancang khusus untuk para pecinta tanaman. Fokus utama dari proyek aplikasi ini adalah menyediakan sistem pencatatan yang rapi, mulai dari identifikasi spesies tanaman hingga pemantauan jadwal perawatan harian secara efisien dan mudah digunakan.

---

## 🚀 Fitur Utama & Alur CRUD

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

## 🗺️ Dokumentasi Program (Alur Aplikasi)



Berikut adalah penjelasan alur antarmuka (UI) saat menggunakan aplikasi ini:

* **Halaman Utama (Daftar Tanaman)**
    Ini adalah menu utama (Home) dari aplikasi. Saat pertama kali dibuka dan belum ada data, layar akan menampilkan pesan *"Belum ada koleksi tanaman."* Jika data sudah ditambahkan, koleksi akan tampil menyusun ke bawah. Untuk menambahkan tanaman baru, cukup klik logo **+** (Floating Action Button) di sudut kanan bawah.
    
* **Form Tambah & Edit Data**
    Setelah menekan tombol **+** (atau menekan kartu tanaman yang sudah ada untuk mengedit), Anda akan masuk ke halaman Form. Di sini, Anda **wajib** mengisi `Nama Tanaman` (data tidak bisa disimpan jika nama kosong). Untuk pengisian `Spesies`, `Jadwal Siram`, serta Foto Tanaman (via Kamera atau Galeri) sifatnya opsional, jadi tidak wajib diisi.

* **Keamanan Penghapusan Data**
    Pada Halaman Utama, terdapat logo tempat sampah (🗑️) berwarna merah di setiap kartu tanaman. Jika ikon ini diklik, aplikasi tidak akan langsung menghapus data. Akan muncul *Pop-up Dialog* untuk menanyakan *"Apakah Anda yakin ingin menghapus...?"*. Jika klik "HAPUS", data akan hilang dan muncul notifikasi kecil (*SnackBar*) di bawah layar bahwa penghapusan berhasil.

---

## 📸 Dokumentasi Visual Aplikasi

Berikut adalah tampilan antarmuka aplikasi yang telah diuji pada perangkat Android:

<table>
  <tr>
    <td align="center"><b>Halaman Utama</b></td>
    <td align="center"><b>Form Tambah</b></td>
    <td align="center"><b>Detail / Update</b></td>
    <td align="center"><b>Konfirmasi Hapus</b></td>
  </tr>
  <tr>
    <td><img width="250" alt="Screenshot_1" src="https://github.com/user-attachments/assets/477486d9-06ad-4f25-92db-15b217b5fe5c" /></td>
    <td><img width="250" alt="Screenshot_2" src="https://github.com/user-attachments/assets/7b090677-1211-4a6d-b842-7348368b05ef" /></td>
    <td><img width="250" alt="Screenshot_3" src="https://github.com/user-attachments/assets/8b788fc5-9780-4f20-b20d-7347cc58ee77" /></td>
    <td><img width="250" alt="Screenshot_4" src="https://github.com/user-attachments/assets/619ac5e3-6bf9-44c7-ab49-727285ecc873" /></td>
  </tr>
  <tr>
    <td><img width="250" alt="Screenshot_5" src="https://github.com/user-attachments/assets/0ffd7bf4-4f00-4b9c-ace4-3446578bae7d" /></td>
    <td><img width="250" alt="Screenshot_6" src="https://github.com/user-attachments/assets/62aec6c6-66a9-4b72-8681-330a1863dfcf" /></td>
    <td><img width="250" alt="Screenshot_7" src="https://github.com/user-attachments/assets/77246ad6-4356-457c-98ca-86771890ef27" /></td>
    <td><img width="250" alt="Screenshot_8" src="https://github.com/user-attachments/assets/b81d85d1-bc95-4829-b42a-3de5d130af29" /></td>
  </tr>
  <tr>
    <td><img width="250" alt="Screenshot_9" src="https://github.com/user-attachments/assets/8b8d3549-548a-48ab-9f82-de6b5477229b" /></td>
    <td><img width="250" alt="Screenshot_10" src="https://github.com/user-attachments/assets/a62748b0-1225-4b5e-91bd-6a814f137aa7" /></td>
    <td colspan="2"></td>
  </tr>
</table>

---
*Dibuat dengan ❤️ oleh [Nama Anda/Username GitHub]*
