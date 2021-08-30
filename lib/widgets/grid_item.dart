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
    final deviceHeight = MediaQuery.of(context).size.height;
    final deviceWidth = MediaQuery.of(context).size.width;
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
        // padding: EdgeInsets.all(deviceHeight * 0.4165),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(8)),
              child: (movies.imagePath ==
                      'https://media.comicbook.com/files/img/default-movie.png')
                  ? Image.network(
                      'https://media.comicbook.com/files/img/default-movie.png',
                      height: deviceHeight * 0.276,
                      width: deviceWidth * 0.458,
                      fit: BoxFit.fitWidth,
                    )
                  : Image.network(
                      'http://image.tmdb.org/t/p/w500' + movies.imagePath,
                      height: deviceHeight * 0.276,
                      width: deviceWidth * 0.458,
                      fit: BoxFit.fitWidth,
                    ),
            ),
            SizedBox(
              height: deviceHeight * 0.011,
            ),
            Container(
              width: deviceWidth * 0.458,
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
              height: deviceHeight * 0.011,
            ),
            Text(
              (movies.releaseDate == '') ? '' : forMatedDateTime,
              style: GoogleFonts.openSans(
                  color: Color(0xFF383942), fontSize: deviceHeight * 0.0185),
            )
          ],
        ),
      ),
    );
  }
}
