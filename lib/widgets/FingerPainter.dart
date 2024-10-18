import 'package:flutter/material.dart';
import 'package:sp2/models/LineObject.dart';

class FingerPainter extends CustomPainter {
  final LineObject line;
  const FingerPainter({
    required this.line,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..style = PaintingStyle.stroke
      ..color = line.color
      ..strokeWidth = line.strokeWidth
      ..strokeCap = StrokeCap.round;

    for (var i = 0; i < line.points.length - 1; i++) {
      canvas.drawLine(line.points[i], line.points[i + 1], paint);
    }
  }

  @override
  bool shouldRepaint(FingerPainter oldDelegate) {
    return line.points.length != oldDelegate.line.points.length;
  }
}
