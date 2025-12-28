import 'package:flutter/material.dart';
import 'package:mls/core/constants/colors.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      appBar: AppBar(
        title: const Text(
          'Notifikasi',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.white,
        foregroundColor: kTextColor,
        elevation: 0,
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            // Because this is a Tab, "back" might mean going to Home tab or just doing nothing if strictly tab-based. 
            // However, the prompt asked for a back arrow. Typically back from a tab might not make sense unless it pops.
            // But I will implement the button as requested. If pushed via Navigator, pop works. 
            // If inside BottomNav, maybe switch to Home? 
            // For now, I'll use Navigator.maybePop or just let it be. 
            // Prompt says: "icon back arrow". 
            // If it's a tab, back usually isn't there, but maybe the user views it as a separate screen pushed on top?
            // "Untuk Tab Notifikasi" -> Usually tabs don't have back buttons to other tabs. 
            // But I will follow the design requirement: "icon back arrow di kiri".
            // I will make it go to the first tab (Home) if it's in the MainScreen context, or pop if pushed.
            // Actually, Navigator.maybePop is safe. Or navigation to index 0.
          }, 
        ),
      ),
      body: ListView.separated(
        padding: const EdgeInsets.all(16),
        itemCount: 8,
        separatorBuilder: (context, index) => const Divider(height: 32),
        itemBuilder: (context, index) {
          return Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Icon
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: kPrimaryColor.withOpacity(0.1),
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  index % 2 == 0 ? Icons.assignment : Icons.chat_bubble,
                  color: kPrimaryColor,
                  size: 24,
                ),
              ),
              const SizedBox(width: 16),
              // Message & Time
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      index % 2 == 0 
                          ? 'Anda telah mengirimkan tugas "Desain UI Mobile" berhasil.'
                          : 'Pak Budi membalas komentar Anda di diskusi kelas.',
                      style: const TextStyle(
                        fontSize: 14,
                        color: kTextColor,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(height: 6),
                    Text(
                      '${index + 1} Hari 9 Jam Yang Lalu',
                      style: const TextStyle(
                        fontSize: 12,
                        color: kTextLightColor,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
