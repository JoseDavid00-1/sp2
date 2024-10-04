import 'package:flutter/material.dart';
import 'package:projecto/widgets/card_course.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  // Definición del mapa de semestres y cursos
  final Map<String, List<Map<String, dynamic>>> semesters = const {
    "SEMESTRE 1": [
      {"name": "Matematica 1", "color": Color.fromRGBO(246, 224, 94, 1)},
      {"name": "Fisica 1", "color": Color.fromRGBO(72, 255, 16, 1)},
      {
        "name": "Ciencias de la computación 1",
        "color": Color.fromRGBO(255, 22, 166, 1)
      },
      {"name": "Química 1", "color": Color.fromRGBO(0, 150, 136, 1)},
      {"name": "Historia 1", "color": Color.fromRGBO(255, 87, 34, 1)},
      {"name": "Inglés 1", "color": Color.fromRGBO(33, 150, 243, 1)},
    ],
    "SEMESTRE 2": [
      {"name": "Matematica 2", "color": Color(0xfff6e05e)},
      {"name": "Fisica 2", "color": Color.fromRGBO(72, 255, 16, 1)},
      {
        "name": "Ciencias de la computación 2",
        "color": Color.fromRGBO(255, 22, 166, 1)
      },
      {"name": "Química 2", "color": Color.fromRGBO(0, 150, 136, 1)},
      {"name": "Historia 2", "color": Color.fromRGBO(255, 87, 34, 1)},
      {"name": "Inglés 2", "color": Color.fromRGBO(33, 150, 243, 1)},
    ],
    "SEMESTRE 3": [
      {"name": "Matematica 3", "color": Color(0xfff6e05e)},
      {"name": "Fisica 3", "color": Color.fromRGBO(72, 255, 16, 1)},
      {
        "name": "Ciencias de la computación 3",
        "color": Color.fromRGBO(255, 22, 166, 1)
      },
      {"name": "Química 3", "color": Color.fromRGBO(0, 150, 136, 1)},
      {"name": "Historia 3", "color": Color.fromRGBO(255, 87, 34, 1)},
      {"name": "Inglés 3", "color": Color.fromRGBO(33, 150, 243, 1)},
    ],
    "SEMESTRE 4": [
      {"name": "Matematica 4", "color": Color(0xfff6e05e)},
      {"name": "Fisica 4", "color": Color.fromRGBO(72, 255, 16, 1)},
      {
        "name": "Ciencias de la computación 4",
        "color": Color.fromRGBO(255, 22, 166, 1)
      },
      {"name": "Química 4", "color": Color.fromRGBO(0, 150, 136, 1)},
      {"name": "Historia 4", "color": Color.fromRGBO(255, 87, 34, 1)},
      {"name": "Inglés 4", "color": Color.fromRGBO(33, 150, 243, 1)},
    ],
    "SEMESTRE 5": [
      {"name": "Matematica 5", "color": Color(0xfff6e05e)},
      {"name": "Fisica 5", "color": Color.fromRGBO(72, 255, 16, 1)},
      {
        "name": "Ciencias de la computación 5",
        "color": Color.fromRGBO(255, 22, 166, 1)
      },
      {"name": "Química 5", "color": Color.fromRGBO(0, 150, 136, 1)},
      {"name": "Historia 5", "color": Color.fromRGBO(255, 87, 34, 1)},
      {"name": "Inglés 5", "color": Color.fromRGBO(33, 150, 243, 1)},
    ],
    "SEMESTRE 6": [
      {"name": "Matematica 6", "color": Color(0xfff6e05e)},
      {"name": "Fisica 6", "color": Color.fromRGBO(72, 255, 16, 1)},
      {
        "name": "Ciencias de la computación 6",
        "color": Color.fromRGBO(255, 22, 166, 1)
      },
      {"name": "Química 6", "color": Color.fromRGBO(0, 150, 136, 1)},
      {"name": "Historia 6", "color": Color.fromRGBO(255, 87, 34, 1)},
      {"name": "Inglés 6", "color": Color.fromRGBO(33, 150, 243, 1)},
    ],
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Note Search'),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: semesters.entries.map((entry) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                children: [
                  Container(
                    color: Colors.grey,
                    padding: const EdgeInsets.all(8.0),
                    child: Center(
                      child: Text(
                        entry.key, // Título del semestre
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  Expanded(
                    child: GridView.count(
                      crossAxisCount: 2, // 2 columnas
                      crossAxisSpacing: 8.0, // Espacio entre las columnas
                      mainAxisSpacing: 8.0, // Espacio entre las filas
                      physics:
                          const NeverScrollableScrollPhysics(), // Desactiva el scroll dentro del GridView
                      shrinkWrap: true, // Se ajusta al contenido disponible
                      children: entry.value.map((course) {
                        return CourseCard(
                          name: course["name"],
                          borderColor: course["color"],
                        );
                      }).toList(),
                    ),
                  ),
                ],
              ),
            );
          }).toList(),
        ),
      ),
      backgroundColor: const Color.fromARGB(16, 24, 41, 255),
    );
  }
}
