import 'package:flutter/material.dart';
import 'package:flutter_movie_app/models/trending_movie.dart';
import 'package:flutter_movie_app/widgets/movie_details_screen.dart';
import 'package:flutter_movie_app/widgets/trending_movie_list_item.dart';
// import 'package:flutter_movie_app/providers/movie_provider.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  TextEditingController _searchTextEdittingController = TextEditingController();
  String _searchText = '';
  List<MovieResultModel> searchedMovies = [];

  Future<List<MovieResultModel>> getSearchedMovies(String str) async {
    var response = await http.get(Uri.parse(
        'https://api.themoviedb.org/3/search/movie?api_key=aa2d6ab45e973862944257270d91c01e&language=en-US&page=1&query=$str&include_adult=false'));
    var jsonData = jsonDecode(response.body);
    var serachedResult = MovieModel.fromMap(jsonData);
    if (str == '') {
      setState(() {
        searchedMovies = [];
      });
    }

    setState(() {
      searchedMovies = serachedResult.movies;
    });

    return serachedResult.movies;
  }

  @override
  Widget build(BuildContext context) {
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
            enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.white)),
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
        onChanged: getSearchedMovies,
        onFieldSubmitted: getSearchedMovies,
      )),
      body: searchedMovies.length == 0
          ? Center(
              child: CircularProgressIndicator(
                color: Colors.grey,
              ),
            )
          : GridView.builder(
              // shrinkWrap: true,

              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  childAspectRatio: 180 / 230,
                  crossAxisCount: 2,
                  mainAxisSpacing: 0),
              itemBuilder: (context, index) => GridItem(
                    searchedMovies: searchedMovies[index],
                  ),
              itemCount: searchedMovies.length),
    );
  }
}

class GridItem extends StatelessWidget {
  // const GridItem({ Key? key }) : super(key: key);

  late final MovieResultModel searchedMovies;

  GridItem({Key? key, required this.searchedMovies}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) =>
                    MovieDetailsScreen(trendingMovie: searchedMovies)));
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
                  'http://image.tmdb.org/t/p/w500' + searchedMovies.imagePath,
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
