/// This shows data returned by a movie that is searched for using its
/// IMDb ID. It uses a [StreamBuilder] to show the data with a
/// [CircularProgressIndicator] as a placeholder while data is
/// being fetched.

import 'package:flutter/material.dart';
import 'package:movie_app/bloc/movie_bloc.dart';
import 'package:movie_app/model/movie_imdb.dart';
import 'package:url_launcher/url_launcher.dart';

class MovieDetailsScreen extends StatefulWidget {
  const MovieDetailsScreen({Key? key, required this.imdbId}) : super(key: key);

  final String imdbId;

  @override
  State<MovieDetailsScreen> createState() => _MovieDetailsScreenState();
}

class _MovieDetailsScreenState extends State<MovieDetailsScreen> {
  @override
  void initState() {
    super.initState();
    MovieBloc().getMovieByImdbId(widget.imdbId);
  }

  _launchUrl(Uri url) async {
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    } else {
      throw 'could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 70.0,
        elevation: 0.0,
        titleTextStyle: const TextStyle(
          color: Colors.black,
          fontSize: 22.0,
          fontWeight: FontWeight.bold,
        ),
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Container(
          color: Colors.white,
          child: Center(
            child: Container(
              alignment: Alignment.topCenter,
              child: Scrollbar(
                isAlwaysShown: true,
                thickness: 8,
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      StreamBuilder(
                          stream: MovieBloc().movieImdbStream,
                          builder:
                              (BuildContext context, AsyncSnapshot snapshot) {
                            if (snapshot.hasData) {
                              MovieImdb movieImdb = snapshot.data;
                              return Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(20.0),
                                    child: Image(
                                      image: NetworkImage(movieImdb.poster),
                                      errorBuilder: (BuildContext context,
                                          Object exception,
                                          StackTrace? stackTrace) {
                                        return const Icon(
                                            Icons.image_not_supported_outlined,
                                            size: 60.0);
                                      },
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 12.0, vertical: 8),
                                    child: Text(
                                      movieImdb.plot,
                                      style: TextStyle(fontSize: 16.0),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 12.0, vertical: 8),
                                    child: InkWell(
                                      onTap: () {
                                        _launchUrl(Uri.parse(
                                            "https://www.imdb.com/title/${movieImdb.imdbId}"));
                                      },
                                      child: Text(
                                        "(https://www.imdb.com/title/${movieImdb.imdbId}) ",
                                        style: const TextStyle(
                                            fontSize: 16.0, color: Colors.blue),
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                  ),
                                ],
                              );
                            }
                            return const Padding(
                              padding: EdgeInsets.only(top: 100.0),
                              child: SizedBox(
                                  height: 60,
                                  width: 60,
                                  child: CircularProgressIndicator(
                                    valueColor: AlwaysStoppedAnimation<Color>(
                                        Colors.black),
                                  )),
                            );
                          })
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
