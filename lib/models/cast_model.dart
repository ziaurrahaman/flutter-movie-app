import 'package:flutter_movie_app/models/movie_details_model.dart';

class CreditModel {
  List<CastModel> casts = [];

  CreditModel();
  CreditModel.fromMap(Map m) {
    (m['cast'] as List).forEach((element) {
      casts.add(CastModel.fromMap(element));
    });
  }
}

class CastModel {
  late final int id;
  late final name;
  late final imagePath;

  CastModel();
  CastModel.fromMap(Map m) {
    id = m['id'];
    name = m['name'] ?? '';
    imagePath = m['profile_path'] ??
        'https://cdn.pixabay.com/photo/2013/07/13/10/07/man-156584_960_720.png';
  }
}
