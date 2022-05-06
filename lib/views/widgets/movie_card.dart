/// This widget shows information about a movie as a card: a clip of
/// the movie poster, the title of the movie, and its year.

import 'package:flutter/material.dart';
import 'package:movie_app/model/movie.dart';

class MovieCard extends StatelessWidget {
  const MovieCard({Key? key, required this.movie}) : super(key: key);

  final Movie movie;

  @override
  Widget build(BuildContext context) {
    return Card(
      semanticContainer: true,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(6.0))),
      margin: const EdgeInsets.all(5.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Flexible(
            child: SizedBox(
              height: 200,
              width: double.infinity,
              child: Image(
                alignment: Alignment.topCenter,
                image: NetworkImage(movie.poster),
                fit: BoxFit.fitWidth,
                errorBuilder: (BuildContext context, Object exception,
                    StackTrace? stackTrace) {
                  return const Icon(Icons.image_not_supported_outlined,
                      size: 60.0);
                },
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 6.0, vertical: 4.0),
            child: Text(movie.title,
                style: const TextStyle(fontSize: 18),
                overflow: TextOverflow.ellipsis),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(6.0, 0, 6.0, 4.0),
            child: Text(movie.year,
                style: const TextStyle(fontSize: 14),
                overflow: TextOverflow.ellipsis),
          ),
        ],
      ),
    );
  }
}
