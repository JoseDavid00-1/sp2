import 'dart:io';
import 'package:flutter/material.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';

class ChangeImageScreen extends StatefulWidget {
  @override
  _ChangeImageScreenState createState() => _ChangeImageScreenState();
}

class _ChangeImageScreenState extends State<ChangeImageScreen> {
  File? _selectedImage;
  final ImagePicker _picker = ImagePicker();
  final String _imagePath =
      'drawings/2024-11-29T19:16:23.867633.png'; // Ruta fija en Firebase Storage

  // Método para seleccionar una imagen
  Future<void> _pickImage() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _selectedImage = File(pickedFile.path);
      });
    }
  }

  // Método para subir la nueva imagen y sobrescribir la anterior
  Future<void> _uploadImage() async {
    if (_selectedImage != null) {
      try {
        final storageRef = FirebaseStorage.instance.ref().child(_imagePath);
        await storageRef.putFile(_selectedImage!);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Imagen subida exitosamente.')),
        );
      } catch (e) {
        print("Error al subir la imagen: $e");
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error al subir la imagen.')),
        );
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Selecciona una imagen primero.')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cambiar Imagen'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _selectedImage != null
                ? Image.file(_selectedImage!, height: 200)
                : Text('No se ha seleccionado ninguna imagen'),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _pickImage,
              child: Text('Seleccionar Imagen'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _uploadImage,
              child: Text('Subir Imagen'),
            ),
          ],
        ),
      ),
    );
  }
}
