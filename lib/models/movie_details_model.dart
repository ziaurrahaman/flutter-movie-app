class MovieDetailsModel {
  late final bool isAdult;
  late final double voteAverage;
  late final String title;
  late final String overView;
  late final String imagePath;

  List<Categories> categories = [];
  MovieDetailsModel();

  MovieDetailsModel.fromMap(Map m) {
    imagePath = m['backdrop_path'];
    isAdult = m['adult'];
    voteAverage = m['vote_average'];
    title = m['title'];
    overView = m['overview'];
    (m['genres'] as List)
        .forEach((element) => categories.add(Categories.fromMap(element)));
  }
}

class Categories {
  late final int id;
  late final String name;

  Categories();

  Categories.fromMap(Map m) {
    id = m['id'];
    name = m['name'];
  }
}
