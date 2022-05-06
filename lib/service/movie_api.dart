/// This is the API file for Movie data returned by searching movies by title or
/// fetching a movine using its IMDb ID. Information can be found
/// here: http://www.omdbapi.com

import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:movie_app/model/movie_imdb.dart';
import 'package:movie_app/model/movie_search_result.dart';

class MovieApi {
  /// Just so you know that I know, adding an api key to version control
  /// should NEVER happen. I would say in general, long-term api keys should not
  /// be a part of an app, especially on the client side. It would be more secure
  /// to have your own API where you can authenticate your client in some way.
  ///
  /// Please uncomment this line via the directions in the README and add the
  /// api key. You can generate one from here: http://www.omdbapi.com/apikey.aspx
  /// or use the one provided in the coding exercise PDF.
  ///
  /// Example: static const apiKey = 'abcd1234';

  //static const apiKey = 'apiKey here';
  static const apiKey = 'a4d98298';

  static const String baseUrl = 'http://www.omdbapi.com';
  final http.Client _client = http.Client();

  Future<MovieSearchResult> searchMovieByTitle(String searchTerm) async {
    final response =
        await _client.get(Uri.parse('$baseUrl/?s=$searchTerm&apikey=$apiKey'));

    if (response.statusCode == 200) {
      return MovieSearchResult.fromJson(json.decode(response.body));
    } else {
      throw Exception('error calling searchMovieByTitle');
    }
  }

  Future<MovieImdb> getMovieByImdbId(String id) async {
    final response = await _client
        .get(Uri.parse('$baseUrl/?i=$id&plot=full&apikey=$apiKey'));

    if (response.statusCode == 200) {
      return MovieImdb.fromJson(json.decode(response.body));
    } else {
      throw Exception('error calling getMovieByImdbId');
    }
  }
}
