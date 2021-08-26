import 'package:flutter/material.dart';
import 'package:flutter_movie_app/models/trending_movie.dart';
import 'package:flutter_movie_app/screens/movie_details_screen.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class GridItem extends StatelessWidget {
  // const GridItem({ Key? key }) : super(key: key);

  late final MovieResultModel movies;

  GridItem({Key? key, required this.movies}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    DateTime releaseDateTime = DateTime.parse(movies.releaseDate);
    String forMatedDateTime =
        DateFormat('MMMM-dd-yyyy').format(releaseDateTime);
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

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(8)),
              child: (movies.imagePath ==
                      'https://media.comicbook.com/files/img/default-movie.png')
                  ? Image.network(
                      'https://media.comicbook.com/files/img/default-movie.png',
                      height: 210,
                      width: 180,
                      fit: BoxFit.fitWidth,
                    )
                  : Image.network(
                      'http://image.tmdb.org/t/p/w500' + movies.imagePath,
                      height: 210,
                      width: 180,
                      fit: BoxFit.fitWidth,
                    ),
            ),
            SizedBox(
              height: 8,
            ),
            Container(
              width: 180,
              child: Text(
                movies.title,
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
              (movies.releaseDate == '') ? '' : forMatedDateTime,
              style: GoogleFonts.openSans(color: Color(0xFF383942)),
            )
          ],
        ),
      ),
    );
  }
}
