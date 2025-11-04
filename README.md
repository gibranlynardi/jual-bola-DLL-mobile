# jual_bola_dll

## TUGAS INDIVIDU 7
**1. Jelaskan apa itu widget tree pada Flutter dan bagaimana hubungan parent-child (induk-anak) bekerja antar widget.**

Widget tree pada Flutter adalah struktur hierarki yang merepresentasikan seluruh antarmuka pengguna (UI). Setiap widget adalah "anak" (child) dari widget "induk" (parent) di atasnya. Hubungan ini sangat penting karena parent mengontrol konfigurasi dan tata letak dari children-nya. Contoh, sebuah widget `Scaffold` (parent) menyediakan slot untuk `AppBar` dan `body` (children). Widget `Column` (parent) akan menyusun semua children-nya (seperti `Row` atau `Text`) dalam satu baris vertikal.

---

**2. Sebutkan semua widget yang kamu gunakan dalam proyek ini dan jelaskan fungsinya.**

`MaterialApp` adalah widget root yang mengatur tema aplikasi anggapannya adalah sebuah template yang disediakan supaya tidak start dari bener-bener from scratch. `Scaffold` berfungsi sebagai kerangka dasar halaman, yang menyediakan `AppBar` (bilah judul di atas) dan `body` (konten utama halaman). Untuk tata letak, kita menggunakan `Column` untuk menyusun widget secara vertikal dan `Row` untuk menyusun widget secara horizontal. Widget `Card` digunakan (di dalam widget kustom `InfoCard` dan `ItemCard`) untuk menampilkan informasi dalam sebuah kotak dengan bayangan. `Text` digunakan untuk menampilkan tulisan, dan `Icon` untuk menampilkan ikon. `GridView` digunakan untuk menampilkan tombol-tombol dalam format grid. Terakhir, `InkWell` membungkus tombol agar bisa diklik, yang kemudian memicu `ScaffoldMessenger` untuk menampilkan `SnackBar` sebagai notifikasi.

---

**3. Apa fungsi dari widget MaterialApp? Jelaskan mengapa widget ini sering digunakan sebagai widget root.**

Fungsi utama widget `MaterialApp` adalah untuk membungkus seluruh aplikasi dan menyediakan fungsionalitas level atas yang diperlukan untuk aplikasi bergaya Material Design (Seperti Android) . Ini termasuk hal-hal penting seperti sistem navigasi (mengelola rute atau halaman), tema global (seperti `colorScheme`), dan lokalisasi (bahasa). Ia sering digunakan sebagai widget root (widget paling atas di tree) karena widget-widget Material lain di bawahnya (seperti `Scaffold`, `Card`, `AppBar`) perlu "mengetahui" bahwa mereka ada di dalam `MaterialApp` untuk dapat berfungsi dengan benar dan mengambil data tema global. Jika kita tidak menggunakan materialApp sebenarnya tidak apa-apa namun kita akan start dengan canvas kosong.

---

**4. Jelaskan perbedaan antara StatelessWidget dan StatefulWidget. Kapan kamu memilih salah satunya?**

Perbedaan utamanya terletak pada perubahan data. `StatelessWidget` bersifat *immutable*, artinya properti dan nilainya tidak dapat berubah setelah widget dibuat. Ia dipilih ketika UI bersifat statis dan hanya bergantung pada konfigurasi awal, seperti `Icon`, `Text`, atau halaman `MyHomePage` setelah *counter*-nya dihapus. Sebaliknya, `StatefulWidget` dapat menyimpan "state" internal yang bisa berubah selama aplikasi berjalan. Ia dipilih ketika UI perlu diperbarui secara dinamis sebagai respons terhadap interaksi pengguna atau data baru, seperti kotak centang, *slider*, atau aplikasi *counter* demo asli.

---

**5. Apa itu BuildContext dan mengapa penting di Flutter? Bagaimana penggunaannya di metode build?**

`BuildContext` adalah objek yang memberi tahu sebuah widget lokasinya secara pasti di dalam widget tree. Ini sangat penting karena `BuildContext` adalah "pegangan" yang digunakan widget untuk berinteraksi dengan lingkungannya atau "leluhurnya" (widget parent di atasnya). Dalam metode `build` (yang memiliki parameter `BuildContext context`), ia digunakan untuk "mencari" layanan atau data dari widget parent. Contohnya, di tutorial, kita menggunakannya untuk mengambil skema warna tema (`Theme.of(context).colorScheme.secondary`) dan untuk menemukan `Scaffold` terdekat agar bisa menampilkan `SnackBar` (`ScaffoldMessenger.of(context)`).

---

**6. Jelaskan konsep "hot reload" di Flutter dan bagaimana bedanya dengan "hot restart".**

**Hot Reload** adalah fitur pengembangan Flutter yang memungkinkan untuk menyuntikkan file kode yang baru diubah ke dalam aplikasi yang sedang berjalan (Dart Virtual Machine). Ini dilakukan tanpa kehilangan state aplikasi saat ini. Ini artinya bisa mengubah tampilan UI, dan perubahan itu akan langsung terlihat di perangkat atau emulator tanpa harus memulai ulang dari awal. Sebaliknya, **Hot Restart** memuat ulang seluruh kode aplikasi dan membangun ulang *state* aplikasi dari awal. Ini akan mereset semua data ke kondisi awalnya, tetapi prosesnya masih jauh lebih cepat daripada "Full Restart" (menghentikan dan menjalankan ulang aplikasi sepenuhnya).