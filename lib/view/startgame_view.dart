import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:triviaholic/Network/game_data.dart';
import 'package:triviaholic/colors/CustomColors.dart';
import 'package:triviaholic/model/Category.dart';
import 'package:triviaholic/view/selectProfileView.dart';
import 'package:triviaholic/view/widgets/navbar.dart';
import 'package:triviaholic/view/widgets/gradient.dart';

class StartGameView extends StatefulWidget {
  @override
  _StartGameViewState createState() => _StartGameViewState();
}

class _StartGameViewState extends State<StartGameView> {
  final List<String> difficultylist = ['Easy', 'Medium', 'Hard'];
  int currentCategory = -1;
  var _itemselected = 'Easy';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Gradienter(
          widget: Column(
            children: [
              spaceBetween(100),
              homeText(),
              spaceBetween(30),
              dropDownTitle(),
              spaceBetween(20),
              dropdownGenerator(difficultylist),
              spaceBetween(30),
              categoryDropDown(),
              spaceBetween(130),
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
      // margin: EdgeInsets.only(bottom: 50, top: 120),
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
              GameData.getGameData();
              //Navigator.pushNamed(context, '/game');
            }),
      ),
    );
  }

  Widget homeText() {
    return Container(
      // margin: EdgeInsets.only(top: 100),
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
                  .map((dropdownitem) => DropdownMenuItem(
                        value: dropdownitem,
                        child: Row(
                          children: [
                            Container(width: 6),
                            //Icon(Icons.question_answer),
                            Container(
                              width: 10,
                            ),
                            Text(
                              dropdownitem,
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
        'Choose your difficulty and category',
        style: TextStyle(fontWeight: FontWeight.w500),
      ),
    );
  }

  Widget categoryDropDown() {
    return Container(
        margin: EdgeInsets.only(right: 90, left: 90),
        decoration: ShapeDecoration(
            color: nyanza,
            shape: RoundedRectangleBorder(
                side: BorderSide(
                    width: 2, style: BorderStyle.solid, color: turquoiseGreen),
                borderRadius: BorderRadius.circular(20))),
        child: DropdownButtonHideUnderline(
            child: DropdownButton(
          dropdownColor: nyanza,
          items: Category.categories
              .map((category) => DropdownMenuItem(
                    child: Container(
                      margin: EdgeInsets.only(left: 10),
                      child: Text(
                        category.category,
                        style: TextStyle(fontSize: 22),
                      ),
                    ),
                    value: category.categorypath,
                  ))
              .toList(),
          onChanged: (value) {
            setState(() {
              currentCategory = value;
              print(value);
            });
          },
          value: currentCategory,
          hint: Text('Choose categories'),
          isExpanded: true,
        )));
  }
}
