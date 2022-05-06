/// This widget is a search bar that allows the user to type in a movie
/// title to be searched. A search will not be executed if the search
/// box is blank.

import 'package:flutter/material.dart';
import 'package:movie_app/bloc/movie_bloc.dart';

class MovieSearchBar extends StatefulWidget {
  const MovieSearchBar({Key? key}) : super(key: key);

  @override
  State<MovieSearchBar> createState() => _MovieSearchBarState();
}

class _MovieSearchBarState extends State<MovieSearchBar> {
  String currentText = '';

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      child: TextField(
        textAlignVertical: TextAlignVertical.center,
        decoration: InputDecoration(
          enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.white, width: 2.0)),
          fillColor: Colors.white,
          filled: true,
          focusedBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.white, width: 2.0)),
          hintText: 'Search',
          hintStyle: const TextStyle(color: Colors.black, fontSize: 20),
          prefixIcon: IconButton(
            icon: const Icon(Icons.search, color: Colors.black, size: 34),
            onPressed: () {
              if (currentText != '') {
                MovieBloc().searchMovieByTitle(currentText);
                FocusManager.instance.primaryFocus?.unfocus();
              }
            },
          ),
        ),
        onChanged: (text) {
          currentText = text;
        },
        onSubmitted: (value) {
          if (currentText != '') {
            MovieBloc().searchMovieByTitle(value);
          }
        },
      ),
    );
  }
}
