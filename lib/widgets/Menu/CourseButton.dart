import 'package:flutter/material.dart';

class CourseButton extends StatelessWidget {
  final String courseName;
  final String emoji;
  final String color;
  final VoidCallback onPressed;

  const CourseButton({
    super.key,
    required this.courseName,
    this.emoji = '📘',
    required this.color,
    required this.onPressed,
  });

  // Método para convertir un color hexadecimal en un Color de Flutter
  Color getColorFromHex(String hexColor) {
    try {
      if (hexColor.startsWith('0x') && hexColor.length == 10) {
        // Si ya tiene el formato correcto, lo convertimos directamente
        return Color.fromARGB(255, 148, 148, 148);
      } else {
        throw FormatException(
            'El color debe estar en formato "0xAARRGGBB" con 8 dígitos.');
      }
    } catch (e) {
      // Manejo de errores con un color por defecto
      debugPrint('Error al procesar el color: $e');
      return Colors.grey; // Color por defecto
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        height: 70.0, // Altura ajustada para acomodar texto
        margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 10.0),
        decoration: BoxDecoration(
          color: getColorFromHex(color),
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
