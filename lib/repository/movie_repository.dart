/// This is the repository file for Movie data.

import 'package:movie_app/model/movie_imdb.dart';
import 'package:movie_app/model/movie_search_result.dart';
import 'package:movie_app/service/movie_api.dart';

class MovieRepository {
  final movieApi = MovieApi();

  Future<MovieSearchResult> searchMovieByTitle(String searchTerm) async {
    return movieApi
        .searchMovieByTitle(searchTerm)
        .then((MovieSearchResult result) {
      return result;
    });
  }

  Future<MovieImdb> getMovieByImdbId(String id) async {
    return movieApi.getMovieByImdbId(id).then((MovieImdb movie) {
      return movie;
    });
  }
}
