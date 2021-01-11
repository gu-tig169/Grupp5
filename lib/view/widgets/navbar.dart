import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:triviaholic/colors/custom_colors.dart';
import 'package:triviaholic/model/player.dart';
import 'package:triviaholic/state/player_state.dart';
import 'package:triviaholic/view/widgets/common_widgets.dart';

class BottomNavBar extends StatefulWidget {
  @override
  _BottomNavBarState createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  Widget build(BuildContext context) {
    Player player =
        Provider.of<PlayerState>(context, listen: false).getCurrentUser();

    return Container(
      height: 60,
      margin: EdgeInsets.only(bottom: 0),
      child: BottomNavigationBar(
        selectedFontSize: 10,
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
              label: 'Start Game',
              icon: SizedBox(
                child: IconButton(
                  icon: Icon(
                    Icons.videogame_asset_outlined,
                  ),
                  onPressed: () {
                    Navigator.popAndPushNamed(context, '/start');
                  },
                ),
                height: 38,
                width: 38,
              )),
          BottomNavigationBarItem(
              label: 'Leaderboard',
              icon: SizedBox(
                child: IconButton(
                  icon: Icon(Icons.leaderboard),
                  onPressed: () {
                    Navigator.popAndPushNamed(context, '/leaderboard');
                  },
                ),
                height: 38,
                width: 38,
              )),
          BottomNavigationBarItem(
              label: 'Profile',
              icon: SizedBox(
                child: IconButton(
                  icon: Icon(Icons.person),
                  onPressed: () {
                    if (player == null) {
                      alert(context, "Triviaholic found a problem!",
                          "You are not logged in. Try to choose a player");
                    } else {
                      Navigator.popAndPushNamed(context, '/profile');
                    }
                  },
                ),
                height: 38,
                width: 38,
              )),
        ],
        backgroundColor: illuminatingEmerald,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white,
      ),
    );
  }
}
