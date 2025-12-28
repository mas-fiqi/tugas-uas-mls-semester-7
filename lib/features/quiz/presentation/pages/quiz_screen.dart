import 'package:flutter/material.dart';
import 'package:mls/core/constants/colors.dart';

class QuizScreen extends StatefulWidget {
  const QuizScreen({super.key});

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  int _selectedOptionIndex = -1; // -1 means no option selected
  int _currentQuestionIndex = 0;
  
  // Dummy Questions
  final List<Map<String, dynamic>> _questions = [
    {
      'question': 'Radio button dapat digunakan untuk menentukan?',
      'options': ['Pilihan Ganda', 'Pilihan Tunggal', 'Input Teks', 'Upload File', 'Navigasi'],
    },
    // Add more dummy if needed, but for UI demo 1 is enough or repeated.
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Quiz Review 1'),
        backgroundColor: kPrimaryColor,
        actions: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            margin: const EdgeInsets.only(right: 16),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.2),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Row(
              children: const [
                Icon(Icons.timer, color: Colors.white, size: 20),
                SizedBox(width: 8),
                Text('15 : 00', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
              ],
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          // 1. Question Numbers
          Container(
            padding: const EdgeInsets.symmetric(vertical: 16),
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.05),
                  offset: const Offset(0, 4),
                  blurRadius: 10,
                ),
              ],
            ),
            child: SizedBox(
              height: 40,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                itemCount: 15,
                itemBuilder: (context, index) {
                  final isActive = index == _currentQuestionIndex;
                  return Container(
                    width: 40,
                    margin: const EdgeInsets.only(right: 12),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: isActive ? kAccentColor : Colors.grey[200],
                      border: isActive ? Border.all(color: kAccentColor, width: 2) : null,
                    ),
                    child: Text(
                      '${index + 1}',
                      style: TextStyle(
                        color: isActive ? Colors.white : kTextColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  );
                },
              ),
            ),
          ),

          // 2. Question View
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Soal Nomor ${_currentQuestionIndex + 1} / 15',
                    style: const TextStyle(color: kTextLightColor, fontSize: 14),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    _questions[0]['question'], // Using dummy question 0 for all
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: kTextColor,
                    ),
                  ),
                  const SizedBox(height: 24),

                  // Options
                  ...List.generate(5, (index) {
                    final options = ['A', 'B', 'C', 'D', 'E'];
                    final optionText = _questions[0]['options'][index];
                    final isSelected = _selectedOptionIndex == index;

                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          _selectedOptionIndex = index;
                        });
                      },
                      child: Container(
                        margin: const EdgeInsets.only(bottom: 12),
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: isSelected ? const Color(0xFFFFE5E5) : Colors.white, // Light Red if selected
                          border: Border.all(
                            color: isSelected ? kPrimaryColor : Colors.grey[300]!,
                            width: isSelected ? 2 : 1,
                          ),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Row(
                          children: [
                            Container(
                              width: 32,
                              height: 32,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                color: isSelected ? kPrimaryColor : Colors.grey[200],
                                shape: BoxShape.circle,
                              ),
                              child: Text(
                                options[index],
                                style: TextStyle(
                                  color: isSelected ? Colors.white : kTextColor,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            const SizedBox(width: 16),
                            Expanded(
                              child: Text(
                                optionText,
                                style: TextStyle(
                                  color: isSelected ? kPrimaryColor : kTextColor,
                                  fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  }),
                ],
              ),
            ),
          ),

          // 3. Navigation Button
          Container(
            padding: const EdgeInsets.all(20),
            decoration: const BoxDecoration(
              color: Colors.white,
              border: Border(top: BorderSide(color: Colors.black12)),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: kPrimaryColor,
                    padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                  ),
                  onPressed: () {
                    // Logic for next question
                  },
                  child: Row(
                    children: const [
                      Text('Soal Selanjutnya'),
                      SizedBox(width: 8),
                      Icon(Icons.arrow_forward, size: 16),
                    ],
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
