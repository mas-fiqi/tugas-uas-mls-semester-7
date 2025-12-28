import 'dart:async';
import 'dart:ui'; // For BackdropFilter
import 'package:flutter/cupertino.dart'; // For iOS Loader
import 'package:flutter/material.dart';
import 'package:mls/core/constants/colors.dart';
import 'package:mls/features/authentication/presentation/pages/login_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();
    
    // Fade Animation
    _controller = AnimationController(
       duration: const Duration(seconds: 2),
       vsync: this,
    );
    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(_controller);
    _controller.forward();

    // Timer to Login
    Timer(const Duration(seconds: 4), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => const LoginScreen()),
      );
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          // 1. Background Image
          Positioned.fill(
            child: Image.asset(
              'assets/images/kampus.png',
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) => Container(color: kPrimaryColor),
            ),
          ),
          
          // 2. Blur Effect (Glassmorphism)
          Positioned.fill(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
              child: Container(
                color: Colors.black.withOpacity(0.4), // Dark Overlay
              ),
            ),
          ),

          // 3. Content
          Center(
            child: FadeTransition(
              opacity: _fadeAnimation,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Logo Container with Shadow
                  Container(
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.1),
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.2),
                          blurRadius: 20,
                          spreadRadius: 5,
                        ),
                      ],
                      border: Border.all(color: Colors.white.withOpacity(0.2)),
                    ),
                    child: Image.asset(
                      'assets/images/logo.png',
                      width: 100,
                      height: 100,
                      errorBuilder: (context, error, stackTrace) => const Icon(Icons.school, size: 80, color: Colors.white),
                    ),
                  ),
                  
                  const SizedBox(height: 30),
                  
                  // Elegant Text
                  const Text(
                    'SMART CAMPUS',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 4.0, // Wide spacing for elegance
                      fontFamily: 'Serif', // Fallback to Serif if no custom font
                    ),
                  ),
                  
                  const SizedBox(height: 10),
                  
                  Text(
                    'Connect. Learn. Grow.',
                    style: TextStyle(
                      color: Colors.white.withOpacity(0.7),
                      fontSize: 14,
                      letterSpacing: 1.5,
                    ),
                  ),

                  const SizedBox(height: 60),

                  // iOS Style Loader
                  const CupertinoActivityIndicator(
                    radius: 14,
                    color: Colors.white,
                  ),
                ],
              ),
            ),
          ),

          // Version Info (Bottom)
          Positioned(
            bottom: 40,
            left: 0,
            right: 0,
            child: Center(
              child: Text(
                'v1.0.0',
                style: TextStyle(color: Colors.white.withOpacity(0.3), fontSize: 12),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
