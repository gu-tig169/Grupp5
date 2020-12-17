import 'package:flutter/material.dart';
import 'package:triviaholic/colors/CustomColors.dart';
import 'package:triviaholic/view/widgets/navbar.dart';
import 'package:triviaholic/view/widgets/gradient.dart';

class SelectProfileView extends StatefulWidget {
  @override
  _SelectProfileViewState createState() => _SelectProfileViewState();
}

class _SelectProfileViewState extends State<SelectProfileView> {
  final List<String> userList = ['Dennis', 'Noa', 'Niko', 'Alban', 'Lukas'];
  var _userSelected;
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
              profileDropDown(userList),
              spaceBetween(40),
              newProfileButton(context),
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

Widget profileDropDown(List<String> list) {
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
        items: list.map((userItem) {
          return DropdownMenuItem<String>(
            value: userItem,
            child: Text(userItem, style: TextStyle(fontSize: 22)),
          );
        }).toList(),
        onChanged: (selectedUser) {}),
  );
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
