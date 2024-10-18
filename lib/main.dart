import 'package:flutter/material.dart';
import 'package:sp2/screens/drawboard.dart';

/// Flutter code sample for [Scaffold].

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: DrawBoard(),
    );
  }
}
