/// This widget is the drawer that contains settings for
/// sorting the order that the movies are displayed in.

import 'package:flutter/material.dart';
import 'package:movie_app/bloc/settings_bloc.dart';

class MovieDrawer extends StatelessWidget {
  const MovieDrawer({Key? key, required this.isAscending}) : super(key: key);

  final bool isAscending;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          ListTile(
            title: const Text('Sort by Date Ascending'),
            onTap: () {
              SettingsBloc().setIsAscending(true);
              Navigator.pop(context);
            },
            selected: isAscending,
          ),
          ListTile(
            title: const Text('Sort by Date Dscending'),
            onTap: () {
              SettingsBloc().setIsAscending(false);
              Navigator.pop(context);
            },
            selected: !isAscending,
          )
        ],
      ),
    );
  }
}
