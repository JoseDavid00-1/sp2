import 'package:flutter/material.dart';
import 'package:sp2/models/LineObject.dart';

class FingerPainter extends CustomPainter {
  final List<LineObject> lines;
  const FingerPainter({
    required this.lines,
  });

  @override
  void paint(Canvas canvas, Size size) {
    for (int index = 0; index < lines.length; index++) {
      final line = lines[index];
      final paint = Paint()
        ..style = PaintingStyle.stroke
        ..color = line.color
        ..strokeWidth = line.strokeWidth
        ..strokeCap = StrokeCap.round;

      for (var i = 0; i < line.points.length - 1; i++) {
        canvas.drawLine(line.points[i], line.points[i + 1], paint);
      }
    }
  }

  @override
  bool shouldRepaint(FingerPainter oldDelegate) => true;
}
