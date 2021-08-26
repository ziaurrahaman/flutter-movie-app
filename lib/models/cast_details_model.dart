class CastDetailsModel {
  late final String biography;
  late final String name;
  late final double popularity;
  late final String profileImage;
  late final String birthDay;
  late final String deathDay;
  late final String department;
  late final String placeOfBirth;

  CastDetailsModel();

  CastDetailsModel.fromMap(Map m) {
    biography = m['biography'];
    name = m['name'];
    popularity = m['popularity'];
    profileImage = m['profile_path'] ??
        'https://cdn.pixabay.com/photo/2013/07/13/10/07/man-156584_960_720.png';
    birthDay = m['birthday'];
    deathDay = m['deathday'] ?? 'Alive';
    department = m['known_for_department'];
    placeOfBirth = m['place_of_birth'];
  }
}
