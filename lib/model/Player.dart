class Player {
  String id;
  String username;
  int amountOfGames;
  int averageScore;
  int bestScore;
  String image;
  int currentScore;


  Player({
    this.id,
    this.username,
    this.amountOfGames = 0,
    this.averageScore = 0,
    this.bestScore = 0,
    this.image,
    this.currentScore = 0,
  });
/*
  String get username => _username;
  int get amountOfGames => _amountOfGames;
  int get averageScore => _averageScore;
  int get bestScore => _bestScore;
  String get image => _image;
  */
/*void removeItem(Player player) async {
    _playerList = await RestService.deletePlayer(player);
    notifyListeners();
  }
*/


}
