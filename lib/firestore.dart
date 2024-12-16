import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'dart:io';

class UploadImagePage extends StatelessWidget {
  Future<void> pickAndUploadImage() async {
    File? image = await pickImage();
    if (image != null) {
      await uploadImage(image);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Upload Image')),
      body: Center(
        child: ElevatedButton(
          onPressed: pickAndUploadImage,
          child: Text('Select and Upload Image'),
        ),
      ),
    );
  }

  Future<File?> pickImage() async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      return File(image.path);
    }
    return null;
  }

  Future<void> uploadImage(File image) async {
    try {
      final storageRef = FirebaseStorage.instance.ref();
      final imagesRef = storageRef
          .child('images/${DateTime.now().millisecondsSinceEpoch}.jpg');
      await imagesRef.putFile(image);
      String downloadURL = await imagesRef.getDownloadURL();
      print('Image uploaded! URL: $downloadURL');
    } catch (e) {
      print('Error uploading image: $e');
    }
  }
}
