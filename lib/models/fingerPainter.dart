import 'package:flutter/material.dart';
import 'package:notesearch/models/LineObject.dart';

class FingerPainter extends CustomPainter {
  final LineObject line;

  FingerPainter({required this.line});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = line.color
      ..strokeWidth = line.strokeWidth // Usa el grosor dinámico
      ..strokeCap = StrokeCap.round
      ..isAntiAlias = true;

    for (int i = 0; i < line.points.length - 1; i++) {
      canvas.drawLine(line.points[i], line.points[i + 1], paint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
