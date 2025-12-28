import 'package:flutter/material.dart';
import 'package:mls/core/constants/colors.dart';
import 'package:mls/features/task/presentation/pages/upload_file_screen.dart';

class TaskDetailScreen extends StatelessWidget {
  const TaskDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // Clean white background
      appBar: AppBar(
        title: const Text('Detail Tugas', style: TextStyle(color: kTextColor, fontWeight: FontWeight.bold)),
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: kTextColor),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header Info
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: Colors.blue[50],
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: const Icon(Icons.assignment, color: Colors.blue, size: 28),
                ),
                const SizedBox(width: 16),
                const Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Tugas 01 - UID Android',
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: kTextColor),
                      ),
                      SizedBox(height: 4),
                      Text(
                        'Mobile Programming',
                        style: TextStyle(fontSize: 14, color: Colors.grey),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24),

            // Instructions Card
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.grey[50], // Light grey for contrast
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: Colors.grey[200]!),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Instruksi Pengerjaan',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: kTextColor),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    'Buatlah desain antarmuka aplikasi Android untuk fitur Login dan Register menggunakan Flutter. Perhatikan pedoman Material Design dan pastikan kode bersih serta terstruktur.',
                    style: TextStyle(fontSize: 14, color: Colors.grey[700], height: 1.6),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),

            // Status Grid
            const Text(
              'Status Pengerjaan',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: kTextColor),
            ),
            const SizedBox(height: 16),
            GridView.count(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              crossAxisCount: 2,
              crossAxisSpacing: 12,
              mainAxisSpacing: 12,
              childAspectRatio: 1.5,
              children: [
                _buildStatusCard(
                  icon: Icons.calendar_today,
                  iconColor: Colors.orange,
                  label: 'Batas Waktu',
                  value: '25 Des 2025',
                  subValue: '23:59 WIB',
                ),
                _buildStatusCard(
                  icon: Icons.timer,
                  iconColor: Colors.red,
                  label: 'Sisa Waktu',
                  value: '2 Hari',
                  subValue: '5 Jam Lagi',
                ),
                _buildStatusCard(
                  icon: Icons.upload_file,
                  iconColor: Colors.purple,
                  label: 'Status Upload',
                  value: 'Belum Ada',
                  subValue: '',
                  bgColor: Colors.purple[50],
                ),
                _buildStatusCard(
                  icon: Icons.grade,
                  iconColor: kGreenDark,
                  label: 'Nilai',
                  value: '- / 100',
                  subValue: 'Belum Dinilai',
                ),
              ],
            ),

            const SizedBox(height: 32),

            // Action Button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const UploadFileScreen()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: kPrimaryColor,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                  elevation: 4,
                  shadowColor: kPrimaryColor.withOpacity(0.4),
                ),
                icon: const Icon(Icons.cloud_upload, color: Colors.white),
                label: const Text(
                  'Tambahkan Tugas',
                  style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStatusCard({
    required IconData icon,
    required Color iconColor,
    required String label,
    required String value,
    required String subValue,
    Color? bgColor,
  }) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: bgColor ?? Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.grey[200]!),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.05),
            offset: const Offset(0, 4),
            blurRadius: 10,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            children: [
              Icon(icon, size: 20, color: iconColor),
              const SizedBox(width: 8),
              Text(
                label,
                style: TextStyle(fontSize: 11, color: Colors.grey[600], fontWeight: FontWeight.w600),
              ),
            ],
          ),
          const Spacer(),
          Text(
            value,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: kTextColor),
          ),
          if (subValue.isNotEmpty)
            Text(
              subValue,
              style: TextStyle(fontSize: 11, color: Colors.grey[500]),
            ),
        ],
      ),
    );
  }
}
