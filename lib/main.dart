import 'package:flutter/material.dart';
import 'core/theme/app_theme.dart';
// Ganti home dengan SplashScreen nanti di Perintah #2
import 'package:flutter/cupertino.dart'; 

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'LMS Hybrid App',
      theme: appTheme, // Terapkan tema
      home: const Text('Loading...'), // Placeholder sementara. Akan diganti SplashScreen.
      debugShowCheckedModeBanner: false,
    );
  }
}
