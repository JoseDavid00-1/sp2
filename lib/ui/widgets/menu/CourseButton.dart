import 'package:flutter/material.dart';

class CourseButton extends StatelessWidget {
  final String courseName;
  final String iconName;
  final String color;
  final VoidCallback onPressed;

  const CourseButton({
    Key? key,
    required this.courseName,
    required this.iconName,
    required this.color,
    required this.onPressed,
  }) : super(key: key);

  // Método para convertir string a Color
  Color getColorFromString(String colorString) {
    switch (colorString) {
      case "blue":
        return Colors.blue;
      case "green":
        return Colors.green;
      case "red":
        return Colors.red;
      case "orange":
        return Colors.orange;
      case "teal":
        return Colors.teal;
      case "purple":
        return Colors.purple;
      default:
        return Colors.grey; // Color por defecto
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        height: 60.0, // Altura fija
        margin: EdgeInsets.symmetric(
            vertical: 8.0, horizontal: 10.0), // Espaciado vertical
        decoration: BoxDecoration(
          color: getColorFromString(color),
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: ListTile(
          contentPadding: EdgeInsets.symmetric(horizontal: 16.0),
          leading: Icon(getIconFromString(iconName), color: Colors.white),
          title: Text(
            courseName,
            style: TextStyle(color: Colors.white),
            overflow: TextOverflow.ellipsis, // Manejo de texto largo
          ),
          onTap: onPressed,
        ),
      ),
    );
  }

  IconData getIconFromString(String iconString) {
    switch (iconString) {
      case "construction":
        return Icons.construction;
      case "healing":
        return Icons.healing;
      case "business":
        return Icons.business;
      case "local_library":
        return Icons.local_library;
      case "school":
        return Icons.school;
      default:
        return Icons.help; // Icono por defecto
    }
  }
}
