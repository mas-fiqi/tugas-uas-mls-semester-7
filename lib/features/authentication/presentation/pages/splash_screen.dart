import 'dart:async';
import 'package:flutter/material.dart';
import 'package:mls/core/constants/colors.dart';
import 'package:mls/features/authentication/presentation/pages/login_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // Tunggu 3 detik lalu pindah ke LoginScreen
    Timer(const Duration(seconds: 3), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => const LoginScreen()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor, // Merah Marun
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Logo
            Image.asset(
              'assets/images/logo.png',
              width: 150,
              height: 150,
              // Fallback jika gambar gagal load (misal user belum restart)
              errorBuilder: (context, error, stackTrace) => const Icon(
                Icons.school,
                size: 100,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 24),
            // Teks
            const Text(
              'Learning Management System',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
