import 'package:flutter/material.dart';
import 'package:mls/core/constants/colors.dart';
import 'package:mls/shared/widgets/course_card.dart';
import 'package:mls/features/course/presentation/pages/course_detail_screen.dart';

class MyClassesScreen extends StatelessWidget {
  const MyClassesScreen({super.key});

  final List<Map<String, dynamic>> courses = const [
    {
      'name': 'Desain Antarmuka Pengguna (UI/UX)',
      'dosen': 'Pak Budi Santoso',
      'progress': 0.75,
      'color': Colors.orange,
      'icon': Icons.design_services,
    },
    {
      'name': 'Sistem Operasi',
      'dosen': 'Bu Rina Wati',
      'progress': 0.40,
      'color': Colors.blue,
      'icon': Icons.computer,
    },
    {
      'name': 'Kewarganegaraan',
      'dosen': 'Pak Joko Widodo',
      'progress': 0.90,
      'color': Colors.red,
      'icon': Icons.flag,
    },
    {
      'name': 'Multimedia',
      'dosen': 'Bu Ani Susanti',
      'progress': 0.20,
      'color': Colors.purple,
      'icon': Icons.movie,
    },
    {
      'name': 'Bahasa Inggris Profesi',
      'dosen': 'Mr. John Doe',
      'progress': 0.60,
      'color': Colors.green,
      'icon': Icons.language,
    },
    {
      'name': 'Pendidikan Jasmani & Olahraga',
      'dosen': 'Pak Bambang Pamungkas',
      'progress': 1.00,
      'color': Colors.brown,
      'icon': Icons.sports_soccer,
    },
     {
      'name': 'Kecerdasan Buatan',
      'dosen': 'Dr. Alan Turing',
      'progress': 0.10,
      'color': Colors.teal,
      'icon': Icons.psychology,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      appBar: AppBar(
        title: const Text(
          'Kelas Saya',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.white,
        foregroundColor: kTextColor,
        elevation: 0,
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            // Logic handled by TabController usually, but adding for UI compliance
          },
        ),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: courses.length,
        itemBuilder: (context, index) {
          final course = courses[index];
          return CourseCard(
            courseName: course['name'],
            lecturerCode: 'Dosen: ${course['dosen']}',
            progress: course['progress'],
            iconColor: course['color'],
            iconData: course['icon'],
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CourseDetailScreen(
                    courseName: course['name'],
                    lecturerName: course['dosen'],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
