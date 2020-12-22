class Player {
  String id;
  String username;
  int amountOfGames;
  int averageScore;
  int bestScore;
  String image;

  Player(
      {this.id,
      this.username,
      this.amountOfGames = 0,
      this.averageScore = 0,
      this.bestScore = 0,
      this.image});
}
