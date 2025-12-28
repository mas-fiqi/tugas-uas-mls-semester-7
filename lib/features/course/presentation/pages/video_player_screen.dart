import 'package:flutter/material.dart';
import 'package:mls/core/constants/colors.dart';

class VideoPlayerScreen extends StatelessWidget {
  const VideoPlayerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      appBar: AppBar(
        title: const Text('Video - User Interface Design...'),
        backgroundColor: kPrimaryColor,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 1. Video Area (16:9 Black Container)
            Container(
              width: double.infinity,
              height: 220, // Approx 16:9 for mobile width
              color: Colors.black,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  // Placeholder Background (Optional)
                  Opacity(
                    opacity: 0.5,
                    child: Image.asset(
                      'assets/images/kampus.png', // Reuse existing image as thumb
                      width: double.infinity,
                      height: double.infinity,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) => Container(color: Colors.black),
                    ),
                  ),
                  // Play Icon & Title Overlay
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.red.withOpacity(0.9),
                          border: Border.all(color: Colors.white, width: 2),
                        ),
                        child: const Icon(Icons.play_arrow, color: Colors.white, size: 40),
                      ),
                      const SizedBox(height: 16),
                      const Text(
                        'UI DESIGN',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 2,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            
            // 2. Playlist Section
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Video Lain Nya',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: kTextColor,
                    ),
                  ),
                  const SizedBox(height: 16),
                  
                  // List of Recommendations
                  _buildVideoItem('Pengantar UX Design', '12:30'),
                  _buildVideoItem('Wireframing Basics', '08:45'),
                  _buildVideoItem('Color Theory', '15:20'),
                  _buildVideoItem('Typography in Mobile', '10:00'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildVideoItem(String title, String duration) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      child: Row(
        children: [
          // Thumbnail
          Container(
            width: 100,
            height: 60,
            decoration: BoxDecoration(
              color: Colors.black87,
              borderRadius: BorderRadius.circular(8),
              image: const DecorationImage(
                image: AssetImage('assets/images/kampus.png'), // Reuse placeholder
                fit: BoxFit.cover,
                opacity: 0.7,
              ),
            ),
            alignment: Alignment.center,
            child: const Icon(Icons.play_circle_outline, color: Colors.white),
          ),
          const SizedBox(width: 12),
          // Info
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    color: kTextColor,
                    fontSize: 14,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 4),
                Text(
                  'Durasi: $duration',
                  style: const TextStyle(fontSize: 12, color: kTextLightColor),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
