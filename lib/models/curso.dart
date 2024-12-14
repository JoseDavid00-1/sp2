import 'package:flutter/material.dart';
import 'package:notesearch/utils/utils_colores.dart';

class Course {
  final int semester;
  final int id;
  final String name;
  final Color color;
  final String? emoji;

  Course({
    required this.semester,
    required this.id,
    required this.name,
    required this.color,
    this.emoji,
  });

  factory Course.fromMap(Map<String, dynamic> map) {
    return Course(
      semester: int.tryParse(map['semester'].toString()) ??
          0, // Manejo seguro de conversiones
      id: int.tryParse(map['id'].toString()) ?? 0, // Convertir ID a int
      name: map['name'] as String,
      // Utiliza getColorFromHex para asignar el color
      color: UtilsColores.getColorFromHex(map['color'] as String),
      emoji: map['emoji'] as String?, // Puede ser nulo
    );
  }
}
