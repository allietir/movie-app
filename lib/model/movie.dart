/// This is the [Movie] class model.

class Movie {
  final String title;
  final String year;
  final String imdbId;
  final String type;
  final String poster;

  Movie({
    required this.title,
    required this.year,
    required this.imdbId,
    required this.type,
    required this.poster,
  });

  factory Movie.fromJson(Map<String, dynamic> json) {
    return Movie(
      title: json['Title'] as String,
      year: json['Year'] as String,
      imdbId: json['imdbID'] as String,
      type: json['Type'] as String,
      poster: json['Poster'] as String,
    );
  }

  static List<Movie> fromJsonList(List json) {
    return json.map((item) => Movie.fromJson(item)).toList();
  }
}
