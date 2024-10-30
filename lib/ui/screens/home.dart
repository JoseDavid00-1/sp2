import 'package:flutter/material.dart';
import 'package:sp2/services/ApiServer.dart';
import 'package:sp2/ui/widgets/AppBarWidget.dart';
import 'package:sp2/ui/widgets/column_semester.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late Future<Map<String, List<Map<String, dynamic>>>> semestersFuture;

  @override
  void initState() {
    super.initState();
    semestersFuture = fetchSemesters(); // Cargar los semestres al inicializar
  }

  Future<Map<String, List<Map<String, dynamic>>>> fetchSemesters() async {
    APIService apiService =
        APIService('https://tu-api-url.com'); // Cambia esto a tu URL real
    return await apiService
        .fetchSemesters(); // Asegúrate de tener este método en APIService
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(title: 'NoteSearch'),
      body: FutureBuilder<Map<String, List<Map<String, dynamic>>>>(
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
                children: semesters.entries.map((entry) {
                  return ColumnSemester(
                    semester: entry,
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
