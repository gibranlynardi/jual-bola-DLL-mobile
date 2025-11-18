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


## Tugas Individu 8
**1. Jelaskan perbedaan antara `Navigator.push()` dan `Navigator.pushReplacement()` pada Flutter. Dalam kasus apa sebaiknya masing-masing digunakan pada aplikasi Football Shop kamu?**

`Navigator.push()` berarti hanya memasukkan halaman baru ke dalam stack yang sudah ada (seperti menindih) sementara `Navigator.pushReplacement()` benar-benar pop halaman lama dan push halaman baru yang ingin ditampilkan. Di jual beli DLL, kita menggunakannya saat menekan tombol "Create Product" dan menu drawer "Tambah Produk" supaya bisa back ke halaman utama dengan `Navigator.push()`. `pushReplacement` kita menggunakannya di *drawer* saat menekan "Halaman Utama". Setelah *login* setelah berhasil *login*, kita menggunakan ke halaman utama agar pengguna tidak bisa menekan "kembali" ke halaman *login*.

**2. Bagaimana kamu memanfaatkan hierarchy widget seperti `Scaffold`, `AppBar`, dan `Drawer` untuk membangun struktur halaman yang konsisten di seluruh aplikasi?**

Widget Scaffold dijadikan sebagai kerangka dasar atau induk utama untuk setiap halaman, baik itu di file screens/menu.dart maupun screens/shoplist_form.dart. Melalui scaffold ini, terdapat slot appBar yang digunakan untuk meletakkan widget AppBar, sehingga bilah judul dapat secara konsisten muncul di bagian atas layar dengan penampilan seragam. Tidak hanya itu, scaffold juga menyediakan slot drawer, di mana widget LeftDrawer (yang sudah dibuat sebelumnya) ditempatkan, memungkinkan menu navigasi samping yang sama diakses dari semua halaman yang menggunakan scaffold ini.

**3. Dalam konteks desain antarmuka, apa kelebihan menggunakan layout widget seperti `Padding`, `SingleChildScrollView`, dan `ListView` saat menampilkan elemen-elemen form? Berikan contoh penggunaannya dari aplikasi kamu.**

Padding berperan memberikan ruang visual yang diperlukan, sehingga elemen-elemen dalam form tidak saling berhimpitan atau menempel ke tepi layar, menjadikan tampilan lebih leluasa dan mudah dibaca—contohnya, di screens/shoplist_form.dart, setiap TextFormField dilapisi oleh Padding untuk menciptakan jarak antara kolom dan tepi layar. SingleChildScrollView memiliki keunggulan utama mencegah terjadinya error "Bottom Overflow" (konten terpotong di bagian bawah) saat keyboard virtual muncul selama pengisian form. Karena ruang layar yang tersedia berkurang, widget ini memastikan pengguna dapat menggulir halaman untuk melihat semua field formulir, seperti yang dilakukan di screens/shoplist_form.dart dengan membungkus seluruh Column berisi field-form. ListView meskipun memiliki fungsi serupa dengan SingleChildScrollView (memungkinkan konten di-scroll), dirancang secara khusus untuk menangani daftar item. Sebagai contoh, di lib/widgets/left_drawer.dart, ListView digunakan untuk menyimpan daftar opsi menu ("Halaman Utama", "Tambah Produk") dan akan secara otomatis mendukung scrolling jika jumlah menu nanti ditingkatkan.

**4. Bagaimana kamu menyesuaikan warna tema agar aplikasi Football Shop memiliki identitas visual yang konsisten dengan brand toko?**

Pengaturan warna tema dalam aplikasi dilakukan secara terpusat melalui widget MaterialApp yang terdapat di file lib/main.dart. Pertama, kita mendefinisikan ThemeData dan mengonfigurasi property colorScheme dengan menggunakan metode ColorScheme.fromSwatch, di mana primarySwatch diatur ke Colors.lime untuk menentukan palet warna "Lime" sebagai warna dasar. Setelah tema ini diatur pada MaterialApp, semua widget turunan (seperti AppBar dan ElevatedButton) secara otomatis akan menerapkan warna primer yang telah ditetapkan. Sebagai contoh, AppBar di screens/menu.dart dan screens/shoplist_form.dart mengambil warna ini secara langsung melalui Theme.of(context).colorScheme.primary, serta tombol "Save" di screens/shoplist_form.dart juga diatur warnanya dengan nilai yang sama untuk menjaga keseragaman visual. Keuntungan pendekatan ini adalah, jika ingin mengubah brand toko (misalnya mengganti palet dari "Lime" ke "Blue"), kita hanya perlu memodifikasi satu baris kode di main.dart, sehingga seluruh aplikasi akan secara otomatis mengadopsi warna baru dengan konsistensi yang terjaga.


