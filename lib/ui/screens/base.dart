import 'package:flutter/material.dart';
import 'package:sp2/ui/widgets/AppBarWidget.dart';

class name extends StatefulWidget {
  const name({super.key});

  @override
  State<name> createState() => _nameState();
}

class _nameState extends State<name> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(),
    );
  }
}
