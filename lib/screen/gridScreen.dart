import 'package:flutter/material.dart';
import 'package:notesearch/models/curso.dart';
import 'package:notesearch/services/DataService.dart';
import 'package:notesearch/widgets/AppBar/AppBarWidget.dart';
import 'package:notesearch/widgets/Grid/column_semester.dart';

class GridScreen extends StatefulWidget {
  const GridScreen({super.key});

  @override
  State<GridScreen> createState() => _GridScreenState();
}

class _GridScreenState extends State<GridScreen> {
  final DataService dataService = DataService('54.211.155.196:3000');
  late Future<List<List<Course>>> semestersFuture;

  @override
  void initState() {
    super.initState();
    semestersFuture = dataService
        .loadCoursesBySemester(); // Llamada a tu función para cargar datos
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(),
      body: FutureBuilder<List<List<Course>>>(
        future: semestersFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('No hay semestres disponibles.'));
          } else {
            final semesters = snapshot.data!;

            return SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: semesters.asMap().entries.map((entry) {
                  final semesterIndex = entry.key + 1; // Índice del semestre
                  final courses =
                      entry.value; // Lista de cursos para el semestre

                  return ColumnSemester(
                    semesterName: 'Semestre $semesterIndex',
                    courses: courses,
                  );
                }).toList(),
              ),
            );
          }
        },
      ),
      backgroundColor: const Color.fromARGB(255, 242, 245, 246),
    );
  }
}
