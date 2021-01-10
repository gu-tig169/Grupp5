import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:triviaholic/model/category.dart';
import 'package:triviaholic/model/game_round.dart';
import 'package:triviaholic/model/player.dart';
import 'package:triviaholic/model/question.dart';
import 'package:triviaholic/network/game_data.dart';
import 'package:triviaholic/state/player_state.dart';
import 'package:triviaholic/view/widgets/gradient.dart';
import 'package:triviaholic/view/widgets/navbar.dart';
import 'package:triviaholic/colors/custom_colors.dart';
import 'package:triviaholic/view/widgets/common_widgets.dart';

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
              headerText('Welcome to Triviaholic!'),
              spaceBetween(80),
              _dropDownTitle('Choose your difficulty'),
              spaceBetween(5),
              _dropDownDifficulty(difficultylist),
              spaceBetween(30),
              _dropDownTitle('Choose your category'),
              spaceBetween(5),
              _dropDownCategory(),
              spaceBetween(50),
              _startgameButton(context),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavBar(),
    );
  }

  Widget _startgameButton(context) {
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
              if (currentCategory != 'Any') {
                params.add(
                    'category=' + Category.getCategoryPath(currentCategory));
              }

              if (currentDifficulty != 'Any') {
                params.add('difficulty=$currentDifficulty'.toLowerCase());
              }

              await GameData.getGameData(params)
                  .then((value) => questions = value.cast<Question>());
              questions.length >= 1
                  ? Navigator.pushNamed(context, "/game",
                      arguments: GameRound(
                          questions: questions,
                          difficulty: currentDifficulty,
                          category: currentCategory,
                          players: player))
                  : alert(context, "Triviaholic found a problem!",
                      "Not enough questions found. Try to change difficulty to 'Any'");
              params = [];
            }),
      ),
    );
  }

  Widget _dropDownDifficulty(List<String> list) {
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

  Widget _dropDownTitle(String text) {
    return Container(
      child: Text(
        text,
        style: TextStyle(fontWeight: FontWeight.w500, fontSize: 18),
      ),
    );
  }

  Widget _dropDownCategory() {
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
            setState(() {});
          },
          value: currentCategory,
          hint: Text('Choose categories'),
          isExpanded: true,
        )));
  }
}
