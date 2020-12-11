import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:triviaholic/assets/CustomColors.dart';
import 'package:triviaholic/view/widgets/navbar.dart';

class StartGameView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: nyanza,
      appBar: AppBar(
        backgroundColor: illuminatingEmerald,
        title: Text('Trivaholic'),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: IconButton(
              icon: Icon(
                Icons.person,
                size: 30,
              ),
              onPressed: () {},
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          homeText(),
          startgameButton(),
        ],
      ),
      bottomNavigationBar: BottomNavBar(),
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
}
