import 'package:flutter/material.dart';
import 'package:sp2/data.dart';
import 'package:sp2/ui/screens/base.dart';
import 'package:sp2/ui/screens/home.dart';
import 'package:sp2/ui/screens/login.dart';
import 'package:sp2/ui/screens/menu.dart';

/// Flutter code sample for [Scaffold].

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: HomePage(),
    );
  }
}
