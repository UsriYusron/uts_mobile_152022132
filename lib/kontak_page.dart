// lib/kontak_page.dart

import 'package:flutter/material.dart';

// Model Sederhana untuk Data Kontak
class Contact {
  final String name;
  final String phone;
  final String avatarPath; // Untuk Path Gambar/Icon

  Contact(this.name, this.phone, this.avatarPath);
}

// Data Kontak Statis (Minimal 15)
final List<Contact> staticContacts = [
  Contact('Aurelya Saniya', '0812-3456-7890', 'assets/images/aurel.jpg'),
  Contact('Wowo cihuyy', '0857-1122-3344', 'assets/images/11.jpg'),
  Contact('Joko solo', '0878-5566-7788', 'assets/images/user3.png'),
  Contact('Dewi Kartika', '0896-9876-5432', 'assets/images/user4.png'),
  Contact('Ahmad Yani', '0813-2468-1357', 'assets/images/user5.png'),
  Contact('Rina Melati', '0852-9753-1086', 'assets/images/user6.png'),
  Contact('Fajar Agung', '0811-4579-2038', 'assets/images/user7.png'),
  Contact('Lia Natalia', '0856-3019-4827', 'assets/images/user8.png'),
  Contact('Bayu Prakasa', '0877-6251-8394', 'assets/images/user9.png'),
  Contact('Citra Dewi', '0895-1736-4920', '0895-1736-4920'), // Pakai Icon Default
  Contact('Eka Putra', '0812-9012-3456', '0812-9012-3456'), // Pakai Icon Default
  Contact('Gita Adelia', '0857-8901-2345', '0857-8901-2345'), // Pakai Icon Default
  Contact('Hari Wijaya', '0878-7654-3210', '0878-7654-3210'), // Pakai Icon Default
  Contact('Indah Sari', '0896-2345-6789', '0896-2345-6789'), // Pakai Icon Default
  Contact('Kusuma Jaya', '0813-5678-9012', '0813-5678-9012'), // Pakai Icon Default
];

class KontakPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        // Border ungu di sisi (opsional, meniru gambar)
        decoration: BoxDecoration(
          border: Border(
            right: BorderSide(color: Colors.deepPurple, width: 8.0),
            left: BorderSide(color: Colors.deepPurple, width: 8.0),
          ),
        ),
        child: ListView.builder(
          itemCount: staticContacts.length,
          itemBuilder: (context, index) {
            final contact = staticContacts[index];
            return ContactListItem(contact: contact);
          },
        ),
      ),
    );
  }
}

// Widget Custom untuk Tampilan Setiap Item Kontak
class ContactListItem extends StatelessWidget {
  final Contact contact;

  const ContactListItem({required this.contact});

  // Fungsi untuk mendapatkan widget avatar (gambar atau ikon default)
  Widget _getAvatarWidget() {
    // Cek apakah path_nya valid (misal: ada kata 'assets')
    if (contact.avatarPath.contains('assets')) {
      return CircleAvatar(
        radius: 30,
        backgroundImage: AssetImage(contact.avatarPath),
        backgroundColor: Colors.grey.shade200,
      );
    } else {
      // Fallback ke Icon default jika gambar tidak tersedia
      return CircleAvatar(
        radius: 30,
        backgroundColor: Colors.deepPurple.withOpacity(0.1),
        child: Icon(Icons.person, size: 30, color: Colors.deepPurple),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 4.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8.0),
        border: Border.all(color: Colors.grey.shade300, width: 1.0),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 2,
            offset: const Offset(0, 1), // slight shadow
          ),
        ],
      ),
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
        // Circle Image/Avatar
        leading: _getAvatarWidget(),

        // Nama dan Telepon
        title: Text(
          contact.name,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
            color: Colors.deepPurple.shade700, // Warna ungu sesuai gambar
          ),
        ),
        subtitle: Text(
          contact.phone,
          style: TextStyle(
            fontSize: 14,
            color: Colors.deepPurple.shade400, // Warna ungu sesuai gambar
          ),
        ),

        // Aksi Tambahan (Contoh: Tombol Panggil)
        trailing: IconButton(
          icon: const Icon(Icons.phone, color: Colors.green),
          onPressed: () {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('Memanggil ${contact.name}...')),
            );
          },
        ),
        onTap: () {
          // Aksi ketika item diklik
        },
      ),
    );
  }
}