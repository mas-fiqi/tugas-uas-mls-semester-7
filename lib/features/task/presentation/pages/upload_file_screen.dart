import 'package:flutter/material.dart';
import 'package:mls/core/constants/colors.dart';
import 'dart:ui'; // Needed for PathMetric
// import 'package:path_drawing/path_drawing.dart'; // Removed invalid import 
// Actually, I should check if I can add a dependency or use a custom painter. 
// Given restrictions, I'll use a CustomPaint for dashed border or a simplified version.
// Using 'dotted_border' package is common, but I don't know if I can add packages easily without user input for 'flutter pub add'.
// The prompt said "npx" for web, but for flutter? "Run Smart Presence App" log implies I can run commands.
// But keeping it simple with CustomPainter is safer to avoid dependency issues if internet/pub is partial.
// I will implement a simple DashedRectPainter.

class UploadFileScreen extends StatelessWidget {
  const UploadFileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Upload File'),
        backgroundColor: kPrimaryColor,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Maksimum File 5MB, format PDF, DOCX, ZIP.',
              style: TextStyle(color: kTextLightColor, fontSize: 14),
            ),
            const SizedBox(height: 20),

            // Dashed Upload Area
            Expanded(
              flex: 2, // Take some space but not all
              child: CustomPaint(
                painter: DashedRectPainter(color: Colors.grey, strokeWidth: 2.0, gap: 5.0),
                child: Container(
                  width: double.infinity,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: kSurfaceColor.withOpacity(0.5),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(Icons.cloud_upload, size: 80, color: Colors.blue),
                      const SizedBox(height: 16),
                      Text(
                        'File yang akan diupload tampil di sini',
                        style: TextStyle(color: Colors.grey[600], fontSize: 16),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            
            const Spacer(),

            // Buttons
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.grey[300],
                      foregroundColor: kTextColor,
                      padding: const EdgeInsets.symmetric(vertical: 16),
                    ),
                    onPressed: () {
                      // Pick File Logic
                    },
                    child: const Text('Pilih File'),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: kPrimaryColor,
                      padding: const EdgeInsets.symmetric(vertical: 16),
                    ),
                    onPressed: () {
                      // Save Logic
                      Navigator.pop(context); // Go back to Task Detail
                      // Ideally show snackbar
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('File berhasil diupload')),
                      );
                    },
                    child: const Text('Simpan'),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}

class DashedRectPainter extends CustomPainter {
  final double strokeWidth;
  final Color color;
  final double gap;

  DashedRectPainter({this.strokeWidth = 5.0, this.color = Colors.red, this.gap = 5.0});

  @override
  void paint(Canvas canvas, Size size) {
    Paint dashedPaint = Paint()
      ..color = color
      ..strokeWidth = strokeWidth
      ..style = PaintingStyle.stroke;

    double x = size.width;
    double y = size.height;

    Path _topPath = Path();
    _topPath.moveTo(0, 0);
    _topPath.lineTo(x, 0);

    Path _rightPath = Path();
    _rightPath.moveTo(x, 0);
    _rightPath.lineTo(x, y);

    Path _bottomPath = Path();
    _bottomPath.moveTo(x, y);
    _bottomPath.lineTo(0, y);

    Path _leftPath = Path();
    _leftPath.moveTo(0, y);
    _leftPath.lineTo(0, 0);

    canvas.drawPath(_dashPath(_topPath, dashWidth: 10, dashSpace: gap), dashedPaint);
    canvas.drawPath(_dashPath(_rightPath, dashWidth: 10, dashSpace: gap), dashedPaint);
    canvas.drawPath(_dashPath(_bottomPath, dashWidth: 10, dashSpace: gap), dashedPaint);
    canvas.drawPath(_dashPath(_leftPath, dashWidth: 10, dashSpace: gap), dashedPaint);
  }

  Path _dashPath(Path source, {required double dashWidth, required double dashSpace}) {
    final Path path = Path();
    for (final PathMetric metric in source.computeMetrics()) {
      double distance = 0.0;
      while (distance < metric.length) {
        path.addPath(
          metric.extractPath(distance, distance + dashWidth),
          Offset.zero,
        );
        distance += dashWidth + dashSpace;
      }
    }
    return path;
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
