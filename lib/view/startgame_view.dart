import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:triviaholic/colors/CustomColors.dart';
import 'package:triviaholic/view/selectProfileView.dart';
import 'package:triviaholic/view/widgets/navbar.dart';
import 'package:triviaholic/view/widgets/gradient.dart';

class StartGameView extends StatefulWidget {
  @override
  _StartGameViewState createState() => _StartGameViewState();
}

class _StartGameViewState extends State<StartGameView> {
  final List<String> difficultylist = ['Easy', 'Medium', 'Hard'];
  var _itemselected = 'Easy';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Gradienter(
          widget: Column(
            children: [
              homeText(),
              spaceBetween(30),
              dropDownTitle(),
              spaceBetween(10),
              dropdownGenerator(difficultylist),
              startgameButton(context),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavBar(),
    );
  }

  Widget startgameButton(context) {
    return Container(
      margin: EdgeInsets.only(bottom: 50, top: 200),
      alignment: Alignment.bottomCenter,
      child: SizedBox(
        width: 250,
        height: 70,
        child: RaisedButton(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(17)),
            color: customPink,
            child: Text(
              'Start Game',
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.w300),
            ),
            onPressed: () {
              Navigator.pushNamed(context, '/game');
            }),
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

  Widget dropdownGenerator(List<String> list) {
    return Container(
        child: Container(
            margin: EdgeInsets.only(right: 1, left: 0),
            decoration: ShapeDecoration(
                color: nyanza,
                shape: RoundedRectangleBorder(
                    side: BorderSide(
                        width: 2,
                        style: BorderStyle.solid,
                        color: turquoiseGreen),
                    borderRadius: BorderRadius.circular(20))),
            child: DropdownButtonHideUnderline(
                child: DropdownButton(
              dropdownColor: nyanza,
              items: list
                  .map((difficultyitem) => DropdownMenuItem(
                        value: difficultyitem,
                        child: Row(
                          children: [
                            Container(width: 6),
                            Icon(Icons.question_answer),
                            Container(
                              width: 10,
                            ),
                            Text(
                              difficultyitem,
                              style: TextStyle(fontSize: 22),
                            ),
                          ],
                        ),
                        //value: avatar,
                      ))
                  .toList(),
              onChanged: (String newValueSelected) {
                setState(() {
                  _itemselected = newValueSelected;
                });
              },
              value: _itemselected,
            ))));
  }

  Widget dropDownTitle() {
    return Container(
      child: Text(
        'Choose difficulty:',
        style: TextStyle(fontWeight: FontWeight.w500),
      ),
    );
  }
}
