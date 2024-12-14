import 'package:flutter/material.dart';

class CourseButton extends StatelessWidget {
  final String courseName;
  final String emoji;
  final Color color;
  final VoidCallback onPressed;

  const CourseButton({
    super.key,
    required this.courseName,
    this.emoji = '📘',
    required this.color,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        height: 70.0, // Altura ajustada para acomodar texto
        margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 10.0),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Row(
          children: [
            const SizedBox(width: 16.0),
            Text(
              emoji,
              style: const TextStyle(fontSize: 24), // Tamaño del emoji
            ),
            const SizedBox(width: 16.0),
            Expanded(
              child: Text(
                courseName,
                style: const TextStyle(color: Colors.white, fontSize: 16),
                softWrap: true, // Permite ajustar el texto
                maxLines: 2, // Limita el texto a dos líneas
                overflow: TextOverflow
                    .visible, // Hace que el texto se muestre completo
              ),
            ),
          ],
        ),
      ),
    );
  }
}
