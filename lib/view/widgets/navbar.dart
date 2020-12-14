import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:triviaholic/assets/CustomColors.dart';

class BottomNavBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
                    Navigator.pushNamed(context, '/');
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
                    Navigator.pushNamed(context, '/leaderboard');
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
                    Navigator.pushNamed(context, '/');
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
