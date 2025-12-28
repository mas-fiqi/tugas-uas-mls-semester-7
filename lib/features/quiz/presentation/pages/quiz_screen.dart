import 'package:flutter/material.dart';
import 'package:mls/core/constants/colors.dart';
import 'package:mls/features/quiz/presentation/pages/quiz_result_screen.dart';
import 'dart:async'; // For Timer

class QuizScreen extends StatefulWidget {
  const QuizScreen({super.key});

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  int _selectedOptionIndex = -1;
  int _currentQuestionIndex = 0;
  
  // Timer Logic
  Timer? _timer;
  int _remainingSeconds = 15 * 60; // 15 Minutes

  final List<Map<String, dynamic>> _questions = [
    {
      'question': 'Widget manakah yang digunakan untuk menyusun elemen secara vertikal?',
      'options': ['Row', 'Column', 'Stack', 'Container', 'ListView'],
    },
    {
       'question': 'Perintah untuk membuat project Flutter baru adalah?',
       'options': ['flutter new', 'flutter start', 'flutter create', 'flutter init', 'flutter run'],
    },
     // Repeats for demo if needed
  ];

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  void _startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_remainingSeconds > 0) {
        setState(() {
          _remainingSeconds--;
        });
      } else {
        _timer?.cancel();
        _finishQuiz();
      }
    });
  }

  void _finishQuiz() {
    _timer?.cancel();
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const QuizResultScreen()),
    );
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  String get _timerText {
    int minutes = _remainingSeconds ~/ 60;
    int seconds = _remainingSeconds % 60;
    return '${minutes.toString().padLeft(2, '0')} : ${seconds.toString().padLeft(2, '0')}';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.close, color: Colors.black),
          onPressed: () => _showExitDialog(),
        ),
        title: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
          decoration: BoxDecoration(
            color: Colors.orange[50],
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: Colors.orange[100]!),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(Icons.timer_outlined, color: Colors.orange, size: 18),
              const SizedBox(width: 8),
              Text(
                _timerText,
                style: const TextStyle(
                  color: Colors.orange, 
                  fontWeight: FontWeight.bold, 
                  fontSize: 16
                ),
              ),
            ],
          ),
        ),
      ),
      body: Column(
        children: [
          // Linear Progress Bar
          LinearProgressIndicator(
            value: (_currentQuestionIndex + 1) / 15,
            backgroundColor: Colors.grey[100],
            valueColor: const AlwaysStoppedAnimation<Color>(kPrimaryColor),
            minHeight: 4,
          ),
          
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Question Counter
                  Text(
                    'Soal ${_currentQuestionIndex + 1} dari 15',
                    style: TextStyle(color: Colors.grey[500], fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 16),
                  
                  // Question Text
                  Text(
                    _questions[_currentQuestionIndex % _questions.length]['question'],
                    style: const TextStyle(
                      fontSize: 20, 
                      fontWeight: FontWeight.bold, 
                      color: kTextColor,
                      height: 1.4
                    ),
                  ),
                  const SizedBox(height: 32),

                  // Options List
                  ...List.generate(5, (index) {
                    final options = ['A', 'B', 'C', 'D', 'E'];
                    final optionText = _questions[_currentQuestionIndex % _questions.length]['options'][index]; // Use modulo for demo safe
                    final isSelected = _selectedOptionIndex == index;

                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          _selectedOptionIndex = index;
                        });
                      },
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 200),
                        margin: const EdgeInsets.only(bottom: 16),
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: isSelected ? kPrimaryColor : Colors.white,
                          borderRadius: BorderRadius.circular(16),
                          border: isSelected 
                              ? Border.all(color: kPrimaryColor) 
                              : Border.all(color: Colors.grey[200]!),
                          boxShadow: isSelected 
                             ? [BoxShadow(color: kPrimaryColor.withOpacity(0.3), blurRadius: 8, offset: const Offset(0, 4))] 
                             : [],
                        ),
                        child: Row(
                          children: [
                            Container(
                              width: 36,
                              height: 36,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                color: isSelected ? Colors.white.withOpacity(0.2) : Colors.grey[100],
                                shape: BoxShape.circle,
                              ),
                              child: Text(
                                options[index],
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: isSelected ? Colors.white : Colors.grey[700],
                                ),
                              ),
                            ),
                            const SizedBox(width: 16),
                            Expanded(
                              child: Text(
                                optionText,
                                style: TextStyle(
                                  fontSize: 16,
                                  color: isSelected ? Colors.white : kTextColor,
                                  fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
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

          // Bottom Navigation
          Container(
            padding: const EdgeInsets.all(24),
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.05),
                  blurRadius: 20,
                  offset: const Offset(0, -5),
                ),
              ],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Prev Button (Hidden on first question)
                _currentQuestionIndex > 0 ?
                TextButton.icon(
                  onPressed: () {
                     setState(() {
                       _currentQuestionIndex--;
                       _selectedOptionIndex = -1; // Reset for demo
                     });
                  },
                  icon: const Icon(Icons.arrow_back, color: Colors.grey),
                  label: const Text('Sebelumnya', style: TextStyle(color: Colors.grey)),
                ) : const SizedBox.shrink(),

                // Next Button
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: kPrimaryColor,
                    padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                  ),
                  onPressed: () {
                    if (_currentQuestionIndex < 14) {
                      setState(() {
                        _currentQuestionIndex++;
                        _selectedOptionIndex = -1;
                      });
                    } else {
                      _finishQuiz();
                    }
                  },
                  child: Text(
                    _currentQuestionIndex == 14 ? 'Selesai' : 'Selanjutnya',
                    style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _showExitDialog() {
    showDialog(
      context: context, 
      builder: (context) => AlertDialog(
        title: const Text('Keluar Quiz?'),
        content: const Text('Waktu akan terus berjalan. Yakin ingin keluar?'),
        actions: [
          TextButton(onPressed: () => Navigator.pop(context), child: const Text('Batal')),
          TextButton(
            onPressed: () {
               Navigator.pop(context); // Close dialog
               Navigator.pop(context); // Exit screen
            }, 
            child: const Text('Keluar', style: TextStyle(color: Colors.red))
          ),
        ],
      ),
    );
  }
}