## TUGAS INDIVIDU
1. Jelaskan mengapa kita perlu membuat model Dart saat mengambil/mengirim data JSON? Apa konsekuensinya jika langsung memetakan Map<String, dynamic> tanpa model (terkait validasi tipe, null-safety, maintainability)?
Utamanya adalah type safe karena dia dinamis. Jika kita hanya mengandalkan Map<String, dynamic> secara langsung, kita tidak bisa menjamin apakah key yang kita akses benar-benar ada atau apakah tipe datanya sesuai harapan. Kesalahan penulisan nama key sekecil apapun baru akan terdeteksi saat aplikasi dijalankan (runtime error), bukan saat kompilasi. Dengan menggunakan model, kode kita menjadi lebih mudah dibaca, kita bisa memanfaatkan fitur autocompletion dari VScode, dan penerapan null safety menjadi lebih mudah untuk memvalidasi data yang masuk dari server.

2. Apa fungsi package http dan CookieRequest dalam tugas ini? Jelaskan perbedaan peran http vs CookieRequest.
http berfungsi sebagai fondasi untuk melakukan pertukaran data melalui protokol HTTP, seperti method GET atau POST. Namun, http standar bersifat stateless, artinya ia tidak menyimpan informasi sesi pengguna antar-request. Dengan CookieRequest pada dasarnya adalah pembungkus (wrapper) fungsi http yang telah dimodifikasi untuk dapat menyimpan dan menyertakan cookies secara otomatis di setiap permintaan ke server. Perbedaan utamanya adalah http biasa mengharuskan kita mengelola header cookie secara manual untuk menjaga sesi login, sedangkan CookieRequest menanganinya di balik layar sehingga status login pengguna tetap terjaga dengan mudah

3. Jelaskan mengapa instance CookieRequest perlu untuk dibagikan ke semua komponen di aplikasi Flutter.
Sebuah instance CookieRequest perlu dibagikan ke seluruh komponen aplikasi untuk menjaga konsistensi state sesi pengguna. Informasi login (session ID) tersimpan di dalam instance tersebut. Jika kita membuat objek CookieRequest baru di setiap halaman atau widget, data sesi yang sudah tersimpan akan hilang, dan server akan menganggap permintaan tersebut datang dari pengguna baru yang belum login (anonim). Oleh karena itu, kita perlu menggunakan satu instance tunggal (biasanya didistribusikan menggunakan Provider) agar status login dapat dikenali dan konsisten di seluruh bagian aplikasi, baik saat pengguna berada di halaman utama, form, maupun profil.

4. Jelaskan konfigurasi konektivitas yang diperlukan agar Flutter dapat berkomunikasi dengan Django. Mengapa kita perlu menambahkan 10.0.2.2 pada ALLOWED_HOSTS, mengaktifkan CORS dan pengaturan SameSite/cookie, dan menambahkan izin akses internet di Android? Apa yang akan terjadi jika 6. konfigurasi tersebut tidak dilakukan dengan benar?
kita menambahkan 10.0.2.2 pada ALLOWED_HOSTS di Django karena ini adalah alamat IP khusus yang digunakan emulator Android untuk mengakses localhost komputer host. Kedua, kita perlu mengaktifkan CORS dan mengatur SameSite pada cookies karena browser (Flutter Web) dan server Django dianggap berasal dari origin yang berbeda, sehingga browser akan memblokir permintaan demi keamanan jika konfigurasi ini tidak ada. Terakhir, penambahan izin INTERNET di AndroidManifest.xml mutlak diperlukan agar sistem operasi Android mengizinkan aplikasi untuk melakukan koneksi jaringan. Jika salah satu konfigurasi ini terlewat, aplikasi akan mengalami error koneksi, seperti Connection Refused atau pemblokiran oleh kebijakan CORS.

