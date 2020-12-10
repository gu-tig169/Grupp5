import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:triviaholic/assets/CustomColors.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: nyanza,
      appBar: AppBar(
        backgroundColor: illuminatingEmerald,
        title: Text('Trivaholic'),
      ),
      body: Column(
        children: [
          homeText(),
          startgameButton(),
        ],
      ),
      bottomNavigationBar: bottomNavBar(),
    );
  }

  Widget startgameButton() {
    return Container(
      margin: EdgeInsets.only(bottom: 50, top: 200),
      alignment: Alignment.bottomCenter,
      child: SizedBox(
        width: 250,
        height: 70,
        child: RaisedButton(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(17)),
            color: Color(0xfffff3d9d8),
            child: Text(
              'Start Game',
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.w300),
            ),
            onPressed: () {}),
      ),
    );
  }

  Widget homeText() {
    return Container(
      margin: EdgeInsets.only(top: 100),
      alignment: Alignment.center,
      child: Text(
        'Welcome to Triviaholic!',
        style: TextStyle(fontSize: 30, fontWeight: FontWeight.w400),
      ),
    );
  }

  Widget bottomNavBar() {
    return Container(
      margin: EdgeInsets.only(bottom: 0),
      child: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            label: 'Home',
            icon: Icon(
              Icons.home,
              color: Colors.white,
            ),
          ),
          BottomNavigationBarItem(
            label: 'Leaderboard',
            icon: Icon(Icons.leaderboard),
          ),
          BottomNavigationBarItem(
            label: 'My Profile',
            icon: Icon(Icons.person),
          ),
        ],
        backgroundColor: illuminatingEmerald,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white,
      ),
    );
  }
}
