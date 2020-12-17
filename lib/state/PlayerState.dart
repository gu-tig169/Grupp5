import 'package:flutter/cupertino.dart';
import 'package:triviaholic/model/Player.dart';
import 'package:triviaholic/network/rest_service.dart';

class PlayerState extends ChangeNotifier {
  void addPlayer(Player player) async {
    RestService.registerPlayer(player);
    notifyListeners();
  }
}
