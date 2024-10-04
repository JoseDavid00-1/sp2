import 'package:flutter/material.dart';
import 'package:projecto/widgets/column_semester.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  // Definición del mapa de semestres y cursos
  final Map<String, List<Map<String, dynamic>>> semesters = const {
    "SEMESTRE 1": [
      {"name": "Matematica 1", "color": Color.fromARGB(255, 218, 235, 254)},
      {"name": "Fisica 1", "color": Color.fromARGB(255, 221, 252, 230)},
      {
        "name": "Ciencias de la computación 1",
        "color": Color.fromARGB(255, 254, 248, 194)
      },
      {"name": "Química 1", "color": Color.fromARGB(255, 254, 227, 227)},
      {"name": "Historia 1", "color": Color.fromARGB(255, 242, 233, 255)},
      {"name": "Inglés 1", "color": Color.fromARGB(255, 254, 237, 212)},
    ],
    "SEMESTRE 2": [
      {"name": "Matematica 1", "color": Color.fromARGB(255, 218, 235, 254)},
      {"name": "Fisica 1", "color": Color.fromARGB(255, 221, 252, 230)},
      {
        "name": "Ciencias de la computación 1",
        "color": Color.fromARGB(255, 254, 248, 194)
      },
      {"name": "Química 1", "color": Color.fromARGB(255, 254, 227, 227)},
      {"name": "Historia 1", "color": Color.fromARGB(255, 242, 233, 255)},
      {"name": "Inglés 1", "color": Color.fromARGB(255, 254, 237, 212)},
    ],
    "SEMESTRE 3": [
      {"name": "Matematica 1", "color": Color.fromARGB(255, 218, 235, 254)},
      {"name": "Fisica 1", "color": Color.fromARGB(255, 221, 252, 230)},
      {
        "name": "Ciencias de la computación 1",
        "color": Color.fromARGB(255, 254, 248, 194)
      },
      {"name": "Química 1", "color": Color.fromARGB(255, 254, 227, 227)},
      {"name": "Historia 1", "color": Color.fromARGB(255, 242, 233, 255)},
      {"name": "Inglés 1", "color": Color.fromARGB(255, 254, 237, 212)},
    ],
    "SEMESTRE 4": [
      {"name": "Matematica 1", "color": Color.fromARGB(255, 218, 235, 254)},
      {"name": "Fisica 1", "color": Color.fromARGB(255, 221, 252, 230)},
      {
        "name": "Ciencias de la computación 1",
        "color": Color.fromARGB(255, 254, 248, 194)
      },
      {"name": "Química 1", "color": Color.fromARGB(255, 254, 227, 227)},
      {"name": "Historia 1", "color": Color.fromARGB(255, 242, 233, 255)},
      {"name": "Inglés 1", "color": Color.fromARGB(255, 254, 237, 212)},
    ],
    "SEMESTRE 5": [
      {"name": "Matematica 1", "color": Color.fromARGB(255, 218, 235, 254)},
      {"name": "Fisica 1", "color": Color.fromARGB(255, 221, 252, 230)},
      {
        "name": "Ciencias de la computación 1",
        "color": Color.fromARGB(255, 254, 248, 194)
      },
      {"name": "Química 1", "color": Color.fromARGB(255, 254, 227, 227)},
      {"name": "Historia 1", "color": Color.fromARGB(255, 242, 233, 255)},
      {"name": "Inglés 1", "color": Color.fromARGB(255, 254, 237, 212)},
    ],
    "SEMESTRE 6": [
      {"name": "Matematica 1", "color": Color.fromARGB(255, 218, 235, 254)},
      {"name": "Fisica 1", "color": Color.fromARGB(255, 221, 252, 230)},
      {
        "name": "Ciencias de la computación 1",
        "color": Color.fromARGB(255, 254, 248, 194)
      },
      {"name": "Química 1", "color": Color.fromARGB(255, 254, 227, 227)},
      {"name": "Historia 1", "color": Color.fromARGB(255, 242, 233, 255)},
      {"name": "Inglés 1", "color": Color.fromARGB(255, 254, 237, 212)},
    ],
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('Note Search')),
        backgroundColor: Theme.of(context).colorScheme.onPrimary,
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: semesters.entries.map((entry) {
            return ColumnSemester(
              semester: entry,
            );
          }).toList(),
        ),
      ),
      backgroundColor: const Color.fromARGB(255, 242, 245, 246),
    );
  }
}
