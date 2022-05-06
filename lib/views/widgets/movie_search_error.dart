/// This widget is very simple error message that appears to the user
/// when a search is ran but returns with unsuccessful results.
/// The error message returned by the API is also be printed.

import 'package:flutter/material.dart';
import 'package:movie_app/model/movie_search_result.dart';

class MovieSearchError extends StatelessWidget {
  const MovieSearchError({Key? key, required this.searchError})
      : super(key: key);

  final MovieSearchResult searchError;

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      const Text(
        'Oops! Something went wrong.',
        style: TextStyle(fontSize: 22, color: Colors.white),
        textAlign: TextAlign.center,
      ),
      Text(
        'Error message: ' + searchError.error,
        style: const TextStyle(fontSize: 22, color: Colors.white),
        textAlign: TextAlign.center,
      ),
      const Text(
        'Please try again.',
        style: TextStyle(fontSize: 22, color: Colors.white),
        textAlign: TextAlign.center,
      )
    ]);
  }
}
