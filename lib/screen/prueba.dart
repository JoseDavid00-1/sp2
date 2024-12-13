import 'dart:io';

import 'package:flutter/material.dart';
import 'package:firebase_storage/firebase_storage.dart';

class Prueba extends StatefulWidget {
  @override
  _PruebaState createState() => _PruebaState();
}

class _PruebaState extends State<Prueba> {
  String imageUrl = '';

  @override
  void initState() {
    super.initState();
    _loadImage();
  }

  // Cargar la URL de la imagen desde Firebase Storage
  Future<void> _loadImage() async {
    try {
      final storageRef = FirebaseStorage.instance.ref().child(
          'drawings/2024-11-29T19:16:23.867633.png'); // Ruta a tu imagen en Firebase
      String url = await storageRef.getDownloadURL();
      setState(() {
        imageUrl = url;
      });
    } catch (e) {
      print("Error al cargar la imagen: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Imagen de Firebase'),
      ),
      body: Center(
        child: imageUrl.isEmpty
            ? CircularProgressIndicator() // Muestra un loading si la URL no está cargada
            : Image.network(imageUrl), // Muestra la imagen una vez cargada
      ),
    );
  }
}
