import 'package:flutter/material.dart';
import 'package:sp2/screens/columnas.dart';

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
          automaticallyImplyLeading: false,
          title: Text(courses[widget.cursoID]!),
        ),
        body: DynamicColumnPage(
          cursoId: widget.cursoID,
        ),
        floatingActionButton: SizedBox(
          height: 100.0,
          width: 100.0,
          child: FittedBox(
            child: FloatingActionButton(
              onPressed: () {},
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
      child: IconTheme(
        data: IconThemeData(color: Theme.of(context).colorScheme.onPrimary),
        child: Row(
          children: <Widget>[
            IconButton(
              tooltip: 'Open navigation menu',
              icon: const Icon(Icons.menu),
              onPressed: () {},
            ),
            IconButton(
              tooltip: 'Search',
              icon: const Icon(Icons.search),
              onPressed: () {},
            ),
            IconButton(
              tooltip: 'Favorite',
              icon: const Icon(Icons.favorite),
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
