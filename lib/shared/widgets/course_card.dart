import 'package:flutter/material.dart';
import 'package:mls/core/constants/colors.dart';

class CourseCard extends StatelessWidget {
  final String courseName;
  final String lecturerCode;
  final double progress; // 0.0 to 1.0
  final Color iconColor;
  final IconData iconData;
  final VoidCallback? onTap;

  const CourseCard({
    super.key,
    required this.courseName,
    required this.lecturerCode,
    required this.progress,
    this.iconColor = Colors.blue,
    this.iconData = Icons.book,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(bottom: 20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20), // More rounded like reference
          boxShadow: [
            BoxShadow(
              color: Colors.purple.withOpacity(0.05), // Subtle purple tint shadow
              offset: const Offset(0, 10),
              blurRadius: 20,
              spreadRadius: 2,
            ),
          ],
        ),
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 1. Header: Avatar + Info + Button
            Row(
              children: [
                // Avatar
                Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: const DecorationImage(
                      image: AssetImage('assets/images/kampus.png'), // Mock Avatar
                      fit: BoxFit.cover,
                    ),
                    border: Border.all(color: Colors.grey[200]!, width: 2),
                  ),
                ),
                const SizedBox(width: 12),
                
                // Name & Role
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        courseName,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          color: kTextColor,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        lecturerCode,
                        style: TextStyle(
                          color: Colors.grey[500],
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ),
                
                // Follow/Open Button
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  decoration: BoxDecoration(
                    color: const Color(0xFF6C63FF), // Purple accent like reference
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: const Text(
                    'Buka',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 12,
                    ),
                  ),
                ),
              ],
            ),
            
            const SizedBox(height: 16),
            
            // 2. Body: Description Text
            Text(
              'Panduan lengkap mempelajari materi $courseName dari dasar hingga mahir. Dibimbing oleh dosen ahli dan praktisi.',
              style: TextStyle(
                color: Colors.grey[600],
                fontSize: 14,
                height: 1.5,
              ),
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
            ),
            
            const SizedBox(height: 24),
            
            // 3. Footer: Stats (Followers/Following style)
            Row(
              children: [
                _buildStatItem('Progress', '${(progress * 100).toInt()}%'),
                const SizedBox(width: 32),
                _buildStatItem('Pertemuan', '12 Sesi'),
                const SizedBox(width: 32),
                _buildStatItem('Status', 'Aktif'),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStatItem(String label, String value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
            color: Colors.grey[400],
            fontSize: 12,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          value,
          style: const TextStyle(
            color: kTextColor,
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
      ],
    );
  }
}
