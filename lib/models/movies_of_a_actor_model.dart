class MoviesOfAActorModel {
  List<ActorsMovieModel> moviesOfAActor = [];

  MoviesOfAActorModel();
  MoviesOfAActorModel.fromMap(Map m) {
    (m['cast'] as List).forEach((element) {
      moviesOfAActor.add(ActorsMovieModel.fromMap(element));
    });
  }
}

class ActorsMovieModel {
  late String imagePath;
  late bool isAdult;
  late String overview;
  late String releaseDate;
  late int id;
  late String originalTitle;
  late String originalLanguage;
  late String title;
  late num popularity;
  late int voteCount;
  late num voteAverage;

  ActorsMovieModel();
  ActorsMovieModel.fromMap(Map m) {
    imagePath = m['poster_path'] ??
        'https://cdn.pixabay.com/photo/2013/07/13/10/07/man-156584_960_720.png';
    isAdult = m['adult'];
    overview = m['overview'];
    releaseDate = m['release_date'] ?? '1994-12-16';
    id = m['id'];
    originalTitle = m['original_title'];
    originalLanguage = m['original_language'];
    title = m['title'];
    popularity = m['popularity'];
    voteCount = m['vote_count'];
    voteAverage = m['vote_average'];
  }
}
