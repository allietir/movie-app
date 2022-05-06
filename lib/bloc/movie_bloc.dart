/// This is the bloc file for Movie data.
///
/// There are two streams defined here that connects the passage of data
/// between this bloc layer and the UI/widget layer.

import 'package:movie_app/model/movie_imdb.dart';
import 'package:rxdart/rxdart.dart';
import 'package:movie_app/model/movie_search_result.dart';
import 'package:movie_app/repository/movie_repository.dart';

class MovieBloc {
  static var _instance = MovieBloc._internal();

  factory MovieBloc() => _instance;

  static void reset() {
    _instance.dispose();
    _instance = MovieBloc._internal();
  }

  MovieBloc._internal();

  final _repository = MovieRepository();

  final _movieSearchResultSubject = BehaviorSubject<MovieSearchResult>();
  final _movieImdbSubject = BehaviorSubject<MovieImdb>();

  Stream<MovieSearchResult> get movieSearchResultStream =>
      _movieSearchResultSubject.stream;
  Stream<MovieImdb> get movieImdbStream => _movieImdbSubject.stream;

  Future<void> searchMovieByTitle(String searchTerm) {
    return _repository
        .searchMovieByTitle(searchTerm)
        .then((MovieSearchResult result) {
      _movieSearchResultSubject.sink.add(result);
    }).catchError((error) {
      _movieSearchResultSubject.sink.addError(error);
    });
  }

  Future<void> getMovieByImdbId(String id) {
    return _repository.getMovieByImdbId(id).then((MovieImdb movie) {
      _movieImdbSubject.sink.add(movie);
    }).catchError((error) {
      _movieImdbSubject.sink.addError(error);
    });
  }

  void dispose() {
    _movieSearchResultSubject.close();
    _movieImdbSubject.close();
  }
}
