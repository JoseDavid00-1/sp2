import 'package:flutter/material.dart';

class AppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final List<Widget> actions;

  AppBarWidget({
    this.title = 'Default Title',
    this.actions = const [],
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Center(child: Text('Note Search')),
      backgroundColor: Theme.of(context).colorScheme.onPrimary,
      actions: actions,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
