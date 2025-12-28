import 'package:flutter/material.dart';
import 'package:mls/core/constants/colors.dart';
import 'package:mls/shared/widgets/course_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 50),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // a. Header
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      'Hallo,',
                      style: TextStyle(
                        fontSize: 18,
                        color: kTextLightColor,
                      ),
                    ),
                    Text(
                      'Mahasiswa', // TODO: Ganti dengan nama user dinamis
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: kTextColor,
                      ),
                    ),
                  ],
                ),
                const CircleAvatar(
                  radius: 25,
                  backgroundColor: kSurfaceColor,
                  child: Icon(Icons.person, color: kPrimaryColor),
                  // TODO: Ganti dengan Image.network/asset untuk foto profil
                ),
              ],
            ),
            const SizedBox(height: 30),

            // b. Kartu Tugas (Merah)
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: kPrimaryColor,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: kPrimaryColor.withOpacity(0.4),
                    offset: const Offset(0, 8),
                    blurRadius: 16,
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: const Text(
                      'Tugas 01',
                      style: TextStyle(color: Colors.white, fontSize: 12),
                    ),
                  ),
                  const SizedBox(height: 12),
                  const Text(
                    'Desain Antarmuka Pengguna\nModern',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Row(
                    children: const [
                      Icon(Icons.access_time, color: Colors.white70, size: 16),
                      SizedBox(width: 8),
                      Text(
                        'Dikumpulkan: Besok, 09:00',
                        style: TextStyle(color: Colors.white70, fontSize: 12),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 30),

            // c. Pengumuman
            const Text(
              'Pengumuman Terakhir',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: kTextColor,
              ),
            ),
            const SizedBox(height: 16),
            Container(
              width: double.infinity,
              height: 120,
              decoration: BoxDecoration(
                color: Colors.grey[300], // Placeholder
                borderRadius: BorderRadius.circular(12),
                image: const DecorationImage(
                  image: AssetImage('assets/images/kampus.png'), // Reuse image
                  fit: BoxFit.cover,
                  colorFilter: ColorFilter.mode(
                    Colors.black26, 
                    BlendMode.darken,
                  ),
                ),
              ),
              alignment: Alignment.center,
              child: const Text(
                'Jadwal UAS Semester Ganjil',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
            ),
            const SizedBox(height: 30),

            // d. Progres Kelas
            const Text(
              'Progres Kelas',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: kTextColor,
              ),
            ),
            const SizedBox(height: 16),
            
            // List Mata Kuliah (Dummy Data)
            const CourseCard(
              courseName: 'Pemrograman Web',
              lecturerCode: 'Dosen: Pak Budi',
              progress: 0.75,
              iconColor: Colors.orange,
              iconData: Icons.web,
            ),
            const CourseCard(
              courseName: 'Mobile Development',
              lecturerCode: 'Dosen: Bu Siti',
              progress: 0.40,
              iconColor: Colors.blue,
              iconData: Icons.phone_android,
            ),
            const CourseCard(
              courseName: 'Basis Data Lanjut',
              lecturerCode: 'Dosen: Pak Joko',
              progress: 0.90,
              iconColor: Colors.purple,
              iconData: Icons.storage,
            ),
             const CourseCard(
              courseName: 'Statistika',
              lecturerCode: 'Dosen: Bu Ani',
              progress: 0.20,
              iconColor: Colors.green,
              iconData: Icons.bar_chart,
            ),
          ],
        ),
      ),
    );
  }
}
