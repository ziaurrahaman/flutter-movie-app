import 'package:flutter/material.dart';
import 'package:flutter_movie_app/models/trending_movie.dart';

class MovieDetailsScreen extends StatelessWidget {
  late final MovieResultModel trendingMovie;
  MovieDetailsScreen({Key? key, required this.trendingMovie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 240,
            flexibleSpace: FlexibleSpaceBar(
              title: Text(trendingMovie.title),
              background: Image.network(
                'http://image.tmdb.org/t/p/w500' + trendingMovie.imagePath,
                fit: BoxFit.fitWidth,
                // width: 800,
              ),
            ),
          ),
          SliverList(
              delegate: SliverChildListDelegate(<Widget>[
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.all(8),
              child: Text(
                trendingMovie.title,
                style: TextStyle(
                    fontSize: 24,
                    color: Colors.black,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                trendingMovie.overview,
                style: TextStyle(
                    fontSize: 18,
                    color: Colors.black,
                    fontWeight: FontWeight.w400),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8),
              child: Text(
                'Release Date',
                style: TextStyle(
                    fontSize: 24,
                    color: Colors.black,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                trendingMovie.releaseDate,
                style: TextStyle(
                    fontSize: 18,
                    color: Colors.black,
                    fontWeight: FontWeight.w400),
              ),
            ),
            SizedBox(
              height: 16,
            ),
            Padding(
              padding: const EdgeInsets.all(8),
              child: Text(
                'Ratings',
                style: TextStyle(
                    fontSize: 24,
                    color: Colors.black,
                    fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              height: 8,
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Icon(
                    Icons.star,
                    color: Colors.yellowAccent[700],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    trendingMovie.voteAverage.toString() +
                        ' / 10   ' +
                        '${trendingMovie.voteCount}',
                    style: TextStyle(
                        fontSize: 18,
                        color: Colors.black,
                        fontWeight: FontWeight.w400),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 8,
            ),
            Padding(
              padding: const EdgeInsets.all(8),
              child: Text(
                'Popularity',
                style: TextStyle(
                    fontSize: 24,
                    color: Colors.black,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                trendingMovie.popularity.toString(),
                style: TextStyle(
                    fontSize: 18,
                    color: Colors.black,
                    fontWeight: FontWeight.w400),
              ),
            ),
          ]))
        ],
      ),
    );
  }
}
