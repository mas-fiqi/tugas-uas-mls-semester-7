import 'package:flutter/material.dart';
import 'package:mls/core/constants/colors.dart';
import 'package:mls/features/quiz/presentation/pages/quiz_info_screen.dart';
import 'package:mls/features/task/presentation/pages/task_detail_screen.dart';
import 'package:mls/features/course/presentation/pages/video_player_screen.dart';
import 'package:mls/features/course/presentation/pages/document_viewer_screen.dart';

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
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: kTextColor),
            onPressed: () => Navigator.pop(context),
          ),
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                courseName,
                style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: kTextColor),
              ),
              Text(
                lecturerName,
                style: TextStyle(fontSize: 12, fontWeight: FontWeight.normal, color: Colors.grey[600]),
              ),
            ],
          ),
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(60),
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              height: 45,
              decoration: BoxDecoration(
                color: Colors.grey[100],
                borderRadius: BorderRadius.circular(25),
              ),
              child: TabBar(
                indicator: BoxDecoration(
                  color: kPrimaryColor,
                  borderRadius: BorderRadius.circular(25),
                  boxShadow: [
                    BoxShadow(
                      color: kPrimaryColor.withOpacity(0.3),
                      blurRadius: 8,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                indicatorSize: TabBarIndicatorSize.tab,
                labelColor: Colors.white,
                unselectedLabelColor: Colors.grey[600],
                labelStyle: const TextStyle(fontWeight: FontWeight.bold),
                dividerColor: Colors.transparent, // Remove default divider
                tabs: const [
                  Tab(text: 'Materi'),
                  Tab(text: 'Tugas & Kuis'),
                ],
              ),
            ),
          ),
        ),
        body: TabBarView(
          children: [
            _buildMateriTab(context),
            _buildTugasTab(context),
          ],
        ),
      ),
    );
  }

  Widget _buildMateriTab(BuildContext context) {
    return ListView.builder(
      itemCount: 14,
      padding: const EdgeInsets.all(20),
      itemBuilder: (context, index) {
        return Container(
          margin: const EdgeInsets.only(bottom: 16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.08),
                spreadRadius: 2,
                blurRadius: 10,
                offset: const Offset(0, 4),
              ),
            ],
            border: Border.all(color: Colors.grey[100]!),
          ),
          child: Theme(
            data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
            child: ExpansionTile(
              tilePadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
              leading: Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: kPrimaryColor.withOpacity(0.1),
                  shape: BoxShape.circle,
                ),
                child: const Text('📄', style: TextStyle(fontSize: 16)), // Emoji icon
              ),
              title: Text(
                'Pertemuan ${index + 1}',
                style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: kTextColor),
              ),
              subtitle: Padding(
                padding: const EdgeInsets.only(top: 4),
                child: Text(
                  'Topik Pembahasan Minggu ${index + 1}',
                  style: TextStyle(color: Colors.grey[500], fontSize: 13),
                ),
              ),
              children: [
                 Padding(
                   padding: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
                   child: Column(
                     children: [
                       Container(height: 1, color: Colors.grey[100]), // Divider
                       const SizedBox(height: 12),
                       _buildMaterialItem(
                         context,
                         icon: Icons.picture_as_pdf,
                         color: Colors.red,
                         title: 'Slide Presentasi.pdf',
                         isCompleted: true,
                         onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const DocumentViewerScreen())),
                       ),
                       const SizedBox(height: 12),
                       _buildMaterialItem(
                         context,
                         icon: Icons.video_library,
                         color: Colors.blue,
                         title: 'Rekaman Zoom',
                         isCompleted: false,
                         onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const VideoPlayerScreen())),
                       ),
                     ],
                   ),
                 ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildMaterialItem(BuildContext context, {required IconData icon, required Color color, required String title, required bool isCompleted, required VoidCallback onTap}) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Colors.grey[50],
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          children: [
            Icon(icon, color: color, size: 28),
            const SizedBox(width: 12),
            Expanded(
              child: Text(
                title,
                style: const TextStyle(fontWeight: FontWeight.w500, color: kTextColor),
              ),
            ),
            if (isCompleted)
              const Icon(Icons.check_circle, color: kAccentColor, size: 20)
            else
              Icon(Icons.play_circle_outline, color: Colors.grey[400], size: 20),
          ],
        ),
      ),
    );
  }

  Widget _buildTugasTab(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(20),
      children: [
        _buildTaskCard(
          context,
          type: 'TUGAS',
          title: 'Analisis UI/UX',
          deadline: 'Deadline: Kemarin',
          status: 'Selesai',
          statusColor: Colors.grey,
          icon: Icons.assignment,
        ),
        _buildTaskCard(
          context,
          type: 'TUGAS',
          title: 'Wireframing',
          deadline: 'Besok, 23:59',
          status: 'Belum',
          statusColor: Colors.blue,
          icon: Icons.design_services,
          isUrgent: true,
        ),
        _buildTaskCard(
          context,
          type: 'KUIS',
          title: 'Kuis 1: Teori Dasar',
          deadline: 'Durasi: 30 Menit',
          status: 'Tersedia',
          statusColor: kAccentColor,
          icon: Icons.quiz,
        ),
      ],
    );
  }

  Widget _buildTaskCard(
    BuildContext context, {
    required String type,
    required String title,
    required String deadline,
    required String status,
    required Color statusColor,
    required IconData icon,
    bool isUrgent = false,
  }) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      elevation: 0,
      color: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
        side: BorderSide(color: Colors.grey[200]!),
      ),
      child: InkWell(
        onTap: () {
          if (type == 'KUIS') {
            Navigator.push(context, MaterialPageRoute(builder: (_) => const QuizInfoScreen()));
          } else {
            Navigator.push(context, MaterialPageRoute(builder: (_) => const TaskDetailScreen()));
          }
        },
        borderRadius: BorderRadius.circular(16),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                    decoration: BoxDecoration(
                      color: type == 'KUIS' ? Colors.orange[50] : Colors.blue[50],
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text(
                      type,
                      style: TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                        color: type == 'KUIS' ? Colors.orange : Colors.blue,
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                    decoration: BoxDecoration(
                      color: statusColor.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(
                      status,
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        color: statusColor,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.grey[100],
                      shape: BoxShape.circle,
                    ),
                    child: Icon(icon, color: kTextColor, size: 20),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          title,
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: kTextColor,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Row(
                          children: [
                            Icon(Icons.access_time, size: 12, color: isUrgent ? Colors.red : Colors.grey[500]),
                            const SizedBox(width: 4),
                            Text(
                              deadline,
                              style: TextStyle(
                                fontSize: 12,
                                color: isUrgent ? Colors.red : Colors.grey[500],
                                fontWeight: isUrgent ? FontWeight.bold : FontWeight.normal,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
