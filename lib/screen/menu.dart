import 'package:flutter/material.dart';
import 'package:notesearch/models/curso.dart';
import 'package:notesearch/services/DataService.dart';
import 'package:notesearch/widgets/AppBar/AppBarWidget.dart';
import 'package:notesearch/widgets/Menu/CourseButton.dart';
import 'package:notesearch/widgets/Menu/dynamicColumnPage.dart';

class MenuScreen extends StatefulWidget {
  const MenuScreen({super.key});

  @override
  _MenuScreenState createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  final DataService dataService = DataService('54.211.155.196:3000');
  List<Course> courses = [];
  int selectedCourseId = 1; // ID inicial predeterminado
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    loadData(); // Cargar datos al iniciar la pantalla
  }

  Future<void> loadData() async {
    setState(() {
      isLoading = true;
    });

    courses = await dataService.loadRecentCourses();

    setState(() {
      isLoading = false;
    });
  }

  void selectCourse(int courseId) {
    setState(() {
      selectedCourseId = courseId; // Actualiza el curso seleccionado
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(),
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : Row(
              children: [
                // Columna izquierda
                Container(
                  width: MediaQuery.of(context).size.width * 0.2,
                  color: Colors.grey[200],
                  child: ListView.builder(
                    itemCount: courses.length,
                    itemBuilder: (context, index) {
                      final course = courses[index];
                      return Padding(
                        padding: EdgeInsets.only(left: 10.0, right: 10.0),
                        child: CourseButton(
                          courseName: course.name,
                          emoji: course.emoji ?? '📘',
                          color: course.colorHex,
                          onPressed: () {
                            selectCourse(
                                course.id); // Actualiza el curso seleccionado
                          },
                        ),
                      );
                    },
                  ),
                ),

                // Columna derecha
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.all(16.0),
                    child: DynamicColumnPage(cursoId: selectedCourseId),
                  ),
                ),
              ],
            ),
    );
  }
}
