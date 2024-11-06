// data_service.dart
import 'dart:async';

class DataService {
  // Simulación de carga de materias recientes
  Future<List<Map<String, dynamic>>> loadRecentCourses() async {
    await Future.delayed(Duration(seconds: 2)); // Simula la espera de la API
    return [
      {"Id": 1, "name": "Ingeniería", "icon": "construction", "color": "blue"},
      {"Id": 2, "name": "Medicina", "icon": "healing", "color": "green"},
      {"Id": 3, "name": "Derecho", "icon": "business", "color": "red"},
      {
        "Id": 4,
        "name": "Arquitectura",
        "icon": "local_library",
        "color": "orange"
      },
      {"Id": 5, "name": "Economía", "icon": "school", "color": "teal"},
      {
        "Id": 6,
        "name": "Psicología",
        "icon": "local_library",
        "color": "purple"
      },
    ];
  }

  // Simulación de carga de descripciones de materias
  Future<List<String>> loadCourseDescriptions() async {
    await Future.delayed(Duration(seconds: 2)); // Simula la espera de la API
    return [
      "Descripción de Ingeniería",
      "Descripción de Medicina",
      "Descripción de Derecho",
      "Descripción de Arquitectura",
      "Descripción de Economía",
      "Descripción de Psicología",
    ];
  }

  // Simulación de carga de información detallada de un curso
  Future<String> loadCourseDetails(int index) async {
    await Future.delayed(Duration(seconds: 2)); // Simula la espera de la API
    final detailedInfo = [
      "Detalles de Ingeniería: Incluye temas como estructuras, materiales, etc.",
      "Detalles de Medicina: Incluye anatomía, fisiología, etc.",
      "Detalles de Derecho: Incluye derecho civil, penal, etc.",
      "Detalles de Arquitectura: Incluye diseño, urbanismo, etc.",
      "Detalles de Economía: Incluye micro y macroeconomía, etc.",
      "Detalles de Psicología: Incluye psicología clínica, social, etc.",
    ];
    return detailedInfo[index];
  }
}
