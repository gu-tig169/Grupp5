import 'dart:convert';

import 'package:triviaholic/model/Player.dart';
import 'package:http/http.dart' as http;

class RestService {
  static final String url = 'https://quiz-26e0c-default-rtdb.firebaseio.com/';

  static void registerPlayer(Player player) async {
    String path = "user.json";
    print(player.password);
    await http.post(
      url + path,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, dynamic>{
        "username": player.username,
        "password": player.password.toString(),
        "amountOfGames": player.amountOfGames,
        "bestScore": player.bestScore,
        "image": player.image,
        "currentScore": player.currentScore
      }),
    );
  }

  // hämtar players
  static Future<List<Player>> getPlayers() async {
    String path = "user.json";
    http.Response response = await http.get(url + path);
    return _mapResponseToList(response);
  }

  // Deletes player
  static void deletePlayer(String id) async {
    String path = "user/";
    await http.delete("$url$path$id.json");
  }

  //Updates players Highscore
  static void editPlayer(Player player) async {
    String path = "user/";

    await http.put(
      url + path + player.id + '.json',
      //"$url$path$id$bestScore.json",
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, dynamic>{
        "username": player.username,
        "password": player.password,
        "amountOfGames": player.amountOfGames,
        "bestScore": player.bestScore,
        "image": player.image,
        "currentScore": player.currentScore
      }),
    );
  }

  static List<Player> _mapResponseToList(http.Response response) {
    List<Player> playerList = [];
    var jsonResponseBody = response.body;
    var responseBody = jsonDecode(jsonResponseBody);

    // loopar igenom players och lägger till
    responseBody.forEach(
      (key, value) {
        playerList.add(Player(
          id: key,
          username: value['username'],
          password: value["password"],
          amountOfGames: value['amountOfGames'],
          bestScore: value['bestScore'],
          image: value['image'],
          //   currentScore: value['currentScore'],
        ));
        print("currentScore:" + value["currentScore"].toString());
      },
    );

    return playerList;
  }
}
