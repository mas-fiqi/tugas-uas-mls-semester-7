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
        title: const Text('Quiz Review 1'),
        backgroundColor: kPrimaryColor,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Silahkan kerjakan kuis ini untuk menguji pemahaman Anda mengenai materi pertemuan 1-3.',
              style: TextStyle(fontSize: 16, color: kTextColor),
            ),
            const SizedBox(height: 24),
            
            // Container Info
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: kSurfaceColor,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildInfoRow('Batas Waktu', '15 Menit'),
                  const SizedBox(height: 12),
                  _buildInfoRow('Metode Penilaian', 'Nilai Tertinggi'),
                  const SizedBox(height: 12),
                  _buildInfoRow('Jumlah Soal', '15 Soal'),
                ],
              ),
            ),
            
            const Spacer(),
            
            // Buttons
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: kPrimaryColor,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                ),
                onPressed: () {
                   Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const QuizScreen()),
                  );
                },
                child: const Text('Ambil Kuis'),
              ),
            ),
            const SizedBox(height: 16),
            SizedBox(
              width: double.infinity,
              child: OutlinedButton(
                style: OutlinedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  side: const BorderSide(color: kPrimaryColor),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                ),
                onPressed: () => Navigator.pop(context),
                child: const Text('Kembali Ke Kelas', style: TextStyle(color: kPrimaryColor)),
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoRow(String label, String value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(label, style: const TextStyle(color: kTextLightColor, fontSize: 14)),
        Text(value, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
      ],
    );
  }
}
