import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:triviaholic/Network/game_data.dart';
import 'package:triviaholic/colors/CustomColors.dart';
import 'package:triviaholic/model/Category.dart';
import 'package:triviaholic/model/GameRound.dart';
import 'package:triviaholic/model/Player.dart';
import 'package:triviaholic/model/Question.dart';
import 'package:triviaholic/state/PlayerState.dart';
import 'package:triviaholic/view/selectProfileView.dart';
import 'package:triviaholic/view/widgets/navbar.dart';
import 'package:triviaholic/view/widgets/gradient.dart';
import 'package:provider/provider.dart';

class StartGameView extends StatefulWidget {
  @override
  _StartGameViewState createState() => _StartGameViewState();
}

class _StartGameViewState extends State<StartGameView> {
  final List<String> difficultylist = ['Any', 'Easy', 'Medium', 'Hard'];

  String currentDifficulty = 'Any';
  String currentCategory = 'Any';

  List<String> params = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Gradienter(
          widget: Column(
            children: [
              spaceBetween(100),
              homeText(),
              spaceBetween(80),
              dropDownTitle('Choose your difficulty'),
              spaceBetween(5),
              dropDownDifficulty(difficultylist),
              spaceBetween(30),
              dropDownTitle('Choose your category'),
              spaceBetween(5),
              dropDownCategory(),
              spaceBetween(50),
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
            onPressed: () async {
              List<Question> questions = [];
              Player player = Provider.of<PlayerState>(context, listen: false)
                  .getCurrentUser();
              player.currentScore = 0;
              Provider.of<PlayerState>(context, listen: false)
                  .editPlayer(player);
              print(player.currentScore);
              if (currentCategory != 'Any') {
                params.add(
                    'category=' + Category.getCategoryPath(currentCategory));
              }

              if (currentDifficulty != 'Any') {
                params.add('difficulty=$currentDifficulty'.toLowerCase());
              }

              await GameData.getGameData(params)
                  .then((value) => questions = value);
              questions.length >= 1
                  ? Navigator.pushNamed(context, "/game",
                      arguments: GameRound(
                          questions: questions,
                          difficulty: currentDifficulty,
                          category: currentCategory,
                          players: player))
                  : alertNotEnoughQuestions(context);
              params = [];
            }),
      ),
    );
  }

// kanske dlytta den här alerten till egen fil? Blir grötigt
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
      content:
          Text("Not enough questions found. Try to change difficulty to 'Any'"),
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

  Widget dropDownDifficulty(List<String> list) {
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
                        child: Container(
                          margin: EdgeInsets.only(left: 20),
                          child: Text(
                            dropdownitem,
                            style: TextStyle(fontSize: 22),
                          ),
                        ),
                      ))
                  .toList(),
              onChanged: (String changedValue) {
                currentDifficulty = changedValue;
                setState(() {
                  // difficulty;
                });
              },
              value: currentDifficulty,
            ))));
  }

  Widget dropDownTitle(String text) {
    return Container(
      child: Text(
        text,
        style: TextStyle(fontWeight: FontWeight.w500, fontSize: 18),
      ),
    );
  }

  Widget dropDownCategory() {
    return Container(
        margin: EdgeInsets.only(right: 50, left: 50),
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
                    child: Center(
                      child: Container(
                        child: Text(
                          category.category,
                          style: TextStyle(fontSize: 22),
                        ),
                      ),
                    ),
                    value: category.category,
                  ))
              .toList(),
          onChanged: (changedValue) {
            currentCategory = changedValue;
            setState(() {
              // print(changedValue);
            });
          },
          value: currentCategory,
          hint: Text('Choose categories'),
          isExpanded: true,
        )));
  }
}
