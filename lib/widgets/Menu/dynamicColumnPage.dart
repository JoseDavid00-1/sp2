import 'package:flutter/material.dart';
import 'package:notesearch/models/tema.dart';
import 'package:notesearch/screen/drawScreen.dart';
import 'package:notesearch/services/DataService.dart';

class DynamicColumnPage extends StatefulWidget {
  final int cursoId;

  const DynamicColumnPage({required this.cursoId, super.key});

  @override
  State<DynamicColumnPage> createState() => _DynamicColumnPageState();
}

class _DynamicColumnPageState extends State<DynamicColumnPage> {
  late Future<List<Tema>> _temasFuture;
  final DataService dataService = DataService('54.211.155.196:3000');

  final PageController _pageController = PageController();
  int _currentPage = 0;

  @override
  void initState() {
    super.initState();
    _loadTemas();
    _pageController.addListener(() {
      int page = _pageController.page!
          .round(); // Redondea para obtener la página actual
      if (_currentPage != page) {
        setState(() {
          _currentPage = page; // Actualiza el índice centrado
        });
      }
    });
  }

  @override
  void didUpdateWidget(DynamicColumnPage oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.cursoId != widget.cursoId) {
      // Recargar los datos si cursoId cambia
      _loadTemas();
    }
  }

  void _loadTemas() {
    setState(() {
      _temasFuture = dataService.fetchTemasByCursoId(widget.cursoId);
    });
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Tema>>(
      future: _temasFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (snapshot.hasError) {
          return Center(
            child: Text('Error: ${snapshot.error}'),
          );
        } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return const Center(
            child: Text('No hay temas disponibles para este curso'),
          );
        }

        final temas = snapshot.data!;

        return Row(
          children: [
            Expanded(
              child: Column(
                children: [
                  const Text(
                    'Prerequisitos:',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  Expanded(
                    child: ListView.builder(
                      itemCount: temas[_currentPage].dependencias?.length ?? 0,
                      itemBuilder: (context, index) {
                        final dependencias = temas[_currentPage].dependencias!;
                        final dependencia =
                            dependencias[index].dependecia.values.first;
                        return Container(
                          margin: const EdgeInsets.all(8.0),
                          padding: const EdgeInsets.all(16.0),
                          color: Colors.greenAccent,
                          child: Text(
                            dependencia,
                            style: const TextStyle(fontSize: 18),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 2,
              child: PageView.builder(
                controller: _pageController,
                scrollDirection: Axis.vertical,
                itemCount: temas.length,
                itemBuilder: (context, index) {
                  var tema = temas[index];
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20.0),
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            margin: const EdgeInsets.symmetric(horizontal: 50),
                            color: Colors.blueAccent,
                            height: 200,
                            child: Center(
                              child: Column(
                                children: [
                                  Text(tema.nombre,
                                      style: const TextStyle(
                                        fontSize: 24,
                                        color: Colors.white,
                                      )),
                                  Text(tema.descripcion,
                                      style: const TextStyle(
                                        fontSize: 12,
                                        color: Colors.white,
                                      )),
                                ],
                              ),
                            ),
                          ),
                          ElevatedButton.icon(
                            onPressed: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) => DrawingScreen(),
                                ),
                              );
                            },
                            icon: const Icon(Icons.edit),
                            label: const Text("Editar Nota"),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        );
      },
    );
  }
}
