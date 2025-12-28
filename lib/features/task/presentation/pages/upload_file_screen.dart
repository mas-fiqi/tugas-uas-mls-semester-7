import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart'; // Import File Picker
import 'package:mls/core/constants/colors.dart';
import 'dart:async'; // For simulation delay
import 'dart:ui'; // Needed for PathMetrics

class UploadFileScreen extends StatefulWidget {
  const UploadFileScreen({super.key});

  @override
  State<UploadFileScreen> createState() => _UploadFileScreenState();
}

class _UploadFileScreenState extends State<UploadFileScreen> {
  PlatformFile? _selectedFile; // Store selected file
  bool _isUploading = false;

  // Function to pick file
  Future<void> _pickFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();

    if (result != null) {
      setState(() {
        _selectedFile = result.files.first;
      });
    } else {
      // User canceled the picker
    }
  }

  // Function to remove selected file
  void _removeFile() {
    setState(() {
      _selectedFile = null;
    });
  }

  // Function to simulate upload
  Future<void> _uploadFile() async {
    if (_selectedFile == null) return;

    setState(() {
      _isUploading = true;
    });

    // Simulate network delay
    await Future.delayed(const Duration(seconds: 2));

    if (!mounted) return;

    setState(() {
      _isUploading = false;
    });

    // Show Success Message
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('File berhasil dikirim!'),
        backgroundColor: kAccentColor,
      ),
    );

    // Return to previous screen
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Upload Tugas', style: TextStyle(color: Colors.black)),
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            // Upload Area
            Expanded(
              child: GestureDetector(
                onTap: _pickFile, // Pick file on tap
                child: CustomPaint(
                  painter: DashedRectPainter(color: Colors.grey, strokeWidth: 1.5, gap: 5.0),
                  child: Container(
                    width: double.infinity,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: Colors.grey[50],
                      // dashed border handled by CustomPaint
                    ),
                    child: _selectedFile == null 
                      ? _buildEmptyState() 
                      : _buildSelectedFileState(), // Show selected file
                  ),
                ),
              ),
            ),
            const SizedBox(height: 24),
            
            // Upload Button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: (_selectedFile != null && !_isUploading) ? _uploadFile : null,
                style: ElevatedButton.styleFrom(
                  backgroundColor: kPrimaryColor,
                  disabledBackgroundColor: Colors.grey[300],
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                ),
                child: _isUploading
                    ? const SizedBox(
                        height: 20, 
                        width: 20, 
                        child: CircularProgressIndicator(color: Colors.white, strokeWidth: 2)
                      )
                    : const Text(
                        'Simpan & Kirim',
                        style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
                      ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildEmptyState() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Colors.purple[50],
            shape: BoxShape.circle,
          ),
          child: const Icon(Icons.cloud_upload_outlined, size: 40, color: Colors.purple),
        ),
        const SizedBox(height: 16),
        const Text(
          'Sentuh untuk memilih file',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: kTextColor),
        ),
        const SizedBox(height: 8),
        Text(
          'JPG, PNG, PDF (Maks. 10MB)',
          style: TextStyle(fontSize: 12, color: Colors.grey[500]),
        ),
      ],
    );
  }

  Widget _buildSelectedFileState() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: kGreenLight.withOpacity(0.3), // Success green
            shape: BoxShape.circle,
          ),
          child: const Icon(Icons.insert_drive_file, size: 40, color: kGreenDark),
        ),
        const SizedBox(height: 16),
        Text(
          _selectedFile!.name,
          textAlign: TextAlign.center,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: kTextColor),
        ),
        const SizedBox(height: 8),
        Text(
          '${(_selectedFile!.size / 1024).toStringAsFixed(1)} KB',
          style: TextStyle(fontSize: 12, color: Colors.grey[500]),
        ),
        const SizedBox(height: 16),
        TextButton.icon(
          onPressed: _removeFile, 
          icon: const Icon(Icons.close, color: Colors.red), 
          label: const Text('Hapus File', style: TextStyle(color: Colors.red)),
        ),
      ],
    );
  }
}

// Reuse the existing DashedRectPainter logic
class DashedRectPainter extends CustomPainter {
  final double strokeWidth;
  final Color color;
  final double gap;

  DashedRectPainter({this.strokeWidth = 1.0, this.color = Colors.black, this.gap = 5.0});

  @override
  void paint(Canvas canvas, Size size) {
    Paint dashedPaint = Paint()
      ..color = color
      ..strokeWidth = strokeWidth
      ..style = PaintingStyle.stroke;

    double x = 0;
    double y = 0;
    double w = size.width;
    double h = size.height;

    Path _topPath = Path();
    _topPath.moveTo(x, y);
    _topPath.lineTo(w, y);

    Path _rightPath = Path();
    _rightPath.moveTo(w, y);
    _rightPath.lineTo(w, h);

    Path _bottomPath = Path();
    _bottomPath.moveTo(w, h);
    _bottomPath.lineTo(x, h);

    Path _leftPath = Path();
    _leftPath.moveTo(x, h);
    _leftPath.lineTo(x, y);

    _drawDashedPath(canvas, _topPath, dashedPaint);
    _drawDashedPath(canvas, _rightPath, dashedPaint);
    _drawDashedPath(canvas, _bottomPath, dashedPaint);
    _drawDashedPath(canvas, _leftPath, dashedPaint);
  }

  void _drawDashedPath(Canvas canvas, Path path, Paint paint) {
    PathMetrics pathMetrics = path.computeMetrics();
    for (PathMetric pathMetric in pathMetrics) {
      double distance = 0.0;
      while (distance < pathMetric.length) {
        canvas.drawPath(
          pathMetric.extractPath(distance, distance + gap),
          paint,
        );
        distance += gap * 2;
      }
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
