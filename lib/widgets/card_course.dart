import 'package:flutter/material.dart';

class CourseCard extends StatelessWidget {
  final String name;
  final Color borderColor;

  const CourseCard({required this.name, required this.borderColor, super.key});

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
              offset: Offset(0, 5), // Shadow position
            ),
          ]), // Añadir padding interno
      child: Center(
        child: Text(
          name,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            color: Color.fromARGB(255, 31, 41, 55),
            fontSize: 18, // Tamaño del texto ajustado
          ),
          textAlign: TextAlign.center, // Centrar el texto
        ),
      ),
    );
  }
}
