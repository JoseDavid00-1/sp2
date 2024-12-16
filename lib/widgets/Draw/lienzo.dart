import 'dart:typed_data';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'dart:ui' as ui;
import 'package:http/http.dart' as http;
import 'package:flutter/rendering.dart';
import 'package:notesearch/models/ImagePainter.dart';
import 'package:notesearch/models/LineObject.dart';
import 'package:notesearch/models/fingerPainter.dart';

class FingerPainterScreen extends StatefulWidget {
  const FingerPainterScreen({super.key});

  @override
  State<FingerPainterScreen> createState() => _FingerPainterScreenState();
}

class _FingerPainterScreenState extends State<FingerPainterScreen> {
  final List<LineObject> lines = [];
  final storageRef = FirebaseStorage.instance.ref();
  Color _currentColor = Colors.red; // Color inicial
  double _brushSize = 5.0; // Grosor inicial
  String imageURL =
      'https://firebasestorage.googleapis.com/v0/b/note-search-g.firebasestorage.app/o/images%2F1732892180039.jpg?alt=media&token=154a5ce5-299e-4313-b106-251bb88c9afb';
  String imageName = "images/1732892180039.jpg";

  final _repaintKey = GlobalKey();
  ui.Image? myImage;
  ui.Image? original;
  ui.FragmentProgram? _program;

  @override
  void initState() {
    super.initState(); // Cargar la imagen al inicio
    _loadMyShader().then((_) {
      _loadImage();
    });
  }

  Future<void> _loadImage() async {
    final image = await getNote(); // Llama a la función proporcionada
    if (mounted) {
      setState(() {
        myImage = image;
        original = image; // Actualiza el estado con la imagen cargada
      });
    }
  }

  void _onClearLines() {
    setState(() {
      lines.clear();
      myImage = original;
    });
  }

  void _onPanUpdate(DragUpdateDetails details) {
    setState(() {
      lines.last = lines.last.copyWith(
        points: [...lines.last.points, details.localPosition],
      );
    });
  }

  void _onPanStart(DragStartDetails details) {
    setState(() {
      lines.add(
        LineObject(
          color: _currentColor, // Usa el color dinámico
          strokeWidth: _brushSize,
          points: [details.localPosition],
        ),
      );
    });
  }

  bool _eraserModeEnabled = false;
  void _onToggleEraser(bool value) {
    setState(() {
      _eraserModeEnabled = value;
      _currentColor = Theme.of(context).scaffoldBackgroundColor;
    });
  }

  Future<ui.Image> getNote() async {
    final pathReference = storageRef.child(imageName);
    final Uint8List? data = await pathReference.getData();
    data ?? {"-------------------------------------NO hay datos"};
    ui.Image myBackground = await decodeImageFromList(data!);
    return myBackground;
  }

  void _capturePng() async {
    final boundary =
        _repaintKey.currentContext!.findRenderObject() as RenderRepaintBoundary;
    final image = await boundary.toImage(pixelRatio: 1.0);

    setState(() {
      myImage = image;
    }); // Devuelve la imagen en formato Uint8List
  }

  Future<void> _replaceImage(String fileName) async {
    try {
      // Captura la imagen como Uint8List usando tu función _capturefirestore()
      Uint8List imageBytes = await _capturefirestore();

      // Crea una referencia a la imagen que deseas reemplazar en Firebase Storage
      Reference imageRef = storageRef.child(fileName);

      // Sube la nueva imagen y sobrescribe la antigua
      await imageRef.putData(imageBytes);

      // Obtén la URL de la imagen reemplazada
      String imageUrl = await imageRef.getDownloadURL();

      // Imprime la URL de la imagen
      print("Imagen reemplazada con éxito. URL: $imageUrl");
    } catch (e) {
      print("Error al reemplazar la imagen: $e");
    }
  }

  Future<Uint8List> _capturefirestore() async {
    final boundary =
        _repaintKey.currentContext!.findRenderObject() as RenderRepaintBoundary;
    final image = await boundary.toImage(pixelRatio: 1.0);
    final byteData = await image.toByteData(format: ui.ImageByteFormat.png);
    final pngBytes = byteData!.buffer.asUint8List();
    return pngBytes; // Devuelve la imagen en formato Uint8List
  }

  Future<void> _loadMyShader() async {
    final fragmentProgram =
        await ui.FragmentProgram.fromAsset('assets/shaders/simple_shader.frag');
    setState(() {
      _program = fragmentProgram;
    });
  }

  Future<void> _onPanEnd(DragEndDetails details) async {
    if (_program == null) {
      await _loadMyShader();
    }

    _capturePng();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: myImage == null ? null : _onClearLines,
        child: const Icon(Icons.clear),
      ),
      bottomNavigationBar: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              title: const Text('Eraser enabled'),
              trailing: Switch(
                value: _eraserModeEnabled,
                onChanged: myImage == null ? null : _onToggleEraser,
              ),
            ),
            ListTile(
              title: const Text('Change Brush Size'),
              trailing: SizedBox(
                width: 150, // Ajusta el tamaño del slider
                child: Slider(
                  value: _brushSize,
                  min: 1.0,
                  max: 10.0,
                  onChanged: myImage == null
                      ? null
                      : (value) {
                          setState(() {
                            _brushSize = value;
                          });
                        },
                ),
              ),
            ),
            ListTile(
              title: const Text('Select Color'),
              trailing: SizedBox(
                width:
                    150, // Ajusta el ancho para que los botones no ocupen todo el espacio
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    IconButton(
                      icon: const Icon(Icons.circle, color: Colors.red),
                      onPressed: _eraserModeEnabled
                          ? null
                          : () {
                              setState(() {
                                _currentColor = Colors.red;
                              });
                            },
                    ),
                    IconButton(
                      icon: const Icon(Icons.circle, color: Colors.blue),
                      onPressed: _eraserModeEnabled
                          ? null
                          : () {
                              setState(() {
                                _currentColor = Colors.blue;
                              });
                            },
                    ),
                    IconButton(
                      icon: const Icon(Icons.circle, color: Colors.green),
                      onPressed: _eraserModeEnabled
                          ? null
                          : () {
                              setState(() {
                                _currentColor = Colors.green;
                              });
                            },
                    ),
                  ],
                ),
              ),
            ),
            ListTile(
              title: const Text('Save'),
              trailing: IconButton(
                icon: const Icon(Icons.save),
                onPressed: () {
                  setState(() {
                    _replaceImage(imageName);
                  });
                },
              ),
            )
          ],
        ),
      ),
      body: myImage == null || _program == null
          ? const Center(
              child:
                  CircularProgressIndicator(), // Muestra un indicador de carga
            )
          : Expanded(
              child: GestureDetector(
                behavior: HitTestBehavior.opaque,
                onPanStart: _onPanStart,
                onPanUpdate: _onPanUpdate,
                onPanEnd: _onPanEnd,
                child: RepaintBoundary(
                  key: _repaintKey,
                  child: Stack(
                    children: [
                      if (myImage != null &&
                          _program != null) // Verifica que ambos no sean null
                        Positioned.fill(
                          child: CustomPaint(
                            painter: ImagePainter(
                              image: myImage!,
                              program: _program!,
                            ),
                            child: Container(
                              width: 2551,
                              height: 3295,
                            ),
                          ),
                        ),
                      if (lines.isNotEmpty)
                        RepaintBoundary(
                          child: CustomPaint(
                            size: MediaQuery.sizeOf(context),
                            painter: FingerPainter(
                              line: lines.last,
                            ),
                          ),
                        ),
                    ],
                  ),
                ),
              ),
            ),
    );
  }
}
