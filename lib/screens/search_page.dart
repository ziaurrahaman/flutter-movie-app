import 'package:flutter/material.dart';
import 'package:flutter_movie_app/models/trending_movie.dart';
import 'package:flutter_movie_app/providers/movie_provider.dart';
import 'package:flutter_movie_app/widgets/grid_item.dart';
import 'package:flutter_movie_app/screens/movie_details_screen.dart';
import 'package:flutter_movie_app/widgets/trending_movie_list_item.dart';
// import 'package:flutter_movie_app/providers/movie_provider.dart';
// import 'dart:convert';
// import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  TextEditingController _searchTextEdittingController = TextEditingController();
  String _searchText = '';
  // List<MovieResultModel> searchedMovies = [];

  // Future<List<MovieResultModel>> getSearchedMovies(String str) async {
  //   var response = await http.get(Uri.parse(
  //       'https://api.themoviedb.org/3/search/movie?api_key=aa2d6ab45e973862944257270d91c01e&language=en-US&page=1&query=$str&include_adult=false'));
  //   var jsonData = jsonDecode(response.body);
  //   var serachedResult = MovieModel.fromMap(jsonData);
  //   if (str == '') {
  //     setState(() {
  //       searchedMovies = [];
  //     });
  //   }

  //   setState(() {
  //     searchedMovies = serachedResult.movies;
  //   });

  //   return serachedResult.movies;
  // }

  @override
  Widget build(BuildContext context) {
    final seachedMovies = context.watch<MovieProvider>().searchedMovies;
    final deviceHeight = MediaQuery.of(context).size.height;
    final deviceWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
          title: TextFormField(
        textCapitalization: TextCapitalization.sentences,
        style: TextStyle(fontSize: 18, color: Colors.white),
        controller: _searchTextEdittingController,
        decoration: InputDecoration(
            hintText: 'Search here..',
            hintStyle: TextStyle(
              color: Colors.white54,
            ),
            border: InputBorder.none,
            focusedBorder: InputBorder.none,
            // enabledBorder: UnderlineInputBorder(
            //     borderSide: BorderSide(color: Colors.white)),
            // focusedBorder: UnderlineInputBorder(
            //     borderSide: BorderSide(color: Colors.white))
            // prefixIcon: Icon(
            //   Icons.search,
            //   color: Colors.white,
            // )
            suffixIcon: IconButton(
              icon: Icon(
                Icons.clear,
                color: Colors.white,
              ),
              onPressed: () {
                _searchTextEdittingController.clear();
              },
            )),
        onChanged: context.read<MovieProvider>().getSearchedMovies,
        onFieldSubmitted: context.read<MovieProvider>().getSearchedMovies,
      )),
      backgroundColor: Theme.of(context).primaryColor,
      body: seachedMovies.length == 0
          ? Center(
              child: CircularProgressIndicator(
                color: Colors.grey,
              ),
            )
          : Container(
              margin: EdgeInsets.only(left: 8, right: 8, top: 24, bottom: 8),
              child: GridView.builder(
                  // shrinkWrap: true,

                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      childAspectRatio: (deviceWidth * 0.458).ceil() /
                          (deviceHeight * 0.350).ceil(),
                      crossAxisCount: 2,
                      mainAxisSpacing: 0),
                  itemBuilder: (context, index) => GridItem(
                        movies: seachedMovies[index],
                      ),
                  itemCount: seachedMovies.length),
            ),
    );
  }
}
