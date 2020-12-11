import 'package:flutter/material.dart';
import 'package:triviaholic/assets/CustomColors.dart';
import 'package:triviaholic/view/widgets/navbar.dart';
import 'package:triviaholic/view/widgets/gradient.dart';

class SelectProfileView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   centerTitle: true,
      //   backgroundColor: illuminatingEmerald,
      //   title: Text('Select Profile'),
      // ),
      body: Center(
        child: Gradienter(
          widget: Column(
            children: [
              spaceBetween(130),
              selectProfileText(),
              profileDropDown(),
              spaceBetween(40),
              newProfileButton(),
            ],
          ),
        ),
      ),

      bottomNavigationBar: BottomNavBar(),
    );
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

Widget profileDropDown() {
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
        items: <String>['Dennis', 'Alban', 'Lukas', 'Niko', 'Noa']
            .map((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value, style: TextStyle(fontSize: 22)),
          );
        }).toList(),
        onChanged: (_) {}),
  );
}

Widget newProfileButton() {
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
          onPressed: () {}),
    ),
  );
}

Widget spaceBetween(double height) {
  return SizedBox(height: height);
}
