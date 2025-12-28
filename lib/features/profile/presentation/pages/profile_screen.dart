import 'package:flutter/material.dart';
import 'package:mls/core/constants/colors.dart';
import 'package:mls/features/authentication/presentation/pages/login_screen.dart';
import 'package:mls/features/profile/presentation/pages/edit_profile_screen.dart';
import 'package:mls/features/my_classes/presentation/pages/my_classes_screen.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  // State for Profile Data
  String _name = 'Gift Habeshaw';
  String _npm = 'GiftHabeshaw';
  String _email = 'gift@example.com';
  String _className = 'TI-4A'; // Default Class
  String _bio = 'Tulis deskripsi singkat tentang diri Anda...';

  // Navigate to Edit Profile and await result
  Future<void> _navigateToEdit() async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => EditProfileScreen(
          name: _name,
          npm: _npm,
          email: _email,
          className: _className,
          bio: _bio,
        ),
      ),
    );

    if (result != null && result is Map) {
      setState(() {
        _name = result['name'];
        _npm = result['npm'];
        _email = result['email'];
        _className = result['className'];
        _bio = result['bio'];
      });
      // Show confirmation (Optional)
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Profil berhasil diperbarui!'), backgroundColor: kAccentColor),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            // 1. Header: Cover & Avatar
            Stack(
              clipBehavior: Clip.none,
              alignment: Alignment.center,
              children: [
                // Cover Image
                Container(
                  height: 200,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/images/kampus.png'),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Colors.transparent,
                          Colors.black.withOpacity(0.3),
                        ],
                      ),
                    ),
                  ),
                ),
                // Avatar
                Positioned(
                  bottom: -50,
                  child: Container(
                    padding: const EdgeInsets.all(4),
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                    ),
                    child: const CircleAvatar(
                      radius: 50,
                      backgroundImage: AssetImage('assets/images/logo.png'),
                    ),
                  ),
                ),
                // Edit / Settings Button (Top Right)
                Positioned(
                  top: 40,
                  right: 20,
                  child: IconButton(
                    icon: const Icon(Icons.edit_square, color: Colors.white), // Edit Icon
                    onPressed: _navigateToEdit,
                    tooltip: 'Edit Profil',
                  ),
                ),
              ],
            ),

            const SizedBox(height: 60), // Space for Avatar

            // 2. Identity
            Text(
              _name,
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: kTextColor,
              ),
            ),
            const SizedBox(height: 4),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  _npm,
                  style: TextStyle(fontSize: 14, color: Colors.grey[600]),
                ),
                const SizedBox(width: 8),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                  decoration: BoxDecoration(
                    color: kPrimaryColor.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Text(
                    _className, // Display Class
                    style: const TextStyle(fontSize: 12, color: kPrimaryColor, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 30),

            // 3. Main Content
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // --- Mata Kuliah Diambil Section ---
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text('Mata Kuliah Diambil', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                      TextButton(
                        onPressed: () {
                           // Navigate to MyClasses tab (Mock navigation or simple push)
                           Navigator.push(context, MaterialPageRoute(builder: (c) => const MyClassesScreen()));
                        },
                        child: const Text('Lihat Semua', style: TextStyle(color: kGreenDark)),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 130, // Increased from 100 to fix overflow
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: [
                        _buildClassCard('Mobile Programming', '3 SKS'),
                        _buildClassCard('System Integration', '2 SKS'),
                        _buildClassCard('Cloud Computing', '3 SKS'),
                      ],
                    ),
                  ),
                  const SizedBox(height: 30),

                  // Data Diri Section
                  const Text('Data Diri', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 16),
                  _buildDisplayField('Nama Lengkap', _name),
                  _buildDisplayField('Nama Pengguna', _npm),
                  _buildDisplayField('Kelas', _className), // Added Class here too
                  const SizedBox(height: 20),
                  
                  const Text('Email', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 16),
                  _buildDisplayField('Email', _email),
                  
                  const SizedBox(height: 20),

                  // Bio
                  const Text('Bio Saya', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 16),
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.grey[100],
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Text(
                      _bio,
                      style: TextStyle(color: _bio.isEmpty ? Colors.grey : kTextColor),
                    ),
                  ),
                  
                  const SizedBox(height: 30),

                  // Social Media Links
                  const Text('Tautan Media Sosial', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 16),
                  _buildSocialButton(Icons.language, 'Website'),
                  _buildSocialButton(Icons.camera_alt, 'Instagram'),
                  
                  const SizedBox(height: 30),
                  
                  // Logout Button
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red[50],
                        elevation: 0,
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                      ),
                      onPressed: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (context) => const LoginScreen()),
                        );
                      },
                      child: const Text(
                        'Keluar',
                        style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),

                  const SizedBox(height: 40),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDisplayField(String label, String value) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: TextStyle(fontSize: 10, color: Colors.grey[600]), // Small label
          ),
          const SizedBox(height: 4),
          Text(
            value.isEmpty ? '-' : value,
            style: const TextStyle(
              color: kTextColor,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSocialButton(IconData icon, String label) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.circular(12),
      ),
      child: ListTile(
        leading: Icon(icon, color: Colors.purple),
        title: Text(label, style: const TextStyle(fontWeight: FontWeight.w500)),
        trailing: const Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        onTap: () {},
      ),
    );
  }

  Widget _buildClassCard(String title, String sks) {
    return Container(
      width: 140,
      margin: const EdgeInsets.only(right: 12),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey[200]!),
        boxShadow: [
          BoxShadow(
            color: Colors.purple.withOpacity(0.05),
            offset: const Offset(0, 4),
            blurRadius: 10,
          )
        ]
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Colors.purple[50],
              borderRadius: BorderRadius.circular(8),
            ),
            child: const Icon(Icons.book, size: 20, color: Colors.purple),
          ),
          const SizedBox(height: 12),
          Text(
            title,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
          ),
          Text(
            sks,
            style: TextStyle(color: Colors.grey[500], fontSize: 12),
          ),
        ],
      ),
    );
  }
}
