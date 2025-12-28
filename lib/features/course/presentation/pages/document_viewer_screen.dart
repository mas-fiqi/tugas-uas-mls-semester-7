import 'package:flutter/material.dart';
import 'dart:ui'; // For BackdropFilter
import 'package:mls/core/constants/colors.dart';

class DocumentViewerScreen extends StatelessWidget {
  const DocumentViewerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true, // Allow content behind AppBar
      backgroundColor: Colors.transparent, // Use Container gradient
      appBar: AppBar(
        title: const Text('Slide Presentasi', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
        centerTitle: true,
        backgroundColor: Colors.transparent, // Glassy AppBar
        elevation: 0,
        flexibleSpace: ClipRRect(
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
            child: Container(color: Colors.black.withOpacity(0.2)),
          ),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
        actions: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            margin: const EdgeInsets.only(right: 16),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.2),
              borderRadius: BorderRadius.circular(20),
            ),
            child: const Text(
              '1 / 26',
              style: TextStyle(color: Colors.white, fontSize: 12, fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/kampus.png'), // Background Wallpaper
            fit: BoxFit.cover,
          ),
        ),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15), // Blur background
          child: Container(
            color: Colors.black.withOpacity(0.3), // Dark overlay
            child: ListView.builder(
              padding: const EdgeInsets.fromLTRB(20, 100, 20, 20),
              itemCount: 5,
              itemBuilder: (context, index) {
                return _buildIOSNotificationCard(index);
              },
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildIOSNotificationCard(int index) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(18), // iOS rounded corners
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
          child: Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.75), // Milky glass
              borderRadius: BorderRadius.circular(18),
              border: Border.all(color: Colors.white.withOpacity(0.2)),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 10,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Header (App Icon style)
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(4),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: const Icon(Icons.slideshow, size: 14, color: Colors.orange), // App Icon
                    ),
                    const SizedBox(width: 8),
                    Text(
                      'SLIDE HALAMAN ${index + 1}',
                      style: TextStyle(
                        fontSize: 10, 
                        fontWeight: FontWeight.bold, 
                        color: Colors.black.withOpacity(0.6),
                        letterSpacing: 0.5,
                      ),
                    ),
                    const Spacer(),
                    Text(
                      'Sekarang',
                      style: TextStyle(fontSize: 10, color: Colors.black.withOpacity(0.5)),
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                
                // Content Title
                const Text(
                  'Pengantar User Interface',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: Colors.black87),
                ),
                const SizedBox(height: 6),
                
                // Content Body
                const Text(
                  'Pada pertemuan ini kita akan membahas prinsip dasar desain antarmuka, mencakup tata letak, tipografi, dan warna.',
                  style: TextStyle(fontSize: 14, color: Colors.black54, height: 1.4),
                ),
                
                const SizedBox(height: 12),
                
                // Mock Slide Image
                Container(
                  height: 150,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(12),
                  ),
                  alignment: Alignment.center,
                  child: Icon(Icons.image, color: Colors.grey[400], size: 40),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
