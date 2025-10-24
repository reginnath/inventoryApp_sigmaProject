import 'dart:io';
import 'package:flutter/material.dart';

class ImagePickerWidget extends StatelessWidget {
  final File? selectedImage;
  final VoidCallback onTakePhoto;
  final VoidCallback onChooseImage;

  const ImagePickerWidget({
    super.key,
    this.selectedImage,
    required this.onTakePhoto,
    required this.onChooseImage,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _showImageSourceDialog(context),
      child: Container(
        width: 150,
        height: 150,
        padding: const EdgeInsets.all(4),
        child: DottedBorder(
          color: Colors.grey,
          strokeWidth: 2,
          dashPattern: const [8, 4],
          child: Center(
            child: selectedImage != null
                ? Image.file(selectedImage!, fit: BoxFit.cover)
                : Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Icon(Icons.camera_alt, size: 40, color: Colors.grey),
                      SizedBox(height: 8),
                      Text('Insert Picture',
                          style: TextStyle(color: Colors.grey)),
                    ],
                  ),
          ),
        ),
      ),
    );
  }

  void _showImageSourceDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Select Image Source'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              leading: const Icon(Icons.camera),
              title: const Text('Take Photo'),
              onTap: () {
                Navigator.pop(context);
                onTakePhoto();
              },
            ),
            ListTile(
              leading: const Icon(Icons.photo_library),
              title: const Text('Choose from Gallery'),
              onTap: () {
                Navigator.pop(context);
                onChooseImage();
              },
            ),
          ],
        ),
      ),
    );
  }
}

// Custom widget to draw dotted border
class DottedBorder extends StatelessWidget {
  final Widget child;
  final Color color;
  final double strokeWidth;
  final List<double> dashPattern;

  const DottedBorder({
    super.key,
    required this.child,
    required this.color,
    required this.strokeWidth,
    required this.dashPattern,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.transparent),
      ),
      child: CustomPaint(
        painter: _DottedBorderPainter(
          color: color,
          strokeWidth: strokeWidth,
          dashPattern: dashPattern,
        ),
        child: child,
      ),
    );
  }
}

class _DottedBorderPainter extends CustomPainter {
  final Color color;
  final double strokeWidth;
  final List<double> dashPattern;

  _DottedBorderPainter({
    required this.color,
    required this.strokeWidth,
    required this.dashPattern,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..strokeWidth = strokeWidth
      ..style = PaintingStyle.stroke;

    final dashLength = dashPattern[0];
    final gapLength = dashPattern[1];

    // Draw top border
    double currentX = 0;
    while (currentX < size.width) {
      canvas.drawLine(
        Offset(currentX, 0),
        Offset(currentX + dashLength, 0),
        paint,
      );
      currentX += dashLength + gapLength;
    }

    // Draw right border
    double currentY = 0;
    while (currentY < size.height) {
      canvas.drawLine(
        Offset(size.width, currentY),
        Offset(size.width, currentY + dashLength),
        paint,
      );
      currentY += dashLength + gapLength;
    }

    // Draw bottom border
    currentX = size.width;
    while (currentX > 0) {
      canvas.drawLine(
        Offset(currentX, size.height),
        Offset(currentX - dashLength, size.height),
        paint,
      );
      currentX -= dashLength + gapLength;
    }

    // Draw left border
    currentY = size.height;
    while (currentY > 0) {
      canvas.drawLine(
        Offset(0, currentY),
        Offset(0, currentY - dashLength),
        paint,
      );
      currentY -= dashLength + gapLength;
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}