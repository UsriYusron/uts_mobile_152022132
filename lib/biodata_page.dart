// lib/biodata_page.dart
import 'package:flutter/material.dart';

class BiodataPage extends StatefulWidget {
  @override
  _BiodataPageState createState() => _BiodataPageState();
}

class _BiodataPageState extends State<BiodataPage> {
  String? _selectedPendidikan;
  String? _selectedGender;
  final TextEditingController _nameController = TextEditingController(text: 'Muhamad Usri Yusron');
  final List<String> _pendidikanOptions = ['SD', 'SMP', 'SMA/SMK', 'Sarjana'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            // Header dan Foto Profile
            _buildProfileHeader(),
            const Divider(height: 30),

            // Informasi Tekstual (Desain Indah)
            const Text(
              'Informasi Pribadi',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.blueAccent),
            ),
            const SizedBox(height: 10),

            _buildInfoCard(
              icon: Icons.badge,
              title: 'NIM',
              value: '152022132',
            ),
            _buildInfoCard(
              icon: Icons.email,
              title: 'Email',
              value: 'muhamad.usri@mhs.itenas.ac.id',
            ),
            _buildInfoCard(
              icon: Icons.cake,
              title: 'Tanggal Lahir',
              value: '10 Mei 2002',
            ),
            const Divider(height: 30),

            // Inputan Teks (Nama)
            TextField(
              controller: _nameController,
              decoration: const InputDecoration(
                labelText: 'Nama Lengkap',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.person),
              ),
            ),
            const SizedBox(height: 20),

            // Dropdown (Pendidikan)
            DropdownButtonFormField<String>(
              decoration: const InputDecoration(
                labelText: 'Pendidikan Terakhir',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.school),
              ),
              value: _selectedPendidikan,
              hint: const Text('Pilih Pendidikan'),
              items: _pendidikanOptions.map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              onChanged: (String? newValue) {
                setState(() {
                  _selectedPendidikan = newValue;
                });
              },
            ),
            const SizedBox(height: 20),

            // Radio Button (Jenis Kelamin)
            const Text(
              'Jenis Kelamin:',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            ),
            Row(
              children: <Widget>[
                Expanded(
                  child: RadioListTile<String>(
                    title: const Text('Pria'),
                    value: 'Pria',
                    groupValue: _selectedGender,
                    onChanged: (String? value) {
                      setState(() {
                        _selectedGender = value;
                      });
                    },
                  ),
                ),
                Expanded(
                  child: RadioListTile<String>(
                    title: const Text('Wanita'),
                    value: 'Wanita',
                    groupValue: _selectedGender,
                    onChanged: (String? value) {
                      setState(() {
                        _selectedGender = value;
                      });
                    },
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),

            // Tombol Simpan (Contoh)
            Center(
              child: ElevatedButton.icon(
                onPressed: () {
                  // Aksi Simpan
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Data Biodata Disimpan!')),
                  );
                },
                icon: const Icon(Icons.save),
                label: const Text('Simpan Perubahan'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Widget untuk membuat tampilan header profile
  Widget _buildProfileHeader() {
    return Center(
      child: Column(
        children: [
          Container(
            width: 120,
            height: 120,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 2,
                  blurRadius: 7,
                  offset: const Offset(0, 3),
                ),
              ],
            ),
            child: ClipOval(
              child: Image.asset(
                'assets/images/foto_saya.jpg', // Pastikan path benar
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(height: 10),
          Text(
            _nameController.text,
            style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const Text(
            'Mahasiswa Teknik Informatika',
            style: TextStyle(fontSize: 16, color: Colors.grey),
          ),
        ],
      ),
    );
  }

  // Widget untuk menampilkan informasi dalam Card
  Widget _buildInfoCard({required IconData icon, required String title, required String value}) {
    return Card(
      elevation: 2,
      margin: const EdgeInsets.symmetric(vertical: 8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: ListTile(
        leading: Icon(icon, color: Colors.blueAccent),
        title: Text(
          title,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        trailing: Text(value),
      ),
    );
  }
}