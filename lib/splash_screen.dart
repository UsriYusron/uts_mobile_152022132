// lib/splash_screen.dart
import 'dart:async';
import 'package:flutter/material.dart';
import 'dashboard_page.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // Pindah ke DashboardPage setelah 5 detik
    Timer(const Duration(seconds: 5), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => DashboardPage()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.indigo,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // Foto Anda
            Container(
              width: 150,
              height: 150,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: const DecorationImage(
                  image: AssetImage('assets/images/foto_saya.jpg'), // Ganti dengan nama file Anda
                  fit: BoxFit.cover,
                ),
                border: Border.all(color: Colors.white, width: 4),
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'UTS Pemrograman Mobile', // Judul Aplikasi
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              'NIM: 152022132', // Ganti dengan NIM Anda
              style: TextStyle(fontSize: 18, color: Colors.white70),
            ),
            const Text(
              'Nama: Muhamad Usri Yusron', // Ganti dengan Nama Anda
              style: TextStyle(fontSize: 18, color: Colors.white70),
            ),
            const SizedBox(height: 40),
            const CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}