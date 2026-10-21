
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

// Class Mahasiswa sesuai materi Pertemuan 2
class Mahasiswa {
  final String nama;
  final String nim;
  final String prodi;

  const Mahasiswa({
    required this.nama,
    required this.nim,
    required this.prodi,
  });

  // Method untuk menampilkan informasi mahasiswa
  String tampilkan() {
    return 'Nama: $nama\nNIM: $nim\nProgram Studi: $prodi';
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Biodata Mahasiswa',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.indigo,
        ),
        useMaterial3: true,
      ),
      home: const BiodataPage(),
    );
  }
}

class BiodataPage extends StatelessWidget {
  const BiodataPage({super.key});

  @override
  Widget build(BuildContext context) {
    const mahasiswa = Mahasiswa(
      nama: 'Radova Alenta Yogasmara',
      nim: '241080200010',
      prodi: 'Informatika',
    );

    const kota = 'Sidoarjo';
    const semester = 5;
    const hobi = ['Game', 'Billiard', 'Belajar'];
    const keterampilan = 'Pemrograman dasar';
    const deskripsi =
        'Saya mahasiswa yang tertarik pada teknologi ';

    return Scaffold(
      appBar: AppBar(
        title: const Text('Biodata Mahasiswa'),
        centerTitle: true,
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: ConstrainedBox(
            constraints: const BoxConstraints(
              maxWidth: 600,
            ),
            child: Card(
              child: Padding(
                padding: const EdgeInsets.all(24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: Column(
                        children: [
                          const CircleAvatar(
                            radius: 42,
                            child: Text(
                              'RA',
                              style: TextStyle(
                                fontSize: 28,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          const SizedBox(height: 12),
                          Text(
                            mahasiswa.nama,
                            textAlign: TextAlign.center,
                            style: Theme.of(context)
                                .textTheme
                                .headlineSmall,
                          ),
                          const SizedBox(height: 4),
                          Text(mahasiswa.prodi),
                        ],
                      ),
                    ),
                    const SizedBox(height: 24),
                    const Divider(),
                    const SizedBox(height: 12),
                    Text(
                      'Informasi Pribadi',
                      style: Theme.of(context)
                          .textTheme
                          .titleLarge,
                    ),
                    const SizedBox(height: 12),
                    _info('NIM', mahasiswa.nim),
                    _info('Program Studi', mahasiswa.prodi),
                    _info('Semester', '$semester'),
                    _info('Kota', kota),
                    _info('Keterampilan', keterampilan),
                    const SizedBox(height: 16),
                    Text(
                      'Hobi',
                      style: Theme.of(context)
                          .textTheme
                          .titleMedium,
                    ),
                    const SizedBox(height: 8),
                    Wrap(
                      spacing: 8,
                      runSpacing: 8,
                      children: hobi.map((item) {
                        return Chip(label: Text(item));
                      }).toList(),
                    ),
                    const SizedBox(height: 20),
                    Text(
                      'Tentang Saya',
                      style: Theme.of(context)
                          .textTheme
                          .titleMedium,
                    ),
                    const SizedBox(height: 8),
                    Text(deskripsi),
                    const SizedBox(height: 16),
                    const Divider(),
                    const SizedBox(height: 8),
                    Text(
                      mahasiswa.tampilkan(),
                      style: Theme.of(context)
                          .textTheme
                          .bodySmall,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _info(String label, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 125,
            child: Text(
              label,
              style: const TextStyle(
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          const Text(': '),
          Expanded(child: Text(value)),
        ],
      ),
    );
  }
}
