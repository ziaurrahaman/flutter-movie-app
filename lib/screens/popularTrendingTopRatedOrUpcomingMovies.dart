import 'package:flutter/material.dart';
import 'package:flutter_movie_app/providers/movie_provider.dart';
import 'package:flutter_movie_app/widgets/grid_item.dart';
import 'package:provider/provider.dart';

class CategoryScreen extends StatefulWidget {
  late final String categoryName;
  CategoryScreen({Key? key, required this.categoryName}) : super(key: key);

  @override
  _CategoryScreenState createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  @override
  Widget build(BuildContext context) {
    final trendingMovies = context.watch<MovieProvider>().trendingMovies;
    final popularMovies = context.watch<MovieProvider>().popularMovies;
    final topRatedMovies = context.watch<MovieProvider>().topRatedMovies;
    final upComingMovies = context.watch<MovieProvider>().upComingMovies;

    return Scaffold(
      appBar: AppBar(title: Text('${widget.categoryName}')),
      body: GridView.builder(
        // shrinkWrap: true,

        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            childAspectRatio: 180 / 230, crossAxisCount: 2, mainAxisSpacing: 0),
        itemBuilder: (context, index) => GridItem(
          movies: (widget.categoryName == 'Trending Movies')
              ? trendingMovies[index]
              : (widget.categoryName == 'Popular Movies')
                  ? popularMovies[index]
                  : (widget.categoryName == 'Top Rated Movies')
                      ? topRatedMovies[index]
                      : upComingMovies[index],
        ),
        itemCount: (widget.categoryName == 'Trending Movies')
            ? trendingMovies.length
            : (widget.categoryName == 'Popular Movies')
                ? popularMovies.length
                : (widget.categoryName == 'Top Rated Movies')
                    ? topRatedMovies.length
                    : upComingMovies.length,
      ),
    );
    ;
  }
}
