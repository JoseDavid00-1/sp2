import 'package:flutter/material.dart';

class CourseCard extends StatelessWidget {
  final String name;
  final Color borderColor;
  final String? emoji; // Emoji opcional

  const CourseCard({
    required this.name,
    required this.borderColor,
    this.emoji,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: borderColor,
        borderRadius: const BorderRadius.all(Radius.circular(20)),
        boxShadow: const [
          BoxShadow(
            color: Color.fromARGB(137, 94, 94, 94),
            blurRadius: 6,
            offset: Offset(0, 5), // Posición de la sombra
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (emoji != null) // Mostrar el emoji si está disponible
            Text(
              emoji!,
              style: const TextStyle(
                fontSize: 36, // Tamaño grande para destacar el emoji
              ),
            ),
          const SizedBox(height: 8), // Separador entre emoji y texto
          Text(
            name,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              color: Color.fromARGB(255, 31, 41, 55),
              fontSize: 18, // Tamaño del texto ajustado
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
