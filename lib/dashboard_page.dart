// lib/dashboard_page.dart
import 'package:flutter/material.dart';
import 'biodata_page.dart'; // Import halaman menu lainnya
import 'kontak_page.dart';
import 'kalkulator_page.dart';

class DashboardPage extends StatefulWidget {
  @override
  _DashboardPageState createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  int _selectedIndex = 0;

  // Daftar Widget/Fragment untuk Bottom Navigation Bar
  final List<Widget> _widgetOptions = <Widget>[
    BiodataPage(),
    KontakPage(),
    KalkulatorPage(),
    Text('Halaman Kalkulator'),
    Text('Halaman Cuaca'),
    Text('Halaman Berita'),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dashboard Aplikasi'),
        backgroundColor: Colors.blueAccent,
      ),
      // Tampilkan "Fragment" yang dipilih
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      // **Bottom Navigation Bar**
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Biodata',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.contact_mail),
            label: 'Kontak',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calculate),
            label: 'Kalkulator',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.cloud),
            label: 'Cuaca',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.article),
            label: 'Berita',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.blueAccent,
        unselectedItemColor: Colors.grey,
        onTap: _onItemTapped,
        type: BottomNavigationBarType.fixed, // Penting untuk 5 item atau lebih
      ),
    );
  }
}