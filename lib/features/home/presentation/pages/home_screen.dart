import 'package:flutter/material.dart';
import 'package:mls/core/constants/colors.dart';
import 'package:mls/features/profile/presentation/pages/profile_screen.dart';
import 'package:mls/features/notification/presentation/pages/notification_screen.dart';
import 'package:mls/shared/widgets/course_card.dart';
import 'package:mls/features/course/presentation/pages/course_detail_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // Clean white background
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(vertical: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // 1. Header (Compact & Elegant)
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Hi, Mahasiswa!',
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.grey[600],
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const Text(
                          "Explore today's",
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            color: kTextColor,
                          ),
                        ),
                      ],
                    ),
                    IconButton(
                        onPressed: () {
                           Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => const NotificationScreen()),
                          );
                        },
                        icon: Stack(
                          children: [
                             const Icon(Icons.notifications_outlined, size: 28, color: kTextColor),
                             Positioned(
                               right: 0,
                               top: 0,
                               child: Container(
                                 padding: const EdgeInsets.all(4),
                                 decoration: const BoxDecoration(color: Colors.red, shape: BoxShape.circle),
                               ),
                             ),
                          ],
                        ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 24),

              // 2. Story / Status List (Slightly smaller, more whitespace)
              SizedBox(
                height: 90,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  children: [
                    _buildStoryItem('Emilia', 'assets/images/kampus.png', true),
                    _buildStoryItem('Richard', 'assets/images/kampus.png', false),
                    _buildStoryItem('Jasmine', 'assets/images/kampus.png', true),
                    _buildStoryItem('Lucas', 'assets/images/kampus.png', false),
                    _buildStoryItem('Hendrik', 'assets/images/kampus.png', true),
                  ],
                ),
              ),

              const SizedBox(height: 24),

              // 3. Main Content (Refined Cards - Smaller & Less Aggressive)
              SizedBox(
                height: 240, // Height reduced from 400 for elegance
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  children: [
                    // Card 1: Tugas
                    _buildLargeCard(
                      context,
                      title: 'Desain UI/UX',
                      subtitle: 'Deadline 9 AM',
                      color: kPrimaryColor, // Unify to Green
                      imageAsset: 'assets/images/kampus.png',
                      isTask: true,
                    ),
                    const SizedBox(width: 16),
                    // Card 2: Pengumuman
                    _buildLargeCard(
                      context,
                      title: 'Jadwal UAS',
                      subtitle: 'Pengumuman',
                      color: Colors.blueAccent,
                      imageAsset: 'assets/images/kampus.png',
                      isTask: false,
                    ),
                     const SizedBox(width: 16),
                  ],
                ),
              ),
              
              const SizedBox(height: 32),

              // 4. "Kelas Hari Ini" (Restored as requested)
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 24),
                child: Text(
                  'Kelas Hari Ini',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: kTextColor,
                  ),
                ),
              ),
              const SizedBox(height: 16),
              
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Column(
                  children: [
                    CourseCard(
                      courseName: 'System Integration',
                      lecturerCode: 'Dosen: Dr. Budi Santoso',
                      progress: 0.75,
                      iconData: Icons.integration_instructions,
                      iconColor: Colors.orange,
                      onTap: () {
                         Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const CourseDetailScreen(
                            courseName: 'System Integration',
                            lecturerName: 'Dr. Budi Santoso',
                          )),
                        );
                      },
                    ),
                    CourseCard(
                      courseName: 'Mobile Programming',
                      lecturerCode: 'Dosen: Bu Siti Aminah',
                      progress: 0.45,
                      iconData: Icons.phone_android,
                      iconColor: Colors.green,
                      onTap: () {
                         Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const CourseDetailScreen(
                            courseName: 'Mobile Programming',
                            lecturerName: 'Bu Siti Aminah',
                          )),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildStoryItem(String name, String imagePath, bool isOnline) {
    return Container(
      margin: const EdgeInsets.only(right: 16),
      child: Column(
        children: [
          Stack(
            children: [
              Container(
                width: 60, // Smaller
                height: 60,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.blueAccent.withOpacity(0.5), width: 2), // Softer Ring
                  image: DecorationImage(
                    image: AssetImage(imagePath), 
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              if (isOnline)
                Positioned(
                  right: 0,
                  bottom: 0,
                  child: Container(
                    padding: const EdgeInsets.all(3),
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(Icons.circle, size: 10, color: Colors.greenAccent), // Green dot
                  ),
                ),
            ],
          ),
          const SizedBox(height: 6),
          Text(
            name,
            style: const TextStyle(fontSize: 11, color: Colors.grey, fontWeight: FontWeight.w500),
          ),
        ],
      ),
    );
  }

  Widget _buildLargeCard(
    BuildContext context, {
    required String title,
    required String subtitle,
    required Color color,
    required String imageAsset,
    required bool isTask,
  }) {
    return Container(
      width: 200, // Reduced width
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        color: color,
        image: DecorationImage(
          image: AssetImage(imageAsset),
          fit: BoxFit.cover,
          colorFilter: ColorFilter.mode(
            Colors.black.withOpacity(0.3), // Darker overlay for text readability
            BlendMode.darken,
          ),
        ),
        boxShadow: [
          BoxShadow(
            color: color.withOpacity(0.2),
            blurRadius: 15,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.end, 
              children: [
                Container(
                   padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                   decoration: BoxDecoration(
                     color: Colors.white.withOpacity(0.3),
                     borderRadius: BorderRadius.circular(12),
                   ),
                   child: Text(
                     subtitle,
                     style: const TextStyle(color: Colors.white, fontSize: 10, fontWeight: FontWeight.bold),
                   ),
                ),
                const SizedBox(height: 12),
                Text(
                  title,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 18, // Elegant font size
                    fontWeight: FontWeight.bold,
                    height: 1.2,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
