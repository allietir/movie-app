/// This is the [MovieSearchResult] class model.
/// It contains information about the  search returned by searching a movie
/// title as well as a list of [Movie] returned by the search.
///
/// The API call that fetches this data this may succeed but the search itself may return an
/// error, so the factory constructor behaves differently depending on the 'Response'
/// field. A 'False' value indicates that the search failed or an error occured, while
/// a 'True' value indicates that it returned successful results.

import 'package:movie_app/model/movie.dart';

class MovieSearchResult {
  final List<Movie> searchResults;
  final int totalResults;
  final String response;
  final String error;

  MovieSearchResult({
    required this.searchResults,
    required this.totalResults,
    required this.response,
    required this.error,
  });

  factory MovieSearchResult.fromJson(Map<String, dynamic> json) {
    if (json['Response'] == 'False') {
      return MovieSearchResult(
        searchResults: [],
        totalResults: 0,
        response: json['Response'],
        error: json['Error'],
      );
    }
    return MovieSearchResult(
      searchResults: Movie.fromJsonList(json['Search']),
      totalResults: int.parse(json['totalResults']),
      response: json['Response'],
      error: 'None',
    );
  }
}
