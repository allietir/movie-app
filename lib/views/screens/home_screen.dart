/// This is the home screen of the app. When first loaded, a subscription
/// is set up to the [SettingsBloc] layer and the isAscending value is retrieved
/// to show the selected [MovieDrawer] setting.
///
/// This screen uses a [StreamBuilder] to show data returned from the
/// [MovieSearchBar]. When nothing is searched yet, then nothing is shown.
/// When a search is ran and returns successful results, it will use a
/// [GridView] to show [MovieCard] that can be tapped to be taken to another
/// screen, [MovieDetailsScreen], that shows additional info. When a search
/// is ran and returns unsuccessful results, then a [MovieSearchError] is shown.
///
/// If a different error occurs, then a generic error message is shown.

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:movie_app/bloc/movie_bloc.dart';
import 'package:movie_app/bloc/settings_bloc.dart';
import 'package:movie_app/model/movie_search_result.dart';
import 'package:movie_app/views/screens/movie_details_screen.dart';
import 'package:movie_app/views/widgets/movie_card.dart';
import 'package:movie_app/views/widgets/movie_drawer.dart';
import 'package:movie_app/views/widgets/movie_search_bar.dart';
import 'package:movie_app/views/widgets/movie_search_error.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isAscending = false;

  late StreamSubscription<bool> isAscendingSubscription;

  @override
  void initState() {
    super.initState();

    isAscendingSubscription =
        SettingsBloc().isAscendingStream.listen((bool value) {
      setState(() {
        isAscending = value;
      });
    });

    SettingsBloc().getIsAscending().then((value) {
      setState(() {
        isAscending = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Movie app'),
        centerTitle: true,
        toolbarHeight: 70.0,
        elevation: 0.0,
        titleTextStyle: const TextStyle(
          color: Colors.black,
          fontSize: 24.0,
          fontWeight: FontWeight.bold,
        ),
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      drawer: MovieDrawer(isAscending: isAscending),
      body: Center(
        child: Container(
          alignment: Alignment.topCenter,
          width: MediaQuery.of(context).size.width * 0.95,
          child: SingleChildScrollView(
            child: Column(
              children: [
                const Padding(
                  padding:
                      EdgeInsets.symmetric(vertical: 16.0, horizontal: 5.0),
                  child: MovieSearchBar(),
                ),
                StreamBuilder(
                    stream: MovieBloc().movieSearchResultStream,
                    builder: (BuildContext context, AsyncSnapshot snapshot) {
                      if (snapshot.hasData) {
                        MovieSearchResult movieSearchResult = snapshot.data;
                        isAscending
                            ? movieSearchResult.searchResults.sort((a, b) {
                                return a.year.compareTo(b.year);
                              })
                            : movieSearchResult.searchResults.sort((b, a) {
                                return a.year.compareTo(b.year);
                              });
                        if (movieSearchResult.response == 'True') {
                          return GridView.builder(
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2, childAspectRatio: 0.80),
                            itemCount: movieSearchResult.searchResults.length,
                            shrinkWrap: true,
                            physics: const ScrollPhysics(),
                            itemBuilder: (BuildContext context, int index) {
                              if (movieSearchResult.response == "True") {
                                return GestureDetector(
                                  child: MovieCard(
                                      movie: movieSearchResult
                                          .searchResults[index]),
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                MovieDetailsScreen(
                                                    imdbId: movieSearchResult
                                                        .searchResults[index]
                                                        .imdbId)));
                                  },
                                );
                              }
                              return Container();
                            },
                          );
                        } else if (movieSearchResult.response == 'False') {
                          return MovieSearchError(
                              searchError: movieSearchResult);
                        }
                      } else if (snapshot.hasError) {
                        return const Text(
                          'Oops! Something went wrong.',
                          style: TextStyle(fontSize: 22, color: Colors.white),
                          textAlign: TextAlign.center,
                        );
                      }
                      return Container();
                    }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
