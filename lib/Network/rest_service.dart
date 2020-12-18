import 'dart:convert';

import 'package:triviaholic/model/Player.dart';
import 'package:http/http.dart' as http;

class RestService {
  static final String url =
      'https://quiz-26e0c-default-rtdb.firebaseio.com/user.json';
  

 static void registerPlayer(Player player) async {
    http.Response response = await http.post(
      url,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, dynamic>{
        "username": player.username,
        "amountOfGames": player.amountOfGames,
        "averageScore": player.averageScore,
        "bestScore": player.bestScore,
        "image": player.image
      }),
    );
  }
  // hämtar players? 
static Future <List<Player>> getPlayers() async {
http.Response response = await http.get(url);
return _mapResponseToList(response);
}
static List<Player> _mapResponseToList(http.Response response) {
  List<Player> playerList = [];
  var jsonResponseBody = response.body;
  var responseBody = jsonDecode(jsonResponseBody);
  
  
    /*
          username: object["username"],
          amountOfGames: object["amountOfGames"],
          averageScore: object["averageScore"],
          bestScore: object["bestScore"],
          image: object["image"],
          */
  print (responseBody);
  return playerList;
  
}
}
