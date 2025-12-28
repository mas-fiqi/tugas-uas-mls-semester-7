import 'package:flutter/material.dart';
import 'dart:ui'; // For Blur
import 'package:mls/core/constants/colors.dart';

class VideoPlayerScreen extends StatelessWidget {
  const VideoPlayerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black, // Immersive black
      body: Stack(
        children: [
          // Background (blurred poster)
          Positioned.fill(
            child: Image.asset(
              'assets/images/kampus.png',
              fit: BoxFit.cover,
            ),
          ),
          Positioned.fill(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 30, sigmaY: 30),
              child: Container(color: Colors.black.withOpacity(0.8)), // Dark overlay
            ),
          ),

          SafeArea(
            child: Column(
              children: [
                // Custom AppBar (Transparent)
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: Row(
                    children: [
                      IconButton(
                        icon: const Icon(Icons.keyboard_arrow_down, color: Colors.white, size: 30),
                        onPressed: () => Navigator.pop(context),
                      ),
                      const Spacer(),
                      const Icon(Icons.airplay, color: Colors.white, size: 24),
                      const SizedBox(width: 20),
                      const Icon(Icons.more_horiz, color: Colors.white, size: 24),
                    ],
                  ),
                ),

                const SizedBox(height: 20),

                // Video Surface (Mock)
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: AspectRatio(
                    aspectRatio: 16 / 9,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(16),
                        boxShadow: [
                          BoxShadow(color: Colors.black.withOpacity(0.5), blurRadius: 20, offset: const Offset(0, 10)),
                        ],
                        image: const DecorationImage(
                          image: AssetImage('assets/images/kampus.png'),
                          fit: BoxFit.cover,
                        ),
                      ),
                      child: Center(
                        child: Container(
                          padding: const EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.2), // Glass play button
                            shape: BoxShape.circle,
                            border: Border.all(color: Colors.white.withOpacity(0.5)),
                          ),
                          child: const Icon(Icons.play_arrow, color: Colors.white, size: 40),
                        ),
                      ),
                    ),
                  ),
                ),
                
                const SizedBox(height: 30),

                // Track Info
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'User Interface Design',
                         style: TextStyle(color: Colors.white, fontSize: 22, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        'Pertemuan 1 • Mobile Programming',
                        style: TextStyle(color: Colors.white.withOpacity(0.6), fontSize: 16),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 30),

                // Progress Bar
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: Column(
                    children: [
                      LinearProgressIndicator(
                        value: 0.3,
                        backgroundColor: Colors.white.withOpacity(0.2),
                        valueColor: const AlwaysStoppedAnimation<Color>(Colors.white),
                        minHeight: 4,
                      ),
                      const SizedBox(height: 8),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('12:10', style: TextStyle(color: Colors.white.withOpacity(0.5), fontSize: 12)),
                          Text('-45:50', style: TextStyle(color: Colors.white.withOpacity(0.5), fontSize: 12)),
                        ],
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 30),

                // Controls
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(icon: const Icon(Icons.skip_previous, color: Colors.white, size: 36), onPressed: () {}),
                    const SizedBox(width: 30),
                    IconButton(icon: const Icon(Icons.pause, color: Colors.white, size: 48), onPressed: () {}), // Pause
                    const SizedBox(width: 30),
                    IconButton(icon: const Icon(Icons.skip_next, color: Colors.white, size: 36), onPressed: () {}),
                  ],
                ),

                const Spacer(),

                // Up Next (Playlist style)
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Row(
                    children: [
                      Container(
                        width: 40, height: 40,
                        decoration: BoxDecoration(
                          color: Colors.grey,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: const Icon(Icons.play_circle_filled, color: Colors.white),
                      ),
                      const SizedBox(width: 12),
                      const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('SELANJUTNYA', style: TextStyle(color: Colors.grey, fontSize: 10, fontWeight: FontWeight.bold)),
                          Text('Wireframing Basics', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                        ],
                      ),
                      const Spacer(),
                      const Icon(Icons.list, color: Colors.white),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
