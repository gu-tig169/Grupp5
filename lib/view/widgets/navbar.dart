import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:triviaholic/colors/CustomColors.dart';
import 'package:triviaholic/model/Player.dart';
import 'package:triviaholic/state/PlayerState.dart';
import 'package:provider/provider.dart';

class BottomNavBar extends StatefulWidget {
  @override
  _BottomNavBarState createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  @override
  alertNotEnoughQuestions(BuildContext context) {
    // set up the button
    Widget okButton = FlatButton(
      child: Text("OK"),
      onPressed: () {
        Navigator.pop(context);
      },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text("Triviaholic found a problem!"),
      content: Text("You are not logged in. Try to choose a player"),
      actions: [
        okButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

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
              label: 'Home',
              icon: SizedBox(
                child: IconButton(
                  icon: Icon(
                    Icons.home,
                  ),
                  onPressed: () {
                    Navigator.popAndPushNamed(context, '/');
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
                    print(player);
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
                      alertNotEnoughQuestions(context);
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
