import 'package:flutter/material.dart';
import 'package:flutter_movie_app/models/trending_movie.dart';
import 'package:flutter_movie_app/screens/movie_details_screen.dart';

class GridItem extends StatelessWidget {
  // const GridItem({ Key? key }) : super(key: key);

  late final MovieResultModel movies;

  GridItem({Key? key, required this.movies}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => MovieDetailsScreen(movies: movies)));
      },
      child: Container(
        // width: 180,
        // height: ,
        padding: EdgeInsets.all(8),
        child: Card(
          child: Column(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(8)),
                child: Image.network(
                  'http://image.tmdb.org/t/p/w500' + movies.imagePath,
                  height: 220,
                  width: 180,
                  fit: BoxFit.fitWidth,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
