// data_service.dart
import 'dart:async';
import 'dart:collection';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:notesearch/models/curso.dart';
import 'package:notesearch/models/dependencias.dart';
import 'package:notesearch/models/tema.dart';

class DataService {
  final String baseUrl;

  DataService(this.baseUrl);

  // Carga de materias recientes desde el formato actual de JSON
  Future<List<Course>> loadRecentCourses() async {
    final response = await http.get(Uri.http(baseUrl, '/cursos'));

    if (response.statusCode == 200) {
      print(response.body.toString());
      final Map<String, dynamic> jsonResponse = json.decode(response.body);

      List<Course> courses = [];
      jsonResponse.forEach((semesterKey, courseList) {
        // Extraer el número del semestre desde la clave (e.g., "SEMESTRE 1")
        final semesterNumber = int.tryParse(
          semesterKey.replaceAll(RegExp(r'[^0-9]'), ''),
        );

        if (semesterNumber != null && courseList is List) {
          for (var courseData in courseList) {
            courses.add(Course.fromMap({
              ...courseData,
              'semester': semesterNumber, // Asignar el número de semestre
              'colorHex': courseData['color'], // Color hexadecimal
            }));
          }
        } else {
          print('Clave de semestre no válida o datos no válidos: $semesterKey');
        }
      });

      return courses;
    } else {
      throw Exception('Failed to load recent courses');
    }
  }

  Future<List<List<Course>>> loadCoursesBySemester() async {
    final response = await http.get(Uri.http(baseUrl, '/cursos'));

    if (response.statusCode == 200) {
      final Map<String, dynamic> jsonResponse = json.decode(response.body);

      SplayTreeMap<int, List<Course>> coursesBySemesterMap = SplayTreeMap();

      jsonResponse.forEach((semesterKey, courseList) {
        // Extraer el número del semestre desde la clave (e.g., "SEMESTRE 1")
        final semesterNumber = int.tryParse(
          semesterKey.replaceAll(RegExp(r'[^0-9]'), ''),
        );

        if (semesterNumber != null && courseList is List) {
          // Convertir la lista de datos de cursos a instancias de `Course`
          List<Course> semesterCourses = courseList.map((courseData) {
            return Course.fromMap({
              ...courseData,
              'id': courseData['id'].toString(), // Convertir ID a String
              'semester': semesterNumber,
              'colorHex': courseData['color'],
            });
          }).toList();

          // Agregar la lista de cursos al semestre correspondiente
          coursesBySemesterMap[semesterNumber] = semesterCourses;
        } else {
          print('Clave de semestre no válida o datos no válidos: $semesterKey');
        }
      });

// Convertir el SplayTreeMap a una lista ordenada por semestre
      List<List<Course>> coursesBySemester =
          coursesBySemesterMap.values.toList();

      return coursesBySemester;
    } else {
      throw Exception('Failed to load courses by semester');
    }
  }

  Future<List<Tema>> fetchTemasByCursoId(int cursoId) async {
    final response = await http.get(Uri.http(baseUrl, '/temas/$cursoId'));

    if (response.statusCode == 200) {
      final List<dynamic> jsonResponse = json.decode(response.body);

      // Mapea cada elemento en una lista de Future<Tema> y espera a que todos se resuelvan.
      return Future.wait(jsonResponse.map((temaData) async {
        print(temaData['id_tema'].toString());
        final dependencias =
            await fetchDependencias(temaData['id_tema'].toString());
        return Tema(
          id: temaData['id_tema'].toString(),
          nombre: temaData['titulo'],
          descripcion: temaData['descripcion'],
          dependencias: dependencias,
        );
      }));
    } else {
      print('Error: ${response.statusCode}');
      return []; // Devuelve una lista vacía en caso de error
    }
  }

  Future<List<Dependencia>> fetchDependencias(String temaId) async {
    try {
      print(
          "------------------------FETCHING DEPENDENCIAS----------------------------");
      final response =
          await http.get(Uri.http(baseUrl, '/v1/dependencies/$temaId'));

      if (response.statusCode == 200) {
        // Decodificar la respuesta JSON
        Map<String, dynamic> parsedJson = json.decode(response.body);
        print("---------------parsedJson: $parsedJson");

        List<Dependencia> dependencias = [];

        // Iterar sobre cada categoría y sus dependencias
        parsedJson.forEach((categoria, temas) {
          Map<String, String> dependenciasCategoria =
              Map<String, String>.from(temas);
          dependencias.addAll(dependenciasCategoria.entries.map((entry) {
            return Dependencia(dependecia: {entry.key: entry.value});
          }));
        });

        print("Lista Dependencias: $dependencias");
        return dependencias;
      } else {
        throw Exception(
            'Error al obtener dependencias: ${response.statusCode}');
      }
    } catch (e) {
      print('Error al obtener dependencias: $e');
      return [];
    }
  }
}
