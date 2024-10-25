import 'package:flutter/material.dart';
import 'dart:ui' as ui;

class ImagePainter extends CustomPainter {
  final ui.Image image;
  final ui.FragmentProgram program;
  const ImagePainter({
    required this.image,
    required this.program,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..shader = _getShader(size)
      ..style = PaintingStyle.fill;

    final rect = Rect.fromPoints(
      const Offset(0, 0),
      Offset(size.width, size.height),
    );
    canvas.drawRect(rect, paint);
  }

  ui.FragmentShader _getShader(Size size) {
    final shader = program.fragmentShader();

    // resolution
    shader.setFloat(0, size.width);
    shader.setFloat(1, size.height);

    // texture
    shader.setImageSampler(0, image);

    return shader;
  }

  @override
  bool shouldRepaint(ImagePainter oldDelegate) {
    return oldDelegate.image != image;
  }
}
