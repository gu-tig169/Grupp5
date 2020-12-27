class Category {
  String _category;
  int _categorypath;

  Category(this._category, this._categorypath);

  static List<Category> categories = [
    Category('General Knowledge', 9),
    Category('Books', 10),
    Category('Film', 11),
    Category('Music', 12),
    Category('Musicals', 13),
    Category('Television', 14),
    Category('Board Games', 15),
    Category('Video Games', 16),
    Category('Comics', 29),
    Category('Mangas and Anime', 31),
    Category('Cartoons', 32),
    Category('Science and Nature', 17),
    Category('Computers', 18),
    Category('Mathematics', 19),
    Category('Gadgets', 30),
    Category('Mythology', 20),
    Category('Sports', 21),
    Category('Geography', 22),
    Category('History', 23),
    Category('Politics', 24),
    Category('Arts', 25),
    Category('Celebrities', 26),
    Category('Animals', 27),
    Category('Vehicles', 28),
    Category('Any', -1)
  ];

  String get category {
    return _category;
  }

  int get categorypath {
    return _categorypath;
  }

  //kolla kategorinamnet och ge oss pathet (numrerna i API:t)
  static String getCategoryPath(String categoryName) {
    String path = '';
    categories.forEach((element) {
      if (categoryName == element.category) {
        path = element.categorypath.toString();
        return;
      }
    });
    return path;
  }
}
