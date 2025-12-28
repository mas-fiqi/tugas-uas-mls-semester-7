import 'package:flutter/material.dart';
import 'package:mls/core/constants/colors.dart';
import 'package:mls/features/quiz/presentation/pages/quiz_review_screen.dart';

class QuizResultScreen extends StatelessWidget {
  const QuizResultScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Quiz Review 1'),
        backgroundColor: kPrimaryColor,
        automaticallyImplyLeading: false, // Prevent back button to quiz
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          children: [
            const SizedBox(height: 20),
            // Score Display
            Container(
              padding: const EdgeInsets.all(24),
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.1),
                    blurRadius: 10,
                    offset: const Offset(0, 5),
                  ),
                ],
              ),
              child: Column(
                children: [
                  const Text(
                    'Nilai Akhir Anda',
                    style: TextStyle(fontSize: 16, color: kTextLightColor),
                  ),
                  const SizedBox(height: 12),
                  RichText(
                    text: const TextSpan(
                      children: [
                        TextSpan(
                          text: '85.0',
                          style: TextStyle(
                            fontSize: 48,
                            fontWeight: FontWeight.bold,
                            color: kPrimaryColor,
                          ),
                        ),
                        TextSpan(
                          text: ' / 100.0',
                          style: TextStyle(
                            fontSize: 20,
                            color: kTextLightColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 32),

            // Summary Table
            Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey[300]!),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                children: [
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                    decoration: BoxDecoration(
                      color: kSurfaceColor,
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(12),
                        topRight: Radius.circular(12),
                      ),
                    ),
                    child: const Text(
                      'Ringkasan Pengerjaan',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: kTextColor,
                        fontSize: 16,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Table(
                      columnWidths: const {
                        0: FlexColumnWidth(1),
                        1: FlexColumnWidth(2), 
                      },
                      defaultVerticalAlignment: TableCellVerticalAlignment.middle,
                      children: [
                        _buildTableRow('Status', 'Selesai'),
                        _buildTableRow('Waktu', 'Kamis, 25 Des 2025, 10:15'),
                        _buildTableRow('Nilai', '85,0 / 100,0'),
                        TableRow(
                          children: [
                            const Padding(
                              padding: EdgeInsets.only(bottom: 12.0),
                              child: Text('Aksi', style: TextStyle(color: kTextLightColor)),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(bottom: 12.0),
                              child: GestureDetector(
                                onTap: () {
                                   Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) => const QuizReviewScreen()),
                                  );
                                },
                                child: const Text(
                                  'Tinjau Kembali',
                                  style: TextStyle(
                                    color: Colors.blue,
                                    fontWeight: FontWeight.bold,
                                    decoration: TextDecoration.underline,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            
            const SizedBox(height: 48),

            // Navigation Buttons
            Row(
              children: [
                Expanded(
                  child: OutlinedButton(
                    style: OutlinedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      side: const BorderSide(color: Colors.grey),
                    ),
                    onPressed: () {
                      // Logic to retake quiz
                    },
                    child: const Text('Ambil Kuis Lagi', style: TextStyle(color: kTextColor)),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: OutlinedButton(
                    style: OutlinedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      side: const BorderSide(color: Colors.grey),
                    ),
                    onPressed: () {
                      Navigator.popUntil(context, (route) => route.isFirst); // Go back to Home/Course
                    },
                    child: const Text('Kembali Ke Kelas', style: TextStyle(color: kTextColor)),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  TableRow _buildTableRow(String label, String value) {
    return TableRow(
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 12.0),
          child: Text(label, style: const TextStyle(color: kTextLightColor)),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 12.0),
          child: Text(value, style: const TextStyle(fontWeight: FontWeight.w500, color: kTextColor)),
        ),
      ],
    );
  }
}
