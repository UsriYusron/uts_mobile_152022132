// lib/kontak_page.dart

import 'package:flutter/material.dart';

// Model Sederhana untuk Data Kontak
class Contact {
  final String name;
  final String phone;
  final String avatarPath;

  Contact(this.name, this.phone, this.avatarPath);
}

// Data Kontak Statis (Minimal 15)
final List<Contact> staticContacts = [
  Contact('Aurelya Saniya', '0812-3456-7890', 'assets/images/aurel.jpg'),
  Contact('Wowo cihuyy', '0838-2740-6460', 'assets/images/11.jpg'),
  Contact('Joko solo', '0878-5566-7788', 'assets/images/foto_saya.jpg'),
  Contact('Dewi Kartika', '0896-9876-5432', '0896-9876-5432'),
  Contact('Ahmad Yani', '0813-2468-1357', '0895-1736-4920'),
  Contact('Rina Melati', '0852-9753-1086', '0852-9753-1086'),
  Contact('Fajar Agung', '0811-4579-2038', '0811-4579-2038'),
  Contact('Lia Natalia', '0856-3019-4827', '0856-3019-4827'),
  Contact('Bayu Prakasa', '0877-6251-8394', '0877-6251-8394'),
  Contact('Citra Dewi', '0895-1736-4920', '0895-1736-4920'),
  Contact('Eka Putra', '0812-9012-3456', '0812-9012-3456'),
  Contact('Gita Adelia', '0857-8901-2345', '0857-8901-2345'),
  Contact('Hari Wijaya', '0878-7654-3210', '0878-7654-3210'),
  Contact('Indah Sari', '0896-2345-6789', '0896-2345-6789'),
  Contact('Kusuma Jaya', '0813-5678-9012', '0813-5678-9012'),
];

class KontakPage extends StatelessWidget {
  const KontakPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        title: const Text(
          'Contacts',
          style: TextStyle(
            fontWeight: FontWeight.w700,
            color: Colors.white,
            fontSize: 24,
          ),
        ),
        backgroundColor: Colors.blue.shade700,
        elevation: 0,
        centerTitle: true,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(20),
          ),
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.blue.shade50,
              Colors.grey[50]!,
            ],
          ),
        ),
        child: Column(
          children: [
            // Search Bar
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.deepPurple.withOpacity(0.1),
                      blurRadius: 10,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Search contacts...',
                    hintStyle: TextStyle(color: Colors.grey[600]),
                    prefixIcon: Icon(Icons.search, color: Colors.deepPurple),
                    border: InputBorder.none,
                    contentPadding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
                  ),
                ),
              ),
            ),
            
            // Contact Count
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Row(
                children: [
                  Text(
                    '${staticContacts.length} contacts',
                    style: TextStyle(
                      color: Colors.grey[600],
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
            
            const SizedBox(height: 8),
            
            // Contacts List
            Expanded(
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.deepPurple.withOpacity(0.1),
                      blurRadius: 15,
                      offset: const Offset(0, -2),
                    ),
                  ],
                ),
                child: ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                  child: ListView.builder(
                    physics: const BouncingScrollPhysics(),
                    itemCount: staticContacts.length,
                    itemBuilder: (context, index) {
                      final contact = staticContacts[index];
                      return ContactListItem(contact: contact, index: index);
                    },
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Widget Custom untuk Tampilan Setiap Item Kontak
class ContactListItem extends StatelessWidget {
  final Contact contact;
  final int index;

  const ContactListItem({super.key, required this.contact, required this.index});

  // Fungsi untuk mendapatkan warna gradient berdasarkan index
  List<Color> _getGradientColors(int index) {
    final colors = [
      [Colors.blue.shade400, Colors.blue.shade600],
      [Colors.purple.shade400, Colors.purple.shade600],
      [Colors.pink.shade400, Colors.pink.shade600],
      [Colors.orange.shade400, Colors.orange.shade600],
      [Colors.teal.shade400, Colors.teal.shade600],
    ];
    return colors[index % colors.length];
  }

  // Fungsi untuk mendapatkan inisial nama
  String _getInitials(String name) {
    final names = name.split(' ');
    if (names.length > 1) {
      return '${names[0][0]}${names[1][0]}';
    } else {
      return name.length > 1 ? name.substring(0, 2) : name;
    }
  }

  Widget _getAvatarWidget() {
    if (contact.avatarPath.contains('assets')) {
      return Container(
        width: 52,
        height: 52,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(color: Colors.white, width: 2),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 6,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: CircleAvatar(
          radius: 25,
          backgroundImage: AssetImage(contact.avatarPath),
          backgroundColor: Colors.grey.shade200,
        ),
      );
    } else {
      final gradientColors = _getGradientColors(index);
      return Container(
        width: 52,
        height: 52,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          gradient: LinearGradient(
            colors: gradientColors,
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          boxShadow: [
            BoxShadow(
              color: gradientColors[0].withOpacity(0.3),
              blurRadius: 6,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Center(
          child: Text(
            _getInitials(contact.name),
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w600,
              fontSize: 14,
            ),
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.05),
            spreadRadius: 1,
            blurRadius: 4,
            offset: const Offset(0, 1),
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(15),
          onTap: () {
            // Aksi ketika item diklik
          },
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                // Avatar
                _getAvatarWidget(),
                
                const SizedBox(width: 16),
                
                // Contact Info
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        contact.name,
                        style: const TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 16,
                          color: Colors.black87,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        contact.phone,
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.grey[600],
                        ),
                      ),
                    ],
                  ),
                ),
                
                // Action Buttons
                Row(
                  children: [
                    // Call Button
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.green.shade50,
                        shape: BoxShape.circle,
                      ),
                      child: IconButton(
                        icon: Icon(Icons.phone, color: Colors.green.shade600, size: 20),
                        onPressed: () {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text('Memanggil ${contact.name}...'),
                              backgroundColor: Colors.green.shade600,
                              behavior: SnackBarBehavior.floating,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                    
                    const SizedBox(width: 8),
                    
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}