import 'package:flutter/material.dart';

class AppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final List<Widget> actions;

  AppBarWidget({
    this.title = 'Note Search',
    this.actions = const [],
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        title,
        style: TextStyle(fontSize: 30.00), // Aplica el color del texto aquí
      ),
      actions: [
        IconButton(
            onPressed: () {
              print("Action Button 1");
            },
            icon: Icon(Icons.home)),
        IconButton(
            onPressed: () {
              print("Action Button 1");
            },
            icon: Icon(Icons.apps)),
        IconButton(
            onPressed: () {
              print("Action Button 1");
            },
            icon: Icon(Icons.account_circle)),
      ],
      centerTitle: true,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
