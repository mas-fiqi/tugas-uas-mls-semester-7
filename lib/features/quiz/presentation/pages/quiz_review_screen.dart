import 'package:flutter/material.dart';
import 'package:mls/core/constants/colors.dart';

class QuizReviewScreen extends StatelessWidget {
  const QuizReviewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Review Jawaban'),
        backgroundColor: kPrimaryColor,
      ),
      body: Column(
        children: [
          // Header Info
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.grey[100],
              border: Border(bottom: BorderSide(color: Colors.grey[300]!)),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildHeaderItem('Di Mulai Pada', '10:15'),
                _buildHeaderItem('Status', 'Selesai'),
                _buildHeaderItem('Nilai', '85/100'),
              ],
            ),
          ),

          // List Soal
          Expanded(
            child: ListView.separated(
              itemCount: 15,
              separatorBuilder: (context, index) => Divider(height: 1, color: Colors.grey[300]),
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Question Label
                      SizedBox(
                        width: 100,
                        child: Text(
                          'Pertanyaan ${index + 1}',
                          style: const TextStyle(fontWeight: FontWeight.bold, color: kTextColor),
                        ),
                      ),
                      
                      // Question Summary Box
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              padding: const EdgeInsets.all(12),
                              decoration: BoxDecoration(
                                color: kSurfaceColor,
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: const Text(
                                'Radio button dapat digunakan untuk menentukan...?', // Dummy Question Text
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(color: kTextColor),
                              ),
                            ),
                            const SizedBox(height: 8),
                            const Text(
                              'Jawaban Tersimpan',
                              style: TextStyle(fontSize: 12, color: Colors.green, fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                      
                      // Action Link
                      const SizedBox(width: 12),
                      TextButton(
                        onPressed: () {
                          // Show detail (read-only quiz screen or dialog)
                        },
                        child: const Text('Lihat Soal'),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHeaderItem(String label, String value) {
    return Column(
      children: [
        Text(label, style: const TextStyle(fontSize: 12, color: kTextLightColor)),
        const SizedBox(height: 4),
        Text(value, style: const TextStyle(fontWeight: FontWeight.bold, color: kTextColor)),
      ],
    );
  }
}