5. Jelaskan mekanisme pengiriman data mulai dari input hingga dapat ditampilkan pada Flutter.
Pengiriman data dimulai ketika pengguna mengisi input pada Form di Flutter. Data tersebut diambil menggunakan TextEditingController, lalu diserialisasi menjadi format JSON. Flutter kemudian mengirimkan data JSON ini menggunakan metode HTTP POST melalui CookieRequest ke URL endpoint Django. Di sisi backend, Django menerima permintaan tersebut, memvalidasi data, dan menyimpannya ke dalam database. Setelah berhasil, Django mengirimkan respons JSON kembali ke Flutter (misalnya status "success"). Flutter menerima respons tersebut dan jika sukses, biasanya akan mengarahkan pengguna kembali ke halaman daftar atau melakukan refresh. Untuk menampilkan data, Flutter melakukan permintaan GET ke endpoint JSON Django, lalu mendeserialisasi respons JSON tersebut menjadi objek Dart menggunakan model yang telah dibuat, dan akhirnya menampilkannya ke antarmuka pengguna (UI) menggunakan widget seperti ListView atau FutureBuilder.

6. Jelaskan mekanisme autentikasi dari login, register, hingga logout. Mulai dari input data akun pada Flutter ke Django hingga selesainya proses autentikasi oleh Django dan tampilnya menu pada Flutter.
Dimulai dengan Register, di mana pengguna memasukkan data akun di Flutter yang kemudian dikirim via POST ke Django untuk membuat entri User baru di database. Untuk Login, pengguna mengirimkan kredensial yang kemudian divalidasi oleh Django menggunakan fungsi authenticate. Jika valid, Django membuat sesi login dan mengembalikan respons yang berisi session cookie. CookieRequest di Flutter menangkap dan menyimpan cookie ini, serta mengubah status loggedIn menjadi true. Saat Logout, Flutter mengirim permintaan ke endpoint logout Django yang akan menghapus sesi di server. Secara bersamaan, CookieRequest di Flutter akan menghapus cookie yang tersimpan, sehingga status loggedIn kembali menjadi false dan pengguna diarahkan kembali ke halaman login.

### Implementasi Step-by-Step
1. Langkah awal saya adalah memastikan sisi server siap menerima koneksi. Saya menginstal django-cors-headers dan menambahkannya ke INSTALLED_APPS serta MIDDLEWARE di settings.py untuk menangani izin akses lintas domain. Saya juga membuat aplikasi django baru bernama authentication khusus untuk menangani logika login dan register berbasis JSON.

2. Di sisi Flutter, saya menambahkan dependensi provider dan pbp_django_auth. Kemudian, saya membungkus widget utama aplikasi di main.dart dengan Provider agar satu instance CookieRequest dapat diakses dari seluruh halaman aplikasi.

3. Saya mengambil contoh data JSON dari endpoint Django, lalu membuat model Dart (Product) yang sesuai dengan struktur tersebut. Saya memastikan tipe data ID disesuaikan menjadi String untuk mengakomodasi penggunaan UUID dari Django.

4. Selanjutnya, saya membuat halaman login.dart dan register.dart. Saya menghubungkan form input di kedua halaman ini dengan endpoint Django yang sesuai menggunakan fungsi request.login dan request.postJson, serta menambahkan logika validasi input sederhana.

5. Untuk menampilkan produk, saya membuat list_product.dart yang mengambil data menggunakan request.get. Data yang diterima kemudian di-parsing menjadi list objek Product. Setiap item dalam list saya bungkus dengan InkWell agar dapat diklik dan mengarahkan pengguna ke halaman detail_product.dart yang menampilkan informasi lengkap produk.

6. Terakhir, saya memodifikasi shoplist_form.dart. Logika tombol simpan yang sebelumnya hanya lokal, saya ubah untuk mengirim data JSON ke endpoint create-flutter di Django. Saya juga memastikan view di Django telah memfilter data berdasarkan user yang sedang login agar privasi data terjaga.