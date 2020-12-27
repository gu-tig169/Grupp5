class Player {
  String id;
  String username;
  int amountOfGames;
  int bestScore;
  String image;
  int currentScore;

  Player({
    this.id,
    this.username,
    this.amountOfGames = 0,
    this.bestScore = 0,
    this.image,
    this.currentScore = 0,
  });
}
