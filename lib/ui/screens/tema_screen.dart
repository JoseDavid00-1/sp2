import 'package:flutter/material.dart';
import 'package:sp2/ui/screens/columnas.dart';
import 'package:sp2/ui/screens/draw.dart';

class TemaScreen extends StatefulWidget {
  const TemaScreen({required this.cursoID, super.key});
  final String cursoID;
  @override
  State<TemaScreen> createState() => _TemaScreenState();
}

class _TemaScreenState extends State<TemaScreen> {
  final Map<String, String> courses = {
    "CS101": "Matemática 1",
    "PH101": "Física 1",
    "CS201": "Ciencias de la Computación 1",
    "INF101": "Informática 1",
    "TD101": "Tecnología Descriptiva",
    "TIA101": "Técnicas de Investigación y Aprendizaje"
  };
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Center(child: Text('Note Search')),
          backgroundColor: Theme.of(context).colorScheme.onPrimary,
        ),
        body: DynamicColumnPage(
          cursoId: widget.cursoID,
        ),
        floatingActionButton: SizedBox(
          height: 100.0,
          width: 100.0,
          child: FittedBox(
            child: FloatingActionButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const MyHomePage(),
                  ),
                );
              },
              tooltip: 'Edit Note',
              child: const Icon(
                Icons.create,
                size: 36,
              ),
            ),
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
        bottomNavigationBar: const _DemoBottomAppBar(),
      ),
    );
  }
}

class _DemoBottomAppBar extends StatelessWidget {
  const _DemoBottomAppBar();

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      shape: const CircularNotchedRectangle(),
      color: Colors.blue,
    );
  }
}
