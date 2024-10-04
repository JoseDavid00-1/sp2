import 'package:flutter/material.dart';
import 'package:projecto/screens/home_prueba.dart';
import 'package:projecto/screens/tema_screen.dart';

/// Flutter code sample for [Scaffold].

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: TemaScreen(),
    );
  }
}

class CoursesDisplay extends StatefulWidget {
  const CoursesDisplay({super.key});

  @override
  State<CoursesDisplay> createState() => _CoursesDisplayState();
}

class _CoursesDisplayState extends State<CoursesDisplay> {
  @override
  Widget build(BuildContext context) {
    return const HomeScreen();
  }
}
