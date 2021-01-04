import 'package:flutter/cupertino.dart';
import 'package:triviaholic/Network/rest_service.dart';
import 'package:triviaholic/model/Player.dart';
import 'package:triviaholic/model/Question.dart';
import 'package:crypto/crypto.dart';
import 'dart:convert';

class PlayerState extends ChangeNotifier {
  List<Player> _playerList = [];

  Player _currentUser;

  PlayerState() {
    _injectList();
    notifyListeners();
  }

  bool setCurrentUser(String username, String password) {
    _currentUser = _matchPlayerByUsernameAndPassword(username, password);
    if (_currentUser == null) {
      return false;
    }

    return true;
  }

  Player getCurrentUser() {
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

  editPlayer(Player player) {
    RestService.editPlayer(player);
    notifyListeners();
  }

  Player _matchPlayerByUsernameAndPassword(String username, String password) {
    Player player;
    var bytes = utf8.encode(password);
    var digest = sha256.convert(bytes);
    print(digest);
    _playerList.forEach((existingPlayer) {
      if (username == existingPlayer.username &&
          digest.toString() == existingPlayer.password) {
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
      var password = player.password;
      var bytes = utf8.encode(password);
      var digest = sha256.convert(bytes);
      player.password = digest;
      RestService.registerPlayer(player);
      _playerList.add(player);
      RestService.getPlayers().then((value) => this._playerList = value);
      notifyListeners();
    }
    return exists;
  }

  void _injectList() async {
    this._playerList = await RestService.getPlayers();
    notifyListeners();
  }

  List<Player> getPlayers() {
    return this._playerList;
  }

  List<Player> sortbyScore() {
    _playerList.sort();
    return _playerList;
  }
}
