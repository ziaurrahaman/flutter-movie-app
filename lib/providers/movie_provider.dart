import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter_movie_app/models/trending_movie.dart';
import 'package:provider/provider.dart';

import 'package:http/http.dart' as http;

class MovieProvider extends ChangeNotifier {
  late MovieModel trendingMovie = MovieModel();
  late MovieModel popularMovie = MovieModel();
  late MovieModel topRatedMovie = MovieModel();
  late MovieModel upComingMovie = MovieModel();
  MovieProvider() {
    getTrendingMovies();
    getPopularMovies();
    getTopRatedMovies();
    getUpComingMovies();
  }

  Future<MovieModel> getTrendingMovies() async {
    var response = await http.get(Uri.parse(
        'https://api.themoviedb.org/3/trending/all/day?api_key=aa2d6ab45e973862944257270d91c01e'));

    var jsonData = jsonDecode(response.body);
    trendingMovie = MovieModel.fromMap(jsonData);
    notifyListeners();

    return trendingMovie;
  }

  Future<MovieModel> getPopularMovies() async {
    var response = await http.get(Uri.parse(
        'https://api.themoviedb.org/3/movie/popular?api_key=aa2d6ab45e973862944257270d91c01e&language=en-US&page=1'));
    var jsonData = jsonDecode(response.body);
    popularMovie = MovieModel.fromMap(jsonData);
    notifyListeners();
    return popularMovie;
  }

  Future<MovieModel> getTopRatedMovies() async {
    var response = await http.get(Uri.parse(
        'https://api.themoviedb.org/3/movie/top_rated?api_key=aa2d6ab45e973862944257270d91c01e&language=en-US&page=1'));
    var jsonData = jsonDecode(response.body);
    topRatedMovie = MovieModel.fromMap(jsonData);
    notifyListeners();
    return topRatedMovie;
  }

  Future<MovieModel> getUpComingMovies() async {
    var response = await http.get(Uri.parse(
        'https://api.themoviedb.org/3/movie/upcoming?api_key=aa2d6ab45e973862944257270d91c01e&language=en-US&page=1'));
    var jsonData = jsonDecode(response.body);
    upComingMovie = MovieModel.fromMap(jsonData);
    notifyListeners();
    return upComingMovie;
  }
}
