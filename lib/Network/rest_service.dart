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


  /*static void deletePlayer(Player player) async {
    http.Response response = await http.delete(
      url,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      }, 
    
    );
  }
*/

/*static Future<List<Player>> deletePlayer(Player player) async {
    http.Response res = await http.delete(url);
    
    return _mapResponseToList(res);
  }
*/
  // hämtar players


  static Future<List<Player>> getPlayers() async {
    http.Response response = await http.get(url);
    return _mapResponseToList(response);
  }

  static List<Player> _mapResponseToList(http.Response response) {
    List<Player> playerList = [];
    var jsonResponseBody = response.body;
    var responseBody = jsonDecode(jsonResponseBody);

    // loopar igenom players och lägger till
    responseBody.forEach(
      (key, value) {
        playerList.add(Player(
            username: value['username'],
            amountOfGames: value['amountOfGames'],
            averageScore: value['averageScore'],
            bestScore: value['bestScore'],
            image: value['image']));
      },
    );

    // playerList.forEach((element) => print(element.username));

    return playerList;
  }
}
