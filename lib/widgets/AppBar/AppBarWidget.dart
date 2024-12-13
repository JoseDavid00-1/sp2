import 'package:flutter/material.dart';
import 'package:notesearch/screen/gridScreen.dart';
import 'package:notesearch/screen/menu.dart';
import 'package:notesearch/screen/profileScreen.dart';

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
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => MenuScreen(),
                ),
              );
            },
            icon: Icon(Icons.home)),
        IconButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => GridScreen(),
                ),
              );
            },
            icon: Icon(Icons.apps)),
        IconButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => ProfileScreen(),
                ),
              );
            },
            icon: Icon(Icons.account_circle)),
      ],
      centerTitle: true,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
