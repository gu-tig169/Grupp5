class Player implements Comparable<Player> {
  String id;
  String username;
  var password;
  int amountOfGames;
  int bestScore;
  String image;
  int currentScore;

  Player({
    this.id,
    this.username,
    this.password,
    this.amountOfGames = 0,
    this.bestScore = 0,
    this.image,
    this.currentScore = 0,
  });

  @override
  int compareTo(Player a) {
    if (a.bestScore > this.bestScore) {
      return 1;
    } else if (a.bestScore < this.bestScore) {
      return -1;
    }
    return 0;
  }
}
