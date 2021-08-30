import 'package:flutter/material.dart';
import 'package:flutter_movie_app/providers/movie_provider.dart';
import 'package:flutter_movie_app/screens/popularTrendingTopRatedOrUpcomingMovies.dart';
import 'package:flutter_movie_app/screens/search_page.dart';
import 'package:flutter_movie_app/widgets/trending_movie_list_item.dart';
import 'package:provider/provider.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final deviceHeight = MediaQuery.of(context).size.height;
    final deviceWidth = MediaQuery.of(context).size.width;
    // print('measure ${deviceHeight * 0.3433}');
    final trendingMovies = context.watch<MovieProvider>().trendingMovies;
    final popularMovies = context.watch<MovieProvider>().popularMovies;
    final topRatedMovies = context.watch<MovieProvider>().topRatedMovies;
    final upComingMovies = context.watch<MovieProvider>().upComingMovies;

    return Scaffold(
        // drawer: Drawer(
        //     child: ListView(
        //   children: [
        //     DrawerHeader(
        //       child: Text(
        //         'Flutter Movie App',
        //         style: TextStyle(
        //             color: Colors.white,
        //             fontWeight: FontWeight.bold,
        //             fontSize: 32),
        //       ),
        //       decoration: BoxDecoration(color: Colors.blue),
        //     ),
        //     ListTile(
        //       title: Text(
        //         'Trending Movies',
        //         style: TextStyle(
        //             fontWeight: FontWeight.bold,
        //             color: Colors.black,
        //             fontSize: 16),
        //       ),
        //       onTap: () {
        //         Navigator.of(context).pop();
        //         Navigator.of(context).push(MaterialPageRoute(
        //             builder: (context) =>
        //                 CategoryScreen(categoryName: 'Trending Movies')));
        //         // Navigator.of(context).pop();
        //       },
        //     ),
        //     ListTile(
        //       title: Text(
        //         'Popular Movies',
        //         style: TextStyle(
        //             fontWeight: FontWeight.bold,
        //             color: Colors.black,
        //             fontSize: 16),
        //       ),
        //       onTap: () {
        //         Navigator.of(context).pop();
        //         Navigator.of(context).push(MaterialPageRoute(
        //             builder: (context) =>
        //                 CategoryScreen(categoryName: 'Popular Movies')));
        //         // Navigator.of(context).pop();
        //       },
        //     ),
        //     ListTile(
        //       title: Text(
        //         'Top Rated Movies',
        //         style: TextStyle(
        //             fontWeight: FontWeight.bold,
        //             color: Colors.black,
        //             fontSize: 16),
        //       ),
        //       onTap: () {
        //         Navigator.of(context).pop();
        //         Navigator.of(context).push(MaterialPageRoute(
        //             builder: (context) =>
        //                 CategoryScreen(categoryName: 'Top Rated Movies')));
        //         // Navigator.of(context).pop();
        //       },
        //     ),
        //     ListTile(
        //       title: Text(
        //         'Upcoming Movies',
        //         style: TextStyle(
        //             fontWeight: FontWeight.bold,
        //             color: Colors.black,
        //             fontSize: 16),
        //       ),
        //       onTap: () {
        //         Navigator.of(context).pop();
        //         Navigator.of(context).push(MaterialPageRoute(
        //             builder: (context) =>
        //                 CategoryScreen(categoryName: 'Upcoming Movies')));
        //         // Navigator.of(context).pop();
        //       },
        //     ),
        //   ],
        // )),
        appBar: AppBar(
          title: RichText(
              text: TextSpan(
                  text: 'Mov',
                  style: GoogleFonts.raleway(color: Colors.white, fontSize: 28),
                  children: <TextSpan>[
                TextSpan(
                    text: 've',
                    style: GoogleFonts.raleway(
                        color: Color(0xFFC81D39), fontSize: 28))
              ])),
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => SearchPage()));
                },
                icon: Icon(
                  Icons.search,
                  color: Colors.white,
                ))
          ],
        ),
        body: Container(
          decoration: BoxDecoration(color: Color(0xFF171821)),
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 24,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Trending Movies',
                    style: GoogleFonts.openSans(
                        fontSize: 20,
                        fontWeight: FontWeight.w300,
                        color: Colors.white),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 8),
                  height: deviceHeight * 0.3443,
                  child: ListView.builder(
                    itemBuilder: (context, index) => MovieListItem(
                      trendingMovie: trendingMovies[index],
                    ),
                    itemCount: trendingMovies.length,
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Popular Movies',
                    style: GoogleFonts.openSans(
                        fontSize: 20,
                        fontWeight: FontWeight.w300,
                        color: Colors.white),
                  ),
                ),
                Container(
                  height: deviceHeight * 0.3533,
                  margin: EdgeInsets.only(left: 8),
                  child: ListView.builder(
                    itemBuilder: (context, index) => MovieListItem(
                      trendingMovie: popularMovies[index],
                    ),
                    itemCount: popularMovies.length,
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'TopRated Movies',
                    style: GoogleFonts.openSans(
                        fontSize: 20,
                        fontWeight: FontWeight.w300,
                        color: Colors.white),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 8),
                  height: deviceHeight * 0.3533,
                  child: ListView.builder(
                    itemBuilder: (context, index) => MovieListItem(
                      trendingMovie: topRatedMovies[index],
                    ),
                    itemCount: topRatedMovies.length,
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Upcoming Movies',
                    style: GoogleFonts.openSans(
                        fontSize: 20,
                        fontWeight: FontWeight.w300,
                        color: Colors.white),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 8),
                  height: deviceHeight * 0.3533,
                  child: ListView.builder(
                    itemBuilder: (context, index) => MovieListItem(
                      trendingMovie: upComingMovies[index],
                    ),
                    itemCount: upComingMovies.length,
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
