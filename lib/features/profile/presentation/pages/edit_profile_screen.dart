import 'package:flutter/material.dart';
import 'package:mls/core/constants/colors.dart';

class EditProfileScreen extends StatefulWidget {
  final String name;
  final String npm;
  final String email;
  final String className;
  final String bio;

  const EditProfileScreen({
    super.key,
    required this.name,
    required this.npm,
    required this.email,
    required this.className,
    required this.bio,
  });

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  late TextEditingController _nameController;
  late TextEditingController _npmController;
  late TextEditingController _emailController;
  late TextEditingController _classController;
  late TextEditingController _bioController;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController(text: widget.name);
    _npmController = TextEditingController(text: widget.npm);
    _emailController = TextEditingController(text: widget.email);
    _classController = TextEditingController(text: widget.className);
    _bioController = TextEditingController(text: widget.bio);
  }

  @override
  void dispose() {
    _nameController.dispose();
    _npmController.dispose();
    _emailController.dispose();
    _classController.dispose();
    _bioController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Edit Profil', style: TextStyle(color: Colors.black)),
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.check, color: kPrimaryColor),
            onPressed: _saveProfile,
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            // Profile Image (Mock)
            Stack(
              alignment: Alignment.bottomRight,
              children: [
                const CircleAvatar(
                  radius: 50,
                  backgroundImage: AssetImage('assets/images/logo.png'),
                ),
                Container(
                  padding: const EdgeInsets.all(4),
                  decoration: const BoxDecoration(
                    color: kPrimaryColor,
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(Icons.camera_alt, size: 16, color: Colors.white),
                ),
              ],
            ),
            const SizedBox(height: 32),

            _buildTextField('Nama Lengkap', _nameController),
            _buildTextField('NPM / Username', _npmController),
            _buildTextField('Email', _emailController, keyboardType: TextInputType.emailAddress),
            _buildTextField('Kelas', _classController, hint: 'Contoh: TI-4A'),
            _buildTextField('Bio', _bioController, maxLines: 4),

            const SizedBox(height: 24),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: _saveProfile,
                style: ElevatedButton.styleFrom(
                  backgroundColor: kPrimaryColor,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                ),
                child: const Text('Simpan Perubahan', style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold)),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField(String label, TextEditingController controller, {int maxLines = 1, TextInputType? keyboardType, String? hint}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label, style: const TextStyle(fontWeight: FontWeight.bold, color: kTextColor)),
          const SizedBox(height: 8),
          TextField(
            controller: controller,
            maxLines: maxLines,
            keyboardType: keyboardType,
            decoration: InputDecoration(
              hintText: hint,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(color: Colors.grey[300]!),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(color: Colors.grey[300]!),
              ),
              filled: true,
              fillColor: Colors.grey[50],
            ),
          ),
        ],
      ),
    );
  }

  void _saveProfile() {
    // Return data to previous screen
    Navigator.pop(context, {
      'name': _nameController.text,
      'npm': _npmController.text,
      'email': _emailController.text,
      'className': _classController.text,
      'bio': _bioController.text,
    });
  }
}
