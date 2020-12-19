import 'package:flutter/cupertino.dart';
import 'package:triviaholic/model/Player.dart';
import 'package:triviaholic/network/rest_service.dart';

class PlayerState extends ChangeNotifier {
  List<Player> _playerList = [];

  Future<int> addPlayer(Player player) async {
    List<Player> existingPlayers = await getPlayers();
    bool exists = false;
    existingPlayers.forEach((existingPlayer) {
      if (player.username == existingPlayer.username) {
        exists = true;
        return;
      }
    });

    if (exists) {
      return -1;
    }

    print('hoppas denna text aldrig syns');

    RestService.registerPlayer(player);
    notifyListeners();
    return 1;
  }

  void _injectList() async {
    this._playerList = await RestService.getPlayers();
    notifyListeners();
  }

  List<Player> getPlayers() {
    _injectList();
    return _playerList;
  }
}
