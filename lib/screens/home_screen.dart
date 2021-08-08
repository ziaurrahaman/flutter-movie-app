import 'package:flutter/material.dart';
import 'package:flutter_movie_app/providers/movie_provider.dart';
import 'package:flutter_movie_app/widgets/trending_movie_list_item.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final trendingMovies = context.watch<MovieProvider>().trendingMovie;
    final popularMovies = context.watch<MovieProvider>().popularMovie;
    final topRatedMovies = context.watch<MovieProvider>().topRatedMovie;
    final upComingMovies = context.watch<MovieProvider>().upComingMovie;

    return Scaffold(
        appBar: AppBar(
          title: Text('Flutter Movie App'),
        ),
        body: Container(
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Trending Movies',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                ),
                Container(
                  height: 260,
                  child: ListView.builder(
                    itemBuilder: (context, index) => MovieListItem(
                      trendingMovie: trendingMovies.movies[index],
                    ),
                    itemCount: trendingMovies.movies.length,
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Popular Movies',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                ),
                Container(
                  height: 260,
                  child: ListView.builder(
                    itemBuilder: (context, index) => MovieListItem(
                      trendingMovie: popularMovies.movies[index],
                    ),
                    itemCount: popularMovies.movies.length,
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'TopRated Movies',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                ),
                Container(
                  height: 260,
                  child: ListView.builder(
                    itemBuilder: (context, index) => MovieListItem(
                      trendingMovie: topRatedMovies.movies[index],
                    ),
                    itemCount: topRatedMovies.movies.length,
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Upcoming Movies',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                ),
                Container(
                  height: 260,
                  child: ListView.builder(
                    itemBuilder: (context, index) => MovieListItem(
                      trendingMovie: upComingMovies.movies[index],
                    ),
                    itemCount: upComingMovies.movies.length,
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
