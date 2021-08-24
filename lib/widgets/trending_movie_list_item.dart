import 'package:flutter/material.dart';
import 'package:flutter_movie_app/models/trending_movie.dart';
import 'package:flutter_movie_app/screens/movie_details_screen.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class MovieListItem extends StatelessWidget {
  late final MovieResultModel trendingMovie;

  MovieListItem({Key? key, required this.trendingMovie}) : super(key: key);

  // var convertedRelaease = DateTime.parse(trendingMovie.releaseDate);

  @override
  Widget build(BuildContext context) {
    final deviceHeight = MediaQuery.of(context).size.height;
    final deviceWidth = MediaQuery.of(context).size.width;
    DateTime releaseDateTime = DateTime.parse(trendingMovie.releaseDate);
    String forMatedDateTime =
        DateFormat('MMMM-dd-yyyy').format(releaseDateTime);
    // print('h ${deviceHeight * 0.011}');

    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => MovieDetailsScreen(
                      movies: trendingMovie,
                    )));
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
                // height: 190,
                // width: 160,
                height: deviceHeight * 0.25,
                width: deviceWidth * 0.41,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(
              height: deviceHeight * 0.011,
            ),
            Container(
              width: deviceWidth * 0.41,
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
              height: deviceHeight * 0.011,
            ),
            Text(
              (trendingMovie.releaseDate == '') ? '' : forMatedDateTime,
              style: GoogleFonts.openSans(color: Color(0xFF383942)),
            )
          ],
        ),
      ),
    );
  }
}
