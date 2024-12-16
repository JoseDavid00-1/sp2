import 'package:flutter/material.dart';
import 'package:notesearch/models/curso.dart';
import 'package:notesearch/widgets/Grid/card_course.dart';

class ColumnSemester extends StatelessWidget {
  final String semesterName; // Nombre del semestre
  final List<Course> courses; // Lista de cursos del semestre

  const ColumnSemester({
    required this.semesterName,
    required this.courses,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final currentWidth = MediaQuery.of(context).size.width;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
      child: Column(
        children: [
          Expanded(
            child: SizedBox(
              width: currentWidth * 5 / 7,
              child: Column(
                children: [
                  SizedBox(
                    height: 100,
                    child: Center(
                      child: Text(
                        semesterName,
                        style: const TextStyle(
                          fontSize: 70,
                          color: Color.fromARGB(255, 31, 41, 55),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Center(
                      child: Container(
                        padding: const EdgeInsets.all(10),
                        child: GridView.count(
                          controller: ScrollController(keepScrollOffset: false),
                          crossAxisCount: 3,
                          shrinkWrap: true,
                          childAspectRatio: 1.1,
                          children: courses.map((course) {
                            return Padding(
                              padding: const EdgeInsets.all(10),
                              child: GestureDetector(
                                onTap: () {
                                  // Acciones al tocar un curso
                                  print('Seleccionaste ${course.name}');
                                },
                                child: CourseCard(
                                  name: course.name,
                                  borderColor: course.color,
                                  emoji:
                                      course.emoji, // Pasar el emoji del curso
                                ),
                              ),
                            );
                          }).toList(),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
