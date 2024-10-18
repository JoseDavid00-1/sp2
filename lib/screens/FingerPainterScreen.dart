import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:sp2/models/ImagePainter.dart';
import 'package:sp2/models/LineObject.dart';
import 'package:sp2/widgets/FingerPainter.dart';

class FingerPainterScreen extends StatefulWidget {
  const FingerPainterScreen({super.key});

  @override
  State<FingerPainterScreen> createState() => _FingerPainterScreenState();
}

class _FingerPainterScreenState extends State<FingerPainterScreen> {
  final List<LineObject> lines = [];

  void _onClearLines() {
    setState(() {
      lines.clear();
      _image = null;
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
          color: _currentColor,
          points: [details.localPosition],
        ),
      );
    });
  }

  Color get _currentColor => _eraserModeEnabled
      ? Theme.of(context).scaffoldBackgroundColor
      : Colors.red;
  bool _eraserModeEnabled = false;
  void _onToggleEraser(bool value) {
    setState(() {
      _eraserModeEnabled = value;
    });
  }

  final _repaintKey = GlobalKey();
  ui.Image? _image;
  void _capturePng() {
    final boundary =
        _repaintKey.currentContext!.findRenderObject() as RenderRepaintBoundary;
    final image = boundary.toImageSync(pixelRatio: 1.0);
    setState(() {
      _image = image;
    });
  }

  ui.FragmentProgram? _program;
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
        onPressed: _onClearLines,
        child: const Icon(Icons.clear),
      ),
      bottomNavigationBar: SafeArea(
        child: ListTile(
          title: const Text('Eraser enabled'),
          trailing: Switch(
            value: _eraserModeEnabled,
            onChanged: _onToggleEraser,
          ),
        ),
      ),
      body: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onPanStart: _onPanStart,
        onPanUpdate: _onPanUpdate,
        onPanEnd: _onPanEnd,
        child: RepaintBoundary(
          key: _repaintKey,
          child: Stack(
            children: [
              if (_image != null && _program != null)
                CustomPaint(
                  size: MediaQuery.sizeOf(context),
                  painter: ImagePainter(
                    image: _image!,
                    program: _program!,
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
    );
  }
}
