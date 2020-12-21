import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:triviaholic/colors/CustomColors.dart';
import 'package:triviaholic/model/Player.dart';
import 'package:triviaholic/state/PlayerState.dart';
import 'package:triviaholic/view/widgets/navbar.dart';
import 'package:triviaholic/view/widgets/gradient.dart';

class SelectProfileView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Gradienter(
          widget: Column(
            children: [
              spaceBetween(130),
              selectProfileText(),
              Consumer<PlayerState>(
                  builder: (context, state, child) =>
                      profileDropDown(state.getPlayers(), context)),
              spaceBetween(40),
              newProfileButton(context),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavBar(),
    );
  }

  Widget profileDropDown(List<Player> list, BuildContext context) {
    return Container(
        margin: EdgeInsets.only(top: 20, left: 40, right: 40),
        decoration: BoxDecoration(
            border: Border.all(width: 1.5, color: brunsWickGreen),
            borderRadius: BorderRadius.all(Radius.circular(20.0))),
        child: DropdownButton<String>(
          dropdownColor: nyanza,
          isExpanded: true,
          iconSize: 50,
          icon: Icon(
            Icons.arrow_drop_down,
            color: brunsWickGreen,
          ),
          iconEnabledColor: darkJungleGreen,
          items: list
              .map((userItem) => DropdownMenuItem<String>(
                      child: Row(children: [
                        Container(
                          margin: EdgeInsets.only(left: 8.8),
                          child: Text(userItem.username.toString(),
                              style: TextStyle(fontSize: 22)),
                        ),
                      ]),
                      value: userItem.username) // klura här sen
                  )
              .toList(),
          onChanged: (value) {
            Provider.of<PlayerState>(context, listen: false)
                .setCurrentUser(value);
          },
          hint: Container(
            margin: EdgeInsets.only(left: 8.8),
            child: (Text(
              'Choose profile',
              style: TextStyle(fontWeight: FontWeight.w500),
            )),
          ),
        ));
  }
}

Widget selectProfileText() {
  return Container(
      child: Text(
    'Select Profile',
    style: TextStyle(
        fontSize: 36, fontWeight: FontWeight.w300, color: darkJungleGreen),
  ));
}

Widget newProfileButton(context) {
  return Container(
    margin: EdgeInsets.only(bottom: 50, top: 130),
    alignment: Alignment.bottomCenter,
    child: SizedBox(
      width: 250,
      height: 70,
      child: RaisedButton(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
              side: BorderSide(color: customPink)),
          color: customPink,
          child: Text(
            'New Profile',
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.w300),
          ),
          onPressed: () {
            Navigator.pushNamed(context, '/create');
          }),
    ),
  );
}

Widget spaceBetween(double height) {
  return SizedBox(height: height);
}
