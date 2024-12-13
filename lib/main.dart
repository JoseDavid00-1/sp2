import 'package:flutter/material.dart';

// Importaciones de Firebase
import 'package:firebase_core/firebase_core.dart';
import 'package:notesearch/firestore.dart';
import 'package:notesearch/screen/LoginScreen.dart';
import 'package:notesearch/screen/drawScreen.dart';
import 'package:notesearch/screen/menu.dart';
import 'package:notesearch/screen/prueba.dart';
import 'package:notesearch/screen/update.dart';
import 'package:notesearch/widgets/Draw/lienzo.dart';
import 'firebase_options.dart';

import 'package:flutter/material.dart';
import 'dart:ui' as ui;
import 'package:http/http.dart' as http;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.

  //cambia el siguiente codigo para que el titulo sea SP2 DEMO
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SP2 DEMO',
      theme: ThemeData(
        useMaterial3: true,
      ),
      home: MenuScreen(),
    );
  }
}
