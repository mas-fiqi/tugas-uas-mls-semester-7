import 'package:flutter/material.dart';
import 'package:mls/core/constants/colors.dart';
import 'package:mls/features/quiz/presentation/pages/quiz_screen.dart';

class QuizInfoScreen extends StatelessWidget {
  const QuizInfoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Hero Image / Icon
            Container(
              padding: const EdgeInsets.all(30),
              decoration: BoxDecoration(
                color: kPrimaryColor.withOpacity(0.05),
                shape: BoxShape.circle,
              ),
              child: const Icon(Icons.quiz_rounded, size: 80, color: kPrimaryColor),
            ),
            const SizedBox(height: 30),
            
            // Title
            const Text(
              'Kuis Pertemuan 1',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: kTextColor),
            ),
            const SizedBox(height: 12),
            Text(
              'Uji pemahaman Anda tentang materi pertemuan 1-3. Pastikan koneksi internet lancar.',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 14, color: Colors.grey[600], height: 1.5),
            ),
            
            const SizedBox(height: 40),

            // Info Grid
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildInfoItem(Icons.timer_outlined, '15 Menit', 'Durasi'),
                Container(width: 1, height: 40, color: Colors.grey[300]),
                _buildInfoItem(Icons.list_alt, '15 Soal', 'Jumlah'),
                Container(width: 1, height: 40, color: Colors.grey[300]),
                _buildInfoItem(Icons.star_outline, 'Tertinggi', 'Penilaian'),
              ],
            ),

            const SizedBox(height: 60),

            // Start Button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: kPrimaryColor,
                  padding: const EdgeInsets.symmetric(vertical: 18),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                  elevation: 5,
                  shadowColor: kPrimaryColor.withOpacity(0.4),
                ),
                onPressed: () {
                   Navigator.pushReplacement( // Use pushReplacement so back doesn't go here
                    context,
                    MaterialPageRoute(builder: (context) => const QuizScreen()),
                  );
                },
                child: const Text(
                  'Mulai Kerjakan',
                  style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            const SizedBox(height: 16),
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Batal', style: TextStyle(color: Colors.grey)),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoItem(IconData icon, String value, String label) {
    return Column(
      children: [
        Icon(icon, color: kPrimaryColor, size: 28),
        const SizedBox(height: 8),
        Text(
          value,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: kTextColor),
        ),
        Text(
          label,
          style: TextStyle(fontSize: 12, color: Colors.grey[500]),
        ),
      ],
    );
  }
}
