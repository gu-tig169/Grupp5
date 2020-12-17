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
}
