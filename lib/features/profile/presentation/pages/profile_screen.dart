import 'package:flutter/material.dart';
import 'package:mls/core/constants/colors.dart';
import 'package:mls/features/authentication/presentation/pages/login_screen.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: Stack(
        children: [
          // 1. Background Merah (Header) 30%
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            height: MediaQuery.of(context).size.height * 0.35,
            child: Container(
              color: kPrimaryColor,
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 40),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  IconButton(
                    icon: const Icon(Icons.arrow_back, color: Colors.white),
                    onPressed: () => Navigator.pop(context),
                  ),
                  const SizedBox(height: 10),
                  Center(
                    child: Column(
                      children: const [
                        CircleAvatar(
                          radius: 40,
                          backgroundColor: Colors.white,
                          child: Icon(Icons.person, size: 50, color: kPrimaryColor),
                          // Ganti dengan backgroundImage jika ada foto asset
                        ),
                        SizedBox(height: 10),
                        Text(
                          'Mahasiswa', // Nama dinamis
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          'Teknik Informatika',
                          style: TextStyle(
                            color: Colors.white70,
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),

          // 2. Kartu Putih Menumpuk (Body)
          Positioned(
            top: MediaQuery.of(context).size.height * 0.3,
            left: 16,
            right: 16,
            bottom: 0,
            child: Container(
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 10,
                    offset: Offset(0, -5),
                  ),
                ],
              ),
              child: DefaultTabController(
                length: 3,
                child: Column(
                  children: [
                    const TabBar(
                      labelColor: kPrimaryColor,
                      unselectedLabelColor: Colors.grey,
                      indicatorColor: kPrimaryColor,
                      tabs: [
                        Tab(text: 'About Me'),
                        Tab(text: 'Kelas'),
                        Tab(text: 'Edit Profile'),
                      ],
                    ),
                    Expanded(
                      child: TabBarView(
                        children: [
                          // Tab 1: About Me
                          _buildAboutMeTab(context),
                          
                          // Tab 2: Kelas (Placeholder)
                          const Center(child: Text("Daftar Kelas")),
                          
                          // Tab 3: Edit Profile
                          _buildEditProfileTab(),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAboutMeTab(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(20),
      children: [
        _buildInfoTile('Email Address', 'mahasiswa@university.ac.id'),
        _buildInfoTile('Program Studi', 'S1 Teknik Informatika'),
        _buildInfoTile('Fakultas', 'Ilmu Komputer'),
        _buildInfoTile('Aktivitas Login', 'Online 5 menit yang lalu'),
        
        const SizedBox(height: 30),
        
        SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.red, // Tombol Merah
              padding: const EdgeInsets.symmetric(vertical: 16),
            ),
            onPressed: () {
              // Logout Logic: Go back to LoginScreen
              Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(builder: (context) => const LoginScreen()),
                (route) => false,
              );
            },
            child: const Text('Log Out'),
          ),
        ),
      ],
    );
  }

  Widget _buildInfoTile(String title, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: const TextStyle(color: Colors.grey, fontSize: 12)),
          const SizedBox(height: 4),
          Text(
            value, 
            style: const TextStyle(
              fontSize: 16, 
              fontWeight: FontWeight.w500,
              color: kTextColor,
            ),
          ),
          const Divider(),
        ],
      ),
    );
  }

  Widget _buildEditProfileTab() {
    return ListView(
      padding: const EdgeInsets.all(20),
      children: [
        const TextField(
          decoration: InputDecoration(labelText: 'Nama Pertama'),
        ),
        const SizedBox(height: 16),
        const TextField(
          decoration: InputDecoration(labelText: 'Nama Terakhir'),
        ),
        const SizedBox(height: 16),
        const TextField(
          decoration: InputDecoration(labelText: 'Email'),
        ),
        const SizedBox(height: 16),
        const TextField(
          maxLines: 3,
          decoration: InputDecoration(labelText: 'Deskripsi Diri'),
        ),
        const SizedBox(height: 30),
        ElevatedButton(
          onPressed: () {},
          child: const Text('Simpan'),
        ),
      ],
    );
  }
}
