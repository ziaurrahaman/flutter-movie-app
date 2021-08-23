import 'package:flutter/material.dart';
import 'package:flutter_movie_app/models/trending_movie.dart';
import 'package:flutter_movie_app/widgets/movie_details_screen.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class MovieListItem extends StatelessWidget {
  late final MovieResultModel trendingMovie;

  MovieListItem({Key? key, required this.trendingMovie}) : super(key: key);

  // var convertedRelaease = DateTime.parse(trendingMovie.releaseDate);

  @override
  Widget build(BuildContext context) {
    print(trendingMovie.releaseDate);
    var convertedRelaease = DateTime.parse(trendingMovie.releaseDate);
    var con = DateFormat('MMMM-dd-yyyy').format(convertedRelaease);

    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) =>
                    MovieDetailsScreen(trendingMovie: trendingMovie)));
      },
      child: Container(
        // height: ,
        margin: EdgeInsets.all(8),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Image.network(
                'http://image.tmdb.org/t/p/w500' + trendingMovie.imagePath,
                height: 190,
                width: 160,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(
              height: 8,
            ),
            Container(
              width: 160,
              child: Text(
                trendingMovie.title,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.start,
                style: GoogleFonts.openSans(
                  color: Colors.white,
                ),
              ),
            ),
            SizedBox(
              height: 8,
            ),
            Text(
              (trendingMovie.releaseDate == '') ? '' : con,
              style: GoogleFonts.openSans(color: Color(0xFF383942)),
            )
          ],
        ),
      ),
    );
  }
}
