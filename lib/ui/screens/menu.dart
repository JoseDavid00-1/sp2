import 'package:flutter/material.dart';
import 'package:sp2/services/DataService.dart';
import 'package:sp2/ui/screens/home.dart';
import 'package:sp2/ui/widgets/AppBarWidget.dart';
import 'package:sp2/ui/widgets/menu/CourseButton.dart'; // Asegúrate de que esta ruta sea correcta

class MenuScreen extends StatefulWidget {
  const MenuScreen({super.key});

  @override
  _MenuScreenState createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  final DataService dataService =
      DataService(); // Instancia de la clase de servicio
  List<Map<String, dynamic>> courses = [];
  List<String> courseDescriptions = [];
  int selectedCourseIndex = 0;
  bool isLoading = true;
  String detailedCourseInfo = "";
  bool isDetailedLoading = false;

  @override
  void initState() {
    super.initState();
    loadData(); // Cargar datos al iniciar la pantalla
  }

  // Función para cargar datos de materias recientes
  Future<void> loadData() async {
    setState(() {
      isLoading = true; // Indicador de carga
    });

    courses = await dataService.loadRecentCourses();
    courseDescriptions = await dataService.loadCourseDescriptions();

    if (courses.isNotEmpty) {
      // Cargar detalles del primer curso si hay cursos disponibles
      await loadCourseDetails(0);
    }

    setState(() {
      isLoading = false; // Desactiva el indicador de carga
    });
  }

  // Función para cargar información detallada de un curso
  Future<void> loadCourseDetails(int index) async {
    setState(() {
      isDetailedLoading = true; // Activa el indicador de carga para detalles
    });

    detailedCourseInfo = await dataService.loadCourseDetails(index);

    setState(() {
      isDetailedLoading = false; // Se desactiva el indicador de carga
    });
  }

  void selectCourse(int index) {
    setState(() {
      selectedCourseIndex = index; // Actualiza el índice seleccionado
    });
    loadCourseDetails(index); // Carga detalles del curso al seleccionarlo
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(),
      body: isLoading
          ? Center(
              child:
                  CircularProgressIndicator()) // Muestra un indicador de carga
          : Row(
              children: [
                // Columna izquierda para navegación de carreras
                Container(
                  width: MediaQuery.of(context).size.width * 0.2,
                  color: Colors.grey[200],
                  child: Column(
                    children: [
                      // Lista de carreras
                      Expanded(
                        child: ListView.builder(
                          itemCount: courses.length,
                          itemBuilder: (context, index) {
                            final course = courses[index];
                            return CourseButton(
                                courseName: course['name'],
                                iconName: course['icon'],
                                color: course['color'],
                                onPressed: () => Navigator.of(context).push(
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            const HomeScreen(),
                                      ),
                                    ) // Pasar el ID del curso
                                );
                          },
                        ),
                      ),
                      // Botón Editar
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ElevatedButton(
                          onPressed: () {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                  content: Text(
                                      "Funcionalidad de edición no implementada")),
                            );
                          },
                          child: Text("Editar"),
                        ),
                      ),
                    ],
                  ),
                ),
                // Columna derecha para mostrar detalles del curso seleccionado
                Expanded(
                  child: Container(
                    padding: EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          courses.isNotEmpty
                              ? courses[selectedCourseIndex]['name']
                              : '',
                          style: TextStyle(
                              fontSize: 24, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 10),
                        isDetailedLoading
                            ? CircularProgressIndicator() // Indicador de carga para detalles
                            : Text(
                                detailedCourseInfo,
                                style: TextStyle(fontSize: 16),
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
