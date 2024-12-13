import 'package:notesearch/models/dependencias.dart';

class Tema {
  final String id; // ID único del tema
  final String nombre; // Nombre del tema
  final String descripcion; // Descripción del tema
  final List<Dependencia>? dependencias;

  Tema(
      {required this.id,
      required this.nombre,
      required this.descripcion,
      this.dependencias});

  // Método para crear una instancia desde un mapa (útil para JSON o APIs)
  factory Tema.fromMap(Map<String, dynamic> map) {
    return Tema(
      id: map['id'] as String,
      nombre: map['nombre'] as String,
      descripcion: map['descripcion'] as String,
      dependencias: map['dependencias'] as List<Dependencia>,
    );
  }

  // Método opcional para convertir una instancia a mapa (útil para guardar o enviar datos)
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'nombre': nombre,
      'descripcion': descripcion,
    };
  }
}
