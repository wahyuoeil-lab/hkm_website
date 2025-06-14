import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart'; // Import untuk membuka URL

void main() {
  runApp(const HkmSeberangBersatuApp());
}

// Widget utama aplikasi Flutter
class HkmSeberangBersatuApp extends StatelessWidget {
  const HkmSeberangBersatuApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // Judul aplikasi yang muncul di bilah judul browser
      title: 'HKM Seberang Bersatu',
      // Tema visual aplikasi
      theme: ThemeData(
        primarySwatch: Colors.blue, // Warna utama aplikasi
        fontFamily: 'Inter', // Menggunakan font Inter
        visualDensity: VisualDensity.adaptivePlatformDensity, // Kepadatan visual adaptif
      ),
      debugShowCheckedModeBanner: false, // Menyembunyikan banner debug
      home: const HomePage(), // Halaman utama aplikasi
    );
  }
}

// Halaman beranda aplikasi
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  // Fungsi untuk meluncurkan URL eksternal
  Future<void> _launchUrl(String url) async {
    final Uri uri = Uri.parse(url);
    if (!await launchUrl(uri)) {
      // Menampilkan SnackBar jika URL tidak bisa diluncurkan
      debugPrint('Could not launch $url');
    }
  }

  @override
  Widget build(BuildContext context) {
    // Mengambil ukuran layar saat ini untuk responsivitas
    final Size screenSize = MediaQuery.of(context).size;
    // Menentukan apakah layar cukup kecil untuk tata letak mobile
    final bool isSmallScreen = screenSize.width < 600;

    return Scaffold(
      // Bilah aplikasi di bagian atas
      appBar: AppBar(
        title: const Text(
          'HKM Seberang Bersatu',
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
        backgroundColor: Colors.blueAccent, // Warna latar belakang bilah aplikasi
        centerTitle: true, // Judul di tengah
        // Tombol aksi di bilah aplikasi (misalnya untuk navigasi)
        actions: [
          TextButton(
            onPressed: () {
              // TODO: Tambahkan fungsi navigasi ke Beranda (scroll ke atas)
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Navigasi ke Beranda')),
              );
            },
            child: const Text(
              'Beranda',
              style: TextStyle(color: Colors.white),
            ),
          ),
          TextButton(
            onPressed: () {
              // TODO: Tambahkan fungsi navigasi ke Tentang Kami
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Navigasi ke Tentang Kami')),
              );
            },
            child: const Text(
              'Tentang Kami',
              style: TextStyle(color: Colors.white),
            ),
          ),
          TextButton(
            onPressed: () {
              // TODO: Tambahkan fungsi navigasi ke Program
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Navigasi ke Program')),
              );
            },
            child: const Text(
              'Program',
              style: TextStyle(color: Colors.white),
            ),
          ),
          TextButton(
            onPressed: () {
              // TODO: Tambahkan fungsi navigasi ke Kontak
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Navigasi ke Kontak')),
              );
            },
            child: const Text(
              'Kontak',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
      // Isi utama halaman
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Bagian Hero (gambar besar dan teks utama)
            Container(
              width: double.infinity, // Lebar penuh
              padding: EdgeInsets.symmetric(
                  vertical: isSmallScreen ? 40 : 80,
                  horizontal: isSmallScreen ? 20 : 100), // Padding responsif
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.blueAccent, Colors.lightBlueAccent],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Selamat Datang di HKM Seberang Bersatu',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: isSmallScreen ? 28 : 48, // Ukuran font responsif
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: isSmallScreen ? 10 : 20), // Spasi responsif
                  Text(
                    'Wadah Silaturahmi dan Pemberdayaan Komunitas untuk Kemajuan Juru Seberang.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: isSmallScreen ? 16 : 22, // Ukuran font responsif
                      color: Colors.white70,
                    ),
                  ),
                  SizedBox(height: isSmallScreen ? 20 : 40), // Spasi responsif
                  // Tombol ajakan bertindak
                  ElevatedButton(
                    onPressed: () {
                      _launchUrl('https://hkmseberangbersatuid.wordpress.com/'); // Meluncurkan URL blog
                    },
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.blueAccent, backgroundColor: Colors.white, // Warna teks dan latar belakang tombol
                      padding: EdgeInsets.symmetric(
                          horizontal: isSmallScreen ? 24 : 40,
                          vertical: isSmallScreen ? 12 : 20), // Padding tombol responsif
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30), // Sudut tombol membulat
                      ),
                    ),
                    child: Text(
                      'Kunjungi Blog Kami',
                      style: TextStyle(fontSize: isSmallScreen ? 16 : 20),
                    ),
                  ),
                ],
              ),
            ),
            // Bagian Tentang Kami
            Padding(
              padding: EdgeInsets.symmetric(
                  vertical: isSmallScreen ? 30 : 60,
                  horizontal: isSmallScreen ? 20 : 100), // Padding responsif
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Tentang HKM Seberang Bersatu',
                    style: TextStyle(
                      fontSize: isSmallScreen ? 24 : 36,
                      fontWeight: FontWeight.bold,
                      color: Colors.blueAccent,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: isSmallScreen ? 15 : 30),
                  // Tata letak dua kolom untuk layar besar, satu kolom untuk layar kecil
                  isSmallScreen
                      ? _buildAboutContentSmallScreen()
                      : _buildAboutContentLargeScreen(),
                ],
              ),
            ),
            // Bagian Program Kami
            Container(
              width: double.infinity,
              color: Colors.grey[100], // Warna latar belakang bagian
              padding: EdgeInsets.symmetric(
                  vertical: isSmallScreen ? 30 : 60,
                  horizontal: isSmallScreen ? 20 : 100),
              child: Column(
                children: [
                  Text(
                    'Program Unggulan Kami',
                    style: TextStyle(
                      fontSize: isSmallScreen ? 24 : 36,
                      fontWeight: FontWeight.bold,
                      color: Colors.blueAccent,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: isSmallScreen ? 15 : 30),
                  // Grid program (3 kolom untuk layar besar, 1 atau 2 untuk layar kecil)
                  GridView.builder(
                    shrinkWrap: true, // Penting agar GridView tidak mengambil tinggi tak terbatas
                    physics: const NeverScrollableScrollPhysics(), // Nonaktifkan scroll GridView
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: isSmallScreen ? 1 : 3, // Jumlah kolom responsif
                      crossAxisSpacing: 20, // Spasi antar kolom
                      mainAxisSpacing: 20, // Spasi antar baris
                      childAspectRatio: isSmallScreen ? 3 / 1 : 1, // Rasio aspek item
                    ),
                    itemCount: 3, // Jumlah program
                    itemBuilder: (context, index) {
                      final List<String> titles = [
                        'Pengembangan Sumber Daya Manusia',
                        'Kewirausahaan dan UMKM',
                        'Lingkungan dan Sosial',
                      ];
                      final List<String> descriptions = [
                        'Menyediakan pelatihan dan workshop untuk meningkatkan keterampilan anggota komunitas.',
                        'Mendorong inisiatif kewirausahaan dan membantu pengembangan usaha mikro, kecil, dan menengah.',
                        'Melaksanakan kegiatan peduli lingkungan dan program sosial untuk kesejahteraan bersama.',
                      ];
                      return ProgramCard(
                        title: titles[index],
                        description: descriptions[index],
                      );
                    },
                  ),
                ],
              ),
            ),
            // Bagian Kontak Kami (Footer)
            Container(
              width: double.infinity,
              color: Colors.blueGrey[800], // Warna latar belakang footer
              padding: EdgeInsets.all(isSmallScreen ? 20 : 40),
              child: Column(
                children: [
                  Text(
                    'Hubungi Kami',
                    style: TextStyle(
                      fontSize: isSmallScreen ? 20 : 28,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: isSmallScreen ? 10 : 20),
                  Text(
                    'Email: info@hkmseberangbersatu.org\nTelepon: +62 812 3456 7890',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: isSmallScreen ? 14 : 18,
                      color: Colors.white70,
                    ),
                  ),
                  SizedBox(height: isSmallScreen ? 5 : 10),
                  Text(
                    'Alamat: Juru Seberang, Pulau Belitung',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: isSmallScreen ? 14 : 18,
                      color: Colors.white70,
                    ),
                  ),
                  SizedBox(height: isSmallScreen ? 10 : 20),
                  ElevatedButton.icon(
                    onPressed: () {
                      _launchUrl(
                          'https://www.google.com/maps/place/GEOSITE+JURU+SEBERANG/@-2.7643551,107.6083347,17z/data=!3m1!4b1!4m6!3m5!1s0x2e171702df6bb23b:0xfc224dab01833a53!8m2!3d-2.7643551!4d107.6109096!16s%2Fg%2F11cn5nnsd5?entry=ttu&g_ep=EgoyMDI1MDYxMS4wIKXMDSoASAFQAw%3D%3D');
                    },
                    icon: const Icon(Icons.location_on, color: Colors.blueAccent),
                    label: const Text('Lihat di Google Maps'),
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.blueAccent, backgroundColor: Colors.white,
                      padding: EdgeInsets.symmetric(
                          horizontal: isSmallScreen ? 16 : 24,
                          vertical: isSmallScreen ? 8 : 12),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                  ),
                  SizedBox(height: isSmallScreen ? 10 : 20),
                  Text(
                    '© 2025 HKM Seberang Bersatu. Semua Hak Dilindungi.',
                    style: TextStyle(
                      fontSize: isSmallScreen ? 12 : 14,
                      color: Colors.white54,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Konten bagian "Tentang Kami" untuk layar besar (dua kolom)
  Widget _buildAboutContentLargeScreen() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          flex: 2,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text(
                'HKM Seberang Bersatu adalah komunitas yang berdedikasi untuk membangun solidaritas dan memajukan potensi anggota di wilayah Juru Seberang dan sekitarnya.',
                style: TextStyle(fontSize: 18, color: Colors.black87),
                textAlign: TextAlign.justify,
              ),
              SizedBox(height: 15),
              Text(
                'Kami percaya bahwa dengan bersatu, setiap individu dapat berkontribusi pada kemajuan kolektif, menciptakan lingkungan yang suportif dan inovatif bagi semua.',
                style: TextStyle(fontSize: 18, color: Colors.black87),
                textAlign: TextAlign.justify,
              ),
              SizedBox(height: 15),
              Text(
                'Misi kami adalah memberdayakan anggota melalui pendidikan, pengembangan keterampilan, dan inisiatif komunitas yang berkelanjutan, sejalan dengan visi pengembangan Geosite Juru Seberang.',
                style: TextStyle(fontSize: 18, color: Colors.black87),
                textAlign: TextAlign.justify,
              ),
            ],
          ),
        ),
        const SizedBox(width: 40),
        Expanded(
          flex: 1,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(15), // Sudut membulat pada gambar
            child: Image.network(
              'https://placehold.co/400x300/007bff/ffffff?text=Komunitas+Juru+Seberang', // Placeholder gambar
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                return Container(
                  height: 300,
                  color: Colors.grey[300],
                  child: Center(
                    child: Text('Gagal memuat gambar',
                        style: TextStyle(color: Colors.red)),
                  ),
                );
              },
            ),
          ),
        ),
      ],
    );
  }

  // Konten bagian "Tentang Kami" untuk layar kecil (satu kolom)
  Widget _buildAboutContentSmallScreen() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(15),
          child: Image.network(
            'https://placehold.co/400x300/007bff/ffffff?text=Komunitas+Juru+Seberang', // Placeholder gambar
            fit: BoxFit.cover,
            width: double.infinity, // Lebar penuh
            height: 200,
            errorBuilder: (context, error, stackTrace) {
              return Container(
                height: 200,
                color: Colors.grey[300],
                child: Center(
                  child: Text('Gagal memuat gambar',
                      style: TextStyle(color: Colors.red)),
                ),
              );
            },
          ),
        ),
        const SizedBox(height: 20),
        const Text(
          'HKM Seberang Bersatu adalah komunitas yang berdedikasi untuk membangun solidaritas dan memajukan potensi anggota di wilayah Juru Seberang dan sekitarnya. Kami percaya bahwa dengan bersatu, setiap individu dapat berkontribusi pada kemajuan kolektif, menciptakan lingkungan yang suportif dan inovatif bagi semua. Misi kami adalah memberdayakan anggota melalui pendidikan, pengembangan keterampilan, dan inisiatif komunitas yang berkelanjutan, sejalan dengan visi pengembangan Geosite Juru Seberang.',
          style: TextStyle(fontSize: 16, color: Colors.black87),
          textAlign: TextAlign.justify,
        ),
      ],
    );
  }
}

// Widget kartu untuk menampilkan program
class ProgramCard extends StatelessWidget {
  final String title;
  final String description;

  const ProgramCard({
    super.key,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5, // Efek bayangan kartu
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15), // Sudut kartu membulat
      ),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.blueAccent,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              description,
              style: const TextStyle(
                fontSize: 16,
                color: Colors.black87,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
