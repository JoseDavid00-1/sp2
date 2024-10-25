import 'package:flutter/material.dart';
import 'package:sp2/models/LineObject.dart';
import 'package:sp2/ui/widgets/FingerPainter.dart';

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
    });
  }

  void _onPanUpdate(DragUpdateDetails details) {
    setState(() {
      lines.last.points.add(details.localPosition);
    });
  }

  void _onPanStart(DragStartDetails details) {
    setState(() {
      lines.add(LineObject(points: [details.localPosition]));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: _onClearLines,
          child: const Icon(Icons.clear),
        ),
        body: GestureDetector(
          onPanStart: _onPanStart,
          onPanUpdate: _onPanUpdate,
          child: CustomPaint(
            size: MediaQuery.sizeOf(context),
            painter: FingerPainter(
              lines: lines,
            ),
          ),
        ));
  }
}
