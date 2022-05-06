/// This is the [MovieImdb] class model.
/// It is used for data returned from fetching a moving using its IMDb ID.
/// I only mapped the data I "needed" as well as basic identifiers like
/// title and year.

class MovieImdb {
  final String title;
  final String year;
  final String plot;
  final String poster;
  final String imdbId;

  MovieImdb(
      {required this.title,
      required this.year,
      required this.plot,
      required this.poster,
      required this.imdbId});

  factory MovieImdb.fromJson(Map<String, dynamic> json) {
    return MovieImdb(
      title: json['Title'] as String,
      year: json['Year'] as String,
      plot: json['Plot'] as String,
      poster: json['Poster'] as String,
      imdbId: json['imdbID'] as String,
    );
  }
}
