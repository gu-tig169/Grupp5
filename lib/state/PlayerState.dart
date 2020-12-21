import 'package:flutter/cupertino.dart';
import 'package:triviaholic/Network/rest_service.dart';
import 'package:triviaholic/model/Player.dart';

class PlayerState extends ChangeNotifier {
  List<Player> _playerList = [];

  Player _currentUser;

  void setCurrentUser(String username) {
    _currentUser = _matchPlayerByUsername(username);
  }

  Player getCurrentUser() {
    return _currentUser;
  }

  void deletePlayer(String id) {
    RestService.deletePlayer(id);
    notifyListeners();

    print(_playerList);
  }

  Player _matchPlayerByUsername(String username) {
    Player player;
    _playerList.forEach((existingPlayer) {
      if (username == existingPlayer.username) {
        player = existingPlayer;
      }
    });
    return player;
  }

  bool addPlayer(Player player) {
    bool exists = false;
    _playerList.forEach((existingPlayer) {
      if (player.username == existingPlayer.username) {
        exists = true;
        return;
      }
    });

    if (!exists) {
      RestService.registerPlayer(player);
      notifyListeners();
    }
    return exists;
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
