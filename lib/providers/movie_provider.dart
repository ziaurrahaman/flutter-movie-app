import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter_movie_app/models/trending_movie.dart';
import 'package:provider/provider.dart';

import 'package:http/http.dart' as http;

class MovieProvider extends ChangeNotifier {
  List<MovieResultModel> trendingMovies = [];
  List<MovieResultModel> popularMovies = [];
  List<MovieResultModel> topRatedMovies = [];
  List<MovieResultModel> upComingMovies = [];
  List<MovieResultModel> searchedMovies = [];
  MovieProvider() {
    getTrendingMovies();
    getPopularMovies();
    getTopRatedMovies();
    getUpComingMovies();
  }

  Future<List<MovieResultModel>> getTrendingMovies() async {
    var response = await http.get(Uri.parse(
        'https://api.themoviedb.org/3/trending/all/day?api_key=aa2d6ab45e973862944257270d91c01e'));

    var jsonData = jsonDecode(response.body);
    var trendingMovie = MovieModel.fromMap(jsonData);
    trendingMovies = trendingMovie.movies;
    notifyListeners();

    return trendingMovies;
  }

  Future<List<MovieResultModel>> getPopularMovies() async {
    var response = await http.get(Uri.parse(
        'https://api.themoviedb.org/3/movie/popular?api_key=aa2d6ab45e973862944257270d91c01e&language=en-US&page=1'));
    var jsonData = jsonDecode(response.body);
    var popularMovie = MovieModel.fromMap(jsonData);
    popularMovies = popularMovie.movies;
    notifyListeners();
    return popularMovies;
  }

  Future<List<MovieResultModel>> getTopRatedMovies() async {
    var response = await http.get(Uri.parse(
        'https://api.themoviedb.org/3/movie/top_rated?api_key=aa2d6ab45e973862944257270d91c01e&language=en-US&page=1'));
    var jsonData = jsonDecode(response.body);
    var topRatedMovie = MovieModel.fromMap(jsonData);
    topRatedMovies = topRatedMovie.movies;
    notifyListeners();
    return topRatedMovies;
  }

  Future<List<MovieResultModel>> getUpComingMovies() async {
    var response = await http.get(Uri.parse(
        'https://api.themoviedb.org/3/movie/upcoming?api_key=aa2d6ab45e973862944257270d91c01e&language=en-US&page=1'));
    var jsonData = jsonDecode(response.body);
    var upComingMovie = MovieModel.fromMap(jsonData);
    upComingMovies = upComingMovie.movies;
    notifyListeners();
    return upComingMovies;
  }

  Future<List<MovieResultModel>> getSearchedMovies(String str) async {
    var response = await http.get(Uri.parse(
        'https://api.themoviedb.org/3/search/movie?api_key=aa2d6ab45e973862944257270d91c01e&language=en-US&page=1&query=$str&include_adult=false'));
    var jsonData = jsonDecode(response.body);
    var serachedResult = MovieModel.fromMap(jsonData);
    searchedMovies = serachedResult.movies;
    notifyListeners();
    return searchedMovies;
  }
}
