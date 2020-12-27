import 'package:flutter/cupertino.dart';
import 'package:triviaholic/Network/rest_service.dart';
import 'package:triviaholic/model/Player.dart';
import 'package:triviaholic/model/Question.dart';

class PlayerState extends ChangeNotifier {
  List<Player> _playerList = [];

  Player _currentUser;

  PlayerState() {
    _injectList();
    notifyListeners();
    print(_playerList);
  }

  void setCurrentUser(String username) {
    _currentUser = _matchPlayerByUsername(username);
  }

  Player getCurrentUser() {
    print('getcurrentuser har aktiverats!');
    return _currentUser;
  }

  void clearCurrentUser() {
    _currentUser = null;
  }

  void deletePlayer(String id) async {
    RestService.deletePlayer(id);
    this._playerList = await RestService.getPlayers();
    notifyListeners();
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
      RestService.getPlayers().then((value) => this._playerList = value);
      notifyListeners();
    }
    // this._playerList = await RestService.getPlayers();
    return exists;
  }

  void _injectList() async {
    this._playerList = await RestService.getPlayers();
    // print('injectlist som är på g');
    notifyListeners();
  }

  List<Player> getPlayers() {
    print('getPlayers har aktiverats!');
    return this._playerList;
  }
}
