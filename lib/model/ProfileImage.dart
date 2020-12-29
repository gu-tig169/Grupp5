class ProfileImage {
  String _title;
  String _path;

  ProfileImage(this._title, this._path);

  static List<ProfileImage> images = [
    ProfileImage('Lisa', 'assets/blondegirl.png'),
    ProfileImage('Britt', 'assets/womanwithglasses.png'),
    ProfileImage('Ronald', 'assets/manwithhat.png'),
    ProfileImage('Lukas', 'assets/blondehairman.png'),
    ProfileImage('Jack', 'assets/manwitheyepatch.png'),
    ProfileImage('Dennis', 'assets/redhairman.png'),
    ProfileImage('Logo','assets/logoholic.png'),
  ];

  String get title {
    return _title;
  }

  String get path {
    return _path;
  }
}
