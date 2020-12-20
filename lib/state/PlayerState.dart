import 'package:flutter/cupertino.dart';
import 'package:triviaholic/model/Player.dart';
import 'package:triviaholic/network/rest_service.dart';

class PlayerState extends ChangeNotifier {
  List<Player> _playerList = [];

  Player _currentUser;

  void setCurrentUser(String username) {
    _currentUser = _matchPlayerByUsername(username);
    // print(_matchPlayerByUsername(username));
  }

  Player getCurrentUser() {
    return _currentUser;
  }

  Player _matchPlayerByUsername(String username) {
    Player player;
    _playerList.forEach((existingPlayer) {
      if (username == existingPlayer.username) {
        //  print(existingPlayer);
        player = existingPlayer;
      }
    });
    return player;
  }

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
    notifyListeners();
    return _playerList;
  }
}
