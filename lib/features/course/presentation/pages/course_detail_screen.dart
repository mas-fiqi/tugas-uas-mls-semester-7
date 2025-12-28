import 'package:flutter/material.dart';
import 'package:mls/core/constants/colors.dart';
import 'package:mls/features/quiz/presentation/pages/quiz_info_screen.dart';

class CourseDetailScreen extends StatelessWidget {
  final String courseName;
  final String lecturerName;

  const CourseDetailScreen({
    super.key,
    required this.courseName,
    required this.lecturerName,
  });

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                courseName,
                style: const TextStyle(fontSize: 18),
              ),
              Text(
                lecturerName,
                style: const TextStyle(fontSize: 12, fontWeight: FontWeight.normal),
              ),
            ],
          ),
          backgroundColor: kPrimaryColor,
          bottom: const TabBar(
            indicatorColor: Colors.white,
            tabs: [
              Tab(text: 'Materi'),
              Tab(text: 'Tugas Dan Kuis'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            // Tab 1: Materi
            ListView.builder(
              itemCount: 14, // 14 Pertemuan typical
              padding: const EdgeInsets.all(16),
              itemBuilder: (context, index) {
                return Card(
                  margin: const EdgeInsets.only(bottom: 12),
                  elevation: 2,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                  child: ExpansionTile(
                    title: Text(
                      'Pertemuan ${index + 1}',
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text('Topik Pembahasan Minggu ${index + 1}'),
                    children: [
                      ListTile(
                        leading: const Icon(Icons.picture_as_pdf, color: Colors.red),
                        title: const Text('Slide Presentasi.pdf'),
                        trailing: const Icon(Icons.check_circle, color: kAccentColor), // Completed
                        onTap: () {},
                      ),
                      ListTile(
                        leading: const Icon(Icons.video_library, color: Colors.blue),
                        title: const Text('Rekaman Zoom'),
                        onTap: () {},
                      ),
                    ],
                  ),
                );
              },
            ),

            // Tab 2: Tugas
            ListView(
              padding: const EdgeInsets.all(16),
              children: [
                _buildTaskItem(context, 'Tugas 1: Analisis UI', 'Deadline: Kemarin', true),
                _buildTaskItem(context, 'Tugas 2: Wireframing', 'Deadline: Besok, 23:59', false),
                _buildTaskItem(context, 'Kuis 1: Teori Dasar', 'Status: Belum Mengerjakan', false),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTaskItem(BuildContext context, String title, String subtitle, bool isDone) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      child: ListTile(
        leading: Icon(
          title.contains('Kuis') ? Icons.quiz : Icons.assignment,
          color: isDone ? kAccentColor : kPrimaryColor,
        ),
        title: Text(
          title, 
          style: TextStyle(
            decoration: isDone ? TextDecoration.lineThrough : null,
            color: isDone ? Colors.grey : kTextColor,
          ),
        ),
        subtitle: Text(subtitle),
        trailing: isDone 
            ? const Icon(Icons.check_circle, color: kAccentColor)
            : const Icon(Icons.radio_button_unchecked, color: Colors.grey),
        onTap: () {
          if (title.contains('Kuis')) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const QuizInfoScreen()),
            );
          }
        },
      ),
    );
  }
}
