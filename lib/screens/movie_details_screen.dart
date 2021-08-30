import 'package:flutter/material.dart';
import 'package:flutter_movie_app/models/movie_details_model.dart';
import 'package:flutter_movie_app/models/trending_movie.dart';
import 'package:flutter_movie_app/providers/movie_provider.dart';
import 'package:flutter_movie_app/screens/cast_details_screen.dart';
import 'package:flutter_movie_app/widgets/trending_movie_list_item.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:readmore/readmore.dart';

class MovieDetailsScreen extends StatefulWidget {
  late final MovieResultModel movies;
  MovieDetailsScreen({Key? key, required this.movies}) : super(key: key);

  @override
  _MovieDetailsScreenState createState() => _MovieDetailsScreenState();
}

class _MovieDetailsScreenState extends State<MovieDetailsScreen> {
  // int itemCount = 5;
  // String rating = '';
  // MaterialColor color = Colors.grey;
  @override
  Widget build(BuildContext context) {
    final deviceHeight = MediaQuery.of(context).size.height;
    final deviceWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body:

          //  SingleChildScrollView(
          //   child: Column(
          //     children: [
          //       Container(
          //         height: 100,
          //         child: ListView.builder(
          //           scrollDirection: Axis.horizontal,
          //           shrinkWrap: true,
          //           itemBuilder: (context, index) => IconButton(
          //             icon: Icon(
          //               Icons.star,
          //               color: color,
          //             ),
          //             onPressed: () {
          //               setState(() {
          //                 color = Colors.amber;
          //                 itemCount = index + 1;
          //                 rating = (index + 1).toString();
          //               });
          //             },
          //           ),
          //           itemCount: itemCount,
          //         ),
          //       ),
          //       Center(
          //         child: Text(
          //           '$rating star given',
          //           style: TextStyle(
          //               color: Colors.black,
          //               fontSize: 24,
          //               fontWeight: FontWeight.bold),
          //         ),
          //       )
          //     ],
          //   ),
          // ),
          // body:
          FutureBuilder(
              future: context
                  .read<MovieProvider>()
                  .getMovieDetailsScreen(widget.movies.id),
              builder: (contxt, snapshot) {
                return (snapshot.connectionState == ConnectionState.waiting)
                    ? Center(
                        child: CircularProgressIndicator(
                          color: Theme.of(context).accentColor,
                        ),
                      )
                    : CustomScrollView(
                        slivers: [
                          SliverAppBar(
                            expandedHeight: deviceHeight * 0.5,
                            flexibleSpace: FlexibleSpaceBar(
                              title: Text(context
                                  .read<MovieProvider>()
                                  .movieDetails
                                  .title),
                              background: Image.network(
                                'http://image.tmdb.org/t/p/w500' +
                                    context
                                        .read<MovieProvider>()
                                        .movieDetails
                                        .imagePath,
                                fit: BoxFit.cover,
                                // width: 800,
                              ),
                            ),
                          ),
                          SliverList(
                            delegate: SliverChildListDelegate(<Widget>[
                              SizedBox(
                                height: deviceHeight * 0.011,
                              ),
                              SingleChildScrollView(
                                  scrollDirection: Axis.horizontal,
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 16),
                                    child: Row(
                                      children: [
                                        Container(
                                          margin: EdgeInsets.only(right: 8),
                                          child: Transform(
                                              transform: Matrix4.identity()
                                                ..scale(0.9),
                                              child: Chip(
                                                label: Text(
                                                  (context
                                                              .read<
                                                                  MovieProvider>()
                                                              .movieDetails
                                                              .isAdult ==
                                                          true)
                                                      ? '18 +'
                                                      : '18 -',
                                                  style: TextStyle(
                                                      color: Colors.white),
                                                ),
                                                backgroundColor:
                                                    Theme.of(context)
                                                        .accentColor,
                                              )),
                                        ),
                                        ...context
                                            .read<MovieProvider>()
                                            .movieDetails
                                            .categories
                                            .map((e) => Container(
                                                  margin: EdgeInsets.symmetric(
                                                      horizontal: 8),
                                                  child: Transform(
                                                      transform:
                                                          Matrix4.identity()
                                                            ..scale(0.9),
                                                      child: Chip(
                                                        label: Text(
                                                          e.name,
                                                          style: TextStyle(
                                                              color:
                                                                  Colors.white),
                                                        ),
                                                        backgroundColor:
                                                            Theme.of(context)
                                                                .accentColor,
                                                      )),
                                                ))
                                            .toList(),
                                        Container(
                                          margin: EdgeInsets.symmetric(
                                              horizontal: 8),
                                          child: Transform(
                                              transform: Matrix4.identity()
                                                ..scale(0.9),
                                              child: Chip(
                                                avatar: Icon(
                                                  Icons.star,
                                                  color: Colors.amber,
                                                  size: 18,
                                                ),
                                                label: Text(
                                                  context
                                                      .read<MovieProvider>()
                                                      .movieDetails
                                                      .voteAverage
                                                      .toString(),
                                                  style: TextStyle(
                                                      color: Colors.white),
                                                ),
                                                backgroundColor:
                                                    Theme.of(context)
                                                        .accentColor,
                                              )),
                                        )
                                      ],
                                    ),
                                  )),
                              Container(
                                margin: EdgeInsets.only(top: 24, left: 16),
                                child: Text(
                                    context
                                        .read<MovieProvider>()
                                        .movieDetails
                                        .title,
                                    style: GoogleFonts.raleway(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    )),
                              ),
                              SizedBox(
                                height: 16,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 16.0),
                                child: ReadMoreText(
                                  context
                                      .read<MovieProvider>()
                                      .movieDetails
                                      .overView,
                                  style:
                                      GoogleFonts.openSans(color: Colors.white),
                                  trimLines: 2,
                                  trimCollapsedText: 'See More',
                                  trimExpandedText: 'Seee Less',
                                  lessStyle: TextStyle(color: Colors.red),
                                  moreStyle: TextStyle(color: Colors.red),
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(top: 24, left: 16),
                                child: Text('Actor',
                                    style: GoogleFonts.raleway(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    )),
                              ),
                              FutureBuilder(
                                  future: context
                                      .read<MovieProvider>()
                                      .getMovieCastings(widget.movies.id),
                                  builder: (context, snapshot) {
                                    return (snapshot.connectionState ==
                                            ConnectionState.waiting)
                                        ? Center(
                                            child: CircularProgressIndicator(
                                              color:
                                                  Theme.of(context).accentColor,
                                            ),
                                          )
                                        : Container(
                                            margin: EdgeInsets.only(
                                                top: 24, left: 8),
                                            height: deviceHeight * 0.1925,
                                            child: ListView.builder(
                                              shrinkWrap: true,
                                              scrollDirection: Axis.horizontal,
                                              itemBuilder: (context, index) =>
                                                  Container(
                                                margin: EdgeInsets.all(
                                                    deviceHeight * 0.011),
                                                child: Column(
                                                  children: [
                                                    GestureDetector(
                                                      onTap: () {
                                                        Navigator.of(context).push(MaterialPageRoute(
                                                            builder: (context) =>
                                                                CastDetailsScreen(
                                                                    castId: context
                                                                        .read<
                                                                            MovieProvider>()
                                                                        .creditModel
                                                                        .casts[
                                                                            index]
                                                                        .id)));
                                                      },
                                                      child: ClipRRect(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(16),
                                                        child: (context
                                                                    .read<
                                                                        MovieProvider>()
                                                                    .creditModel
                                                                    .casts[
                                                                        index]
                                                                    .imagePath ==
                                                                'https://cdn.pixabay.com/photo/2013/07/13/10/07/man-156584_960_720.png')
                                                            ? Image.network(
                                                                'https://cdn.pixabay.com/photo/2013/07/13/10/07/man-156584_960_720.png',
                                                                height:
                                                                    deviceHeight *
                                                                        0.132,
                                                                width:
                                                                    deviceHeight *
                                                                        0.106,
                                                                fit: BoxFit
                                                                    .cover)
                                                            : Image.network(
                                                                'http://image.tmdb.org/t/p/w500' +
                                                                    context
                                                                        .read<
                                                                            MovieProvider>()
                                                                        .creditModel
                                                                        .casts[
                                                                            index]
                                                                        .imagePath,
                                                                // height: 190,
                                                                // width: 160,
                                                                height:
                                                                    deviceHeight *
                                                                        0.132,
                                                                width:
                                                                    deviceHeight *
                                                                        0.106,
                                                                fit: BoxFit
                                                                    .cover,
                                                              ),
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      height:
                                                          deviceHeight * 0.011,
                                                    ),
                                                    Container(
                                                      width:
                                                          deviceHeight * 0.106,
                                                      child: Text(
                                                        context
                                                            .read<
                                                                MovieProvider>()
                                                            .creditModel
                                                            .casts[index]
                                                            .name,
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                        textAlign:
                                                            TextAlign.start,
                                                        style: GoogleFonts
                                                            .openSans(
                                                                color: Colors
                                                                    .white,
                                                                fontSize:
                                                                    deviceHeight *
                                                                        0.0185),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              itemCount: context
                                                  .read<MovieProvider>()
                                                  .creditModel
                                                  .casts
                                                  .length,
                                            ),
                                          );
                                  }),
                              Container(
                                margin: EdgeInsets.only(top: 24, left: 16),
                                child: Text('Rcommended Movies',
                                    style: GoogleFonts.raleway(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    )),
                              ),
                              FutureBuilder(
                                  future: context
                                      .read<MovieProvider>()
                                      .getRecommendedMovies(widget.movies.id),
                                  builder: (context, snapshot) {
                                    return (snapshot.connectionState ==
                                            ConnectionState.waiting)
                                        ? Center(
                                            child: CircularProgressIndicator(
                                            color:
                                                Theme.of(context).accentColor,
                                          ))
                                        : Container(
                                            margin: EdgeInsets.only(
                                                left: 8, top: 24),
                                            height: deviceHeight * 0.3533,
                                            child: ListView.builder(
                                              itemBuilder: (context, index) =>
                                                  MovieListItem(
                                                trendingMovie: context
                                                    .read<MovieProvider>()
                                                    .recommendedMovies[index],
                                              ),
                                              itemCount: context
                                                  .read<MovieProvider>()
                                                  .recommendedMovies
                                                  .length,
                                              scrollDirection: Axis.horizontal,
                                              shrinkWrap: true,
                                            ),
                                          );
                                  })
                            ]),
                          )
                        ],
                      );
              }),
    );
  }
}
