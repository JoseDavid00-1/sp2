import 'package:flutter/material.dart';
import 'package:sp2/ui/widgets/column_semester.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  // Definición del mapa de semestres y cursos
  final Map<String, List<Map<String, dynamic>>> semesters = const {
    "SEMESTRE 1": [
      {
        "id": "CS101",
        "name": "Matemática 1",
        "description":
            "Introducción a los conceptos fundamentales del cálculo diferencial e integral, incluyendo límites, derivadas e integrales.",
        "color": 0xFFDAEBFE,
        "icon": "math_symbols"
      },
      {
        "id": "PH101",
        "name": "Física 1",
        "description":
            "Estudio de los principios básicos de la mecánica clásica, incluyendo cinemática, dinámica y conservación de la energía.",
        "color": 0xFFDDFCE6,
        "icon": "physics"
      },
      {
        "id": "CS201",
        "name": "Ciencias de la Computación 1",
        "description":
            "Introducción a los conceptos fundamentales de la ciencia de la computación, incluyendo algoritmos y estructuras de datos básicas.",
        "color": 0xFFFEF8C2,
        "icon": "computer"
      },
      {
        "id": "INF101",
        "name": "Informática 1",
        "description":
            "Conceptos básicos de informática, sistemas operativos, y uso de software común en el ámbito profesional y académico.",
        "color": 0xFFFEE3E3,
        "icon": "laptop"
      },
      {
        "id": "TD101",
        "name": "Tecnología Descriptiva",
        "description":
            "Estudio de técnicas y herramientas para representar gráficamente ideas y proyectos, incluyendo dibujo técnico y CAD.",
        "color": 0xFFF2E9FF,
        "icon": "blueprint"
      },
      {
        "id": "TIA101",
        "name": "Técnicas de Investigación y Aprendizaje",
        "description":
            "Desarrollo de habilidades investigativas, técnicas de estudio y aprendizaje efectivo, con un enfoque en la metodología científica.",
        "color": 0xFFFEEDD4,
        "icon": "magnifying_glass"
      }
    ],
    "SEMESTRE 2": [
      {
        "id": "CS101",
        "name": "Matemática 2",
        "description":
            "Introducción a los conceptos fundamentales del cálculo diferencial e integral, incluyendo límites, derivadas e integrales.",
        "color": 0xFFDAEBFE,
        "icon": "math_symbols"
      },
      {
        "id": "PH101",
        "name": "Física 2",
        "description":
            "Estudio de los principios básicos de la mecánica clásica, incluyendo cinemática, dinámica y conservación de la energía.",
        "color": 0xFFDDFCE6,
        "icon": "physics"
      },
      {
        "id": "CS201",
        "name": "Ciencias de la Computación 2",
        "description":
            "Introducción a los conceptos fundamentales de la ciencia de la computación, incluyendo algoritmos y estructuras de datos básicas.",
        "color": 0xFFFEF8C2,
        "icon": "computer"
      },
      {
        "id": "INF101",
        "name": "Informática 2",
        "description":
            "Conceptos básicos de informática, sistemas operativos, y uso de software común en el ámbito profesional y académico.",
        "color": 0xFFFEE3E3,
        "icon": "laptop"
      },
      {
        "id": "TD101",
        "name": "Dibujo Técnico",
        "description":
            "Estudio de técnicas y herramientas para representar gráficamente ideas y proyectos, incluyendo dibujo técnico y CAD.",
        "color": 0xFFF2E9FF,
        "icon": "blueprint"
      },
      {
        "id": "TIA101",
        "name": "Evolución de la Ciencia y la Tecnología",
        "description":
            "Desarrollo de habilidades investigativas, técnicas de estudio y aprendizaje efectivo, con un enfoque en la metodología científica.",
        "color": 0xFFFEEDD4,
        "icon": "magnifying_glass"
      }
    ],
    "SEMESTRE 3": [
      {
        "id": "CS101",
        "name": "Matemática 3",
        "description":
            "Introducción a los conceptos fundamentales del cálculo diferencial e integral, incluyendo límites, derivadas e integrales.",
        "color": 0xFFDAEBFE,
        "icon": "math_symbols"
      },
      {
        "id": "PH101",
        "name": "Física 3",
        "description":
            "Estudio de los principios básicos de la mecánica clásica, incluyendo cinemática, dinámica y conservación de la energía.",
        "color": 0xFFDDFCE6,
        "icon": "physics"
      },
      {
        "id": "CS201",
        "name": "Ciencias de la Computación 3",
        "description":
            "Introducción a los conceptos fundamentales de la ciencia de la computación, incluyendo algoritmos y estructuras de datos básicas.",
        "color": 0xFFFEF8C2,
        "icon": "computer"
      },
      {
        "id": "INF101",
        "name": "Informática 3",
        "description":
            "Conceptos básicos de informática, sistemas operativos, y uso de software común en el ámbito profesional y académico.",
        "color": 0xFFFEE3E3,
        "icon": "laptop"
      },
      {
        "id": "TD101",
        "name": "Algebra Lineal 1",
        "description":
            "Estudio de técnicas y herramientas para representar gráficamente ideas y proyectos, incluyendo dibujo técnico y CAD.",
        "color": 0xFFF2E9FF,
        "icon": "blueprint"
      },
      {
        "id": "TIA101",
        "name": "Electricidad",
        "description":
            "Desarrollo de habilidades investigativas, técnicas de estudio y aprendizaje efectivo, con un enfoque en la metodología científica.",
        "color": 0xFFFEEDD4,
        "icon": "magnifying_glass"
      }
    ],
    "SEMESTRE 4": [
      {
        "id": "CS101",
        "name": "Matemática 4",
        "description":
            "Introducción a los conceptos fundamentales del cálculo diferencial e integral, incluyendo límites, derivadas e integrales.",
        "color": 0xFFDAEBFE,
        "icon": "math_symbols"
      },
      {
        "id": "PH101",
        "name": "Física 4",
        "description":
            "Estudio de los principios básicos de la mecánica clásica, incluyendo cinemática, dinámica y conservación de la energía.",
        "color": 0xFFDDFCE6,
        "icon": "physics"
      },
      {
        "id": "CS201",
        "name": "Ciencias de la Computación 4",
        "description":
            "Introducción a los conceptos fundamentales de la ciencia de la computación, incluyendo algoritmos y estructuras de datos básicas.",
        "color": 0xFFFEF8C2,
        "icon": "computer"
      },
      {
        "id": "INF101",
        "name": "Ecuaciones Diferenciales Ordinarias",
        "description":
            "Conceptos básicos de informática, sistemas operativos, y uso de software común en el ámbito profesional y académico.",
        "color": 0xFFFEE3E3,
        "icon": "laptop"
      },
      {
        "id": "TD101",
        "name": "Algebra Lineal 2",
        "description":
            "Estudio de técnicas y herramientas para representar gráficamente ideas y proyectos, incluyendo dibujo técnico y CAD.",
        "color": 0xFFF2E9FF,
        "icon": "blueprint"
      },
      {
        "id": "TIA101",
        "name": "Electrónica",
        "description":
            "Desarrollo de habilidades investigativas, técnicas de estudio y aprendizaje efectivo, con un enfoque en la metodología científica.",
        "color": 0xFFFEEDD4,
        "icon": "magnifying_glass"
      }
    ]
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
