import 'package:flutter/material.dart';
import 'package:flutter_movie_app/providers/movie_provider.dart';
import 'package:flutter_movie_app/widgets/movies_of_an_actor_list_item.dart';
import 'package:flutter_movie_app/widgets/trending_movie_list_item.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:readmore/readmore.dart';

class CastDetailsScreen extends StatelessWidget {
  late final int castId;
  CastDetailsScreen({Key? key, required this.castId}) : super(key: key);
  double rating = 0.0;
  MovieProvider castDetailsProvider = MovieProvider();
  int index = 0;
  @override
  Widget build(BuildContext context) {
    final deviceHeight = MediaQuery.of(context).size.height;
    final deviceWidth = MediaQuery.of(context).size.width;
    return Scaffold(
        appBar: AppBar(),
        backgroundColor: Theme.of(context).primaryColor,
        body: FutureBuilder(
          future: context.read<MovieProvider>().getCastDetails(castId),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              rating = context.read<MovieProvider>().actorDetails.popularity;
              castDetailsProvider = context.read<MovieProvider>();

              if (rating <= 5.0) {
                rating = rating;
              }
              if (rating <= 10) {
                if (rating > 5) {
                  rating = (rating * 5) / 10;
                }
              }
              if (rating > 10) {
                rating = (rating * 5) / 20;
              }
            }

            return (snapshot.connectionState == ConnectionState.waiting)
                ? Center(
                    child: CircularProgressIndicator(
                      color: Theme.of(context).accentColor,
                    ),
                  )
                : SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(16),
                                child: (castDetailsProvider
                                            .actorDetails.profileImage ==
                                        'https://cdn.pixabay.com/photo/2013/07/13/10/07/man-156584_960_720.png')
                                    ? Image.network(
                                        'https://cdn.pixabay.com/photo/2013/07/13/10/07/man-156584_960_720.png',
                                        height: deviceHeight * 0.316,
                                        width: deviceHeight * 0.184,
                                        fit: BoxFit.cover,
                                      )
                                    : Image.network(
                                        'http://image.tmdb.org/t/p/w500' +
                                            context
                                                .read<MovieProvider>()
                                                .actorDetails
                                                .profileImage,
                                        height: deviceHeight * 0.316,
                                        width: deviceHeight * 0.184,
                                        fit: BoxFit.cover,
                                      ),
                              ),
                              SizedBox(
                                width: 16,
                              ),
                              Expanded(
                                // height: 240,
                                child: SingleChildScrollView(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(top: 24.0),
                                        child: Text(
                                          context
                                              .read<MovieProvider>()
                                              .actorDetails
                                              .name,
                                          style: GoogleFonts.raleway(
                                              color: Colors.white,
                                              fontSize: 32,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 16,
                                      ),
                                      Row(
                                        children: [
                                          RatingBarIndicator(
                                            itemSize: deviceWidth * 0.051,
                                            unratedColor:
                                                Theme.of(context).accentColor,
                                            itemCount: 5,
                                            rating: rating,
                                            itemBuilder: (context, i) {
                                              index = i;
                                              return Icon(
                                                Icons.star,
                                                color: Colors.amber,
                                              );
                                            },
                                            itemPadding: (index == 0)
                                                ? EdgeInsets.only(right: 8)
                                                : EdgeInsets.symmetric(
                                                    horizontal: 8),
                                          ),
                                          Text(
                                            castDetailsProvider
                                                .actorDetails.popularity
                                                .toString(),
                                            style: TextStyle(
                                                color: Colors.amber,
                                                fontSize: deviceWidth * 0.0358),
                                          )
                                        ],
                                      ),
                                      SizedBox(
                                        height: 16,
                                      ),
                                      RichText(
                                          text: TextSpan(
                                              text: 'Place of Birth :  ',
                                              style: GoogleFonts.raleway(
                                                  color: Theme.of(context)
                                                      .accentColor,
                                                  fontWeight: FontWeight.bold),
                                              children: <TextSpan>[
                                            TextSpan(
                                                text: castDetailsProvider
                                                    .actorDetails.placeOfBirth,
                                                style: GoogleFonts.raleway(
                                                    color: Theme.of(context)
                                                        .accentColor))
                                          ])),
                                      SizedBox(
                                        height: 8,
                                      ),
                                      RichText(
                                          text: TextSpan(
                                              text: 'Known For Department :  ',
                                              style: GoogleFonts.raleway(
                                                  color: Theme.of(context)
                                                      .accentColor,
                                                  fontWeight: FontWeight.bold),
                                              children: <TextSpan>[
                                            TextSpan(
                                                text: castDetailsProvider
                                                    .actorDetails.department,
                                                style: GoogleFonts.raleway(
                                                    color: Theme.of(context)
                                                        .accentColor))
                                          ])),
                                      SizedBox(
                                        height: 8,
                                      ),
                                      RichText(
                                          text: TextSpan(
                                              text: 'Date of Birth :  ',
                                              style: GoogleFonts.raleway(
                                                  color: Theme.of(context)
                                                      .accentColor,
                                                  fontWeight: FontWeight.bold),
                                              children: <TextSpan>[
                                            TextSpan(
                                                text: castDetailsProvider
                                                    .actorDetails.birthDay,
                                                style: GoogleFonts.raleway(
                                                    color: Theme.of(context)
                                                        .accentColor))
                                          ])),
                                      SizedBox(
                                        height: 8,
                                      ),
                                      RichText(
                                          text: TextSpan(
                                              text: 'Date of Death :  ',
                                              style: GoogleFonts.raleway(
                                                  color: Theme.of(context)
                                                      .accentColor,
                                                  fontWeight: FontWeight.bold),
                                              children: <TextSpan>[
                                            TextSpan(
                                                text: castDetailsProvider
                                                    .actorDetails.deathDay,
                                                style: GoogleFonts.raleway(
                                                    color: Theme.of(context)
                                                        .accentColor))
                                          ])),
                                      SizedBox(
                                        height: 32,
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),

                        SizedBox(
                          height: 8,
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 24, left: 16),
                          child: Text('Biography',
                              style: GoogleFonts.raleway(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              )),
                        ),
                        // SizedBox(height: 16,),
                        Container(
                          margin: EdgeInsets.all(16),
                          // height: 160,
                          child: ReadMoreText(
                            castDetailsProvider.actorDetails.biography,
                            trimLines: 4,
                            trimMode: TrimMode.Line,
                            trimCollapsedText: 'Show more',
                            trimExpandedText: ' show less',
                            colorClickableText: Colors.pink,
                            //   delimiterStyle: TextStyle(color: Colors.rd),
                            moreStyle: TextStyle(color: Colors.red),
                            lessStyle: TextStyle(color: Colors.red),
                          ),

                          //  RichText(
                          //   maxLines: 6,
                          //   text: TextSpan(
                          //       text: castDetailsProvider
                          //           .actorDetails.biography,
                          //       style:
                          //           GoogleFonts.openSans(color: Colors.white),
                          //       children: <TextSpan>[
                          //         TextSpan(
                          //             text: '...',
                          //             style: TextStyle(color: Colors.white)),
                          //         TextSpan(
                          //             text: 'See More',
                          //             style: GoogleFonts.openSans(
                          //                 color: Colors.white))
                          //       ]),
                          // )
                          // Text(
                          //   castDetailsProvider.actorDetails.biography,
                          //   style: GoogleFonts.openSans(color: Colors.white),
                          //   maxLines: 8,
                          //   overflow: TextOverflow.ellipsis,
                          // ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 24, left: 16),
                          child: Text('Movies',
                              style: GoogleFonts.raleway(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              )),
                        ),

                        FutureBuilder(
                            future: context
                                .read<MovieProvider>()
                                .getMoviesOfAnActor(castId),
                            builder: (context, snapshot) {
                              return (snapshot.connectionState ==
                                      ConnectionState.waiting)
                                  ? Center(
                                      child: CircularProgressIndicator(
                                      color: Theme.of(context).accentColor,
                                    ))
                                  : Container(
                                      margin: EdgeInsets.only(left: 8, top: 24),
                                      height: deviceHeight * 0.3533,
                                      child: ListView.builder(
                                        itemBuilder: (context, index) =>
                                            MoviesOfAnActorListItem(
                                          actorsMovieModel: context
                                              .read<MovieProvider>()
                                              .moviesOfAnActor[index],
                                        ),
                                        itemCount: context
                                            .read<MovieProvider>()
                                            .moviesOfAnActor
                                            .length,
                                        scrollDirection: Axis.horizontal,
                                        shrinkWrap: true,
                                      ),
                                    );
                            })
                      ],
                    ),
                  );
          },
        ));
  }
}
