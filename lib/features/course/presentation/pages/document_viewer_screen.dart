import 'package:flutter/material.dart';
import 'package:mls/core/constants/colors.dart';

class DocumentViewerScreen extends StatelessWidget {
  const DocumentViewerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Pengantar User Interface Design'),
        backgroundColor: kPrimaryColor,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
        actions: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            margin: const EdgeInsets.only(right: 16),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.2),
              borderRadius: BorderRadius.circular(4),
            ),
            child: const Text(
              'Halaman 1/26',
              style: TextStyle(color: Colors.white, fontSize: 12),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Mock Content Pages
            _buildMockPage(1, Colors.grey[100]!),
            Divider(height: 8, thickness: 8, color: Colors.grey[300]),
            _buildMockPage(2, Colors.white),
            Divider(height: 8, thickness: 8, color: Colors.grey[300]),
            _buildMockPage(3, Colors.grey[100]!),
          ],
        ),
      ),
    );
  }

  Widget _buildMockPage(int pageNum, Color bgColor) {
    return Container(
      width: double.infinity,
      height: 500, // A4 ratio approximation
      color: bgColor,
      padding: const EdgeInsets.all(32),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Halaman $pageNum',
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
          ),
          const SizedBox(height: 20),
          Container(
            width: double.infinity,
            height: 200,
            color: Colors.grey[300],
            alignment: Alignment.center,
            child: const Icon(Icons.image, size: 50, color: Colors.grey),
          ),
          const SizedBox(height: 20),
          const Text(
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.',
            style: TextStyle(fontSize: 14, height: 1.5, color: kTextColor),
          ),
          const SizedBox(height: 10),
          const Text(
            'Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident.',
            style: TextStyle(fontSize: 14, height: 1.5, color: kTextColor),
          ),
        ],
      ),
    );
  }
}
