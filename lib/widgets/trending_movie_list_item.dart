import 'package:flutter/material.dart';
import 'package:flutter_movie_app/models/trending_movie.dart';
import 'package:flutter_movie_app/widgets/movie_details_screen.dart';

class MovieListItem extends StatelessWidget {
  late final MovieResultModel trendingMovie;

  MovieListItem({Key? key, required this.trendingMovie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) =>
                    MovieDetailsScreen(trendingMovie: trendingMovie)));
      },
      child: Container(
        width: 160,
        // height: ,
        padding: EdgeInsets.all(8),
        child: Card(
          child: Column(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(8), topRight: Radius.circular(8)),
                child: Image.network(
                  'http://image.tmdb.org/t/p/w500' + trendingMovie.imagePath,
                  height: 200,
                  width: 160,
                  fit: BoxFit.contain,
                ),
              ),
              SizedBox(
                height: 16,
              ),
              Text(
                trendingMovie.title,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.start,
              )
            ],
          ),
        ),
      ),
    );
  }
}
