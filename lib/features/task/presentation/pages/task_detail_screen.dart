import 'package:flutter/material.dart';
import 'package:mls/core/constants/colors.dart';
import 'package:mls/features/task/presentation/pages/upload_file_screen.dart';

class TaskDetailScreen extends StatelessWidget {
  const TaskDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Tugas 01 - UID Android'),
        backgroundColor: kPrimaryColor,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Instructions
            const Text(
              'Buatlah desain antarmuka aplikasi Android untuk fitur Login dan Register menggunakan Flutter. Perhatikan pedoman Material Design dan pastikan kode bersih serta terstruktur.',
              style: TextStyle(fontSize: 16, color: kTextColor, height: 1.5),
            ),
            const SizedBox(height: 30),

            // Status Container
            Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey[300]!),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                children: [
                  // Status Header
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                    decoration: BoxDecoration(
                      color: kPrimaryColor.withOpacity(0.1), // Light Maroon
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(12),
                        topRight: Radius.circular(12),
                      ),
                    ),
                    child: const Text(
                      'Status Tugas',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: kPrimaryColor,
                        fontSize: 16,
                      ),
                    ),
                  ),
                  
                  // Status Info (Table)
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Table(
                      columnWidths: const {
                        0: FlexColumnWidth(1.5), // Label width
                        1: FlexColumnWidth(2),   // Value width
                      },
                      children: [
                        _buildTableRow('Status Pengumpulan', 'Belum Dikumpulkan', false),
                        _buildTableRow('Status Nilai', 'Belum Dinilai', false),
                        _buildTableRow('Batas Waktu', 'Jumat, 25 Des 2025, 23:59', false),
                        _buildTableRow('Sisa Waktu', '2 Hari 5 Jam', true),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 40),

            // Add Submission Button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: kPrimaryColor,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                onPressed: () {
                   Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const UploadFileScreen()),
                  );
                },
                child: const Text('Tambahkan Tugas'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  TableRow _buildTableRow(String label, String value, bool isLast) {
    return TableRow(
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 12.0),
          child: Text(label, style: const TextStyle(fontWeight: FontWeight.w600, color: kTextLightColor)),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 12.0),
          child: Text(value, style: const TextStyle(fontWeight: FontWeight.w500, color: kTextColor)),
        ),
      ],
    );
  }
}
