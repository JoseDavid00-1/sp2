import 'package:flutter/material.dart';
import 'package:notesearch/widgets/AppBar/AppBarWidget.dart';
import 'package:notesearch/widgets/Draw/lienzo.dart';

class DrawingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(),
      body: Column(
        children: [
          // Barra superior con opciones
          Container(
            color: Colors.grey[200],
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  icon: Icon(Icons.color_lens),
                  onPressed: () {
                    // Cambiar color
                  },
                ),
                IconButton(
                  icon: Icon(Icons.brush),
                  onPressed: () {
                    // Cambiar tamaño del pincel
                  },
                ),
                IconButton(
                  icon: Icon(Icons.undo),
                  onPressed: () {
                    // Deshacer
                  },
                ),
                IconButton(
                  icon: Icon(Icons.redo),
                  onPressed: () {
                    // Rehacer
                  },
                ),
              ],
            ),
          ),
          // Área de dibujo principal
          Expanded(
            child: Container(
              color: Colors.white,
              child: Center(
                child: FingerPainterScreen(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
