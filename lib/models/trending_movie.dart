class MovieModel {
  late int pageNumber;

  late int totalPages;
  late int totalResult;

  List<MovieResultModel> movies = [];

  MovieModel();

  MovieModel.fromMap(Map m) {
    (m['results'] as List)
        .forEach((i) => movies.add(MovieResultModel.fromMap(i)));

    pageNumber = m['page'];

    totalPages = m['total_pages'];
    totalResult = m['total_results'];
  }
}

class MovieResultModel {
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

  MovieResultModel.fromMap(Map m) {
    imagePath = m['poster_path'] ??
        'https://media.comicbook.com/files/img/default-movie.png';
    isAdult = m['adult'] ?? false;
    overview = m['overview'];
    releaseDate = m['release_date'] ?? m['first_air_date'] ?? '2014-5-6';
    id = m['id'];
    originalTitle = m['original_title'] ?? '';
    originalLanguage = m['original_language'];
    title = m['title'] ?? '';
    popularity = m['popularity'];
    voteCount = m['vote_count'];
    voteAverage = m['vote_average'];
  }
}
