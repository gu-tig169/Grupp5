import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget spaceBetween(double height) {
  return SizedBox(height: height);
}

alert(BuildContext context, String title, String content) {
  Widget okButton = FlatButton(
    child: Text("OK"),
    onPressed: () {
      Navigator.pop(context);
    },
  );

  AlertDialog alert = AlertDialog(
    title: Text(title),
    content: Text(content),
    actions: [
      okButton,
    ],
  );

  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}

Widget headerText(String text) {
  return Container(
    alignment: Alignment.center,
    child: Text(
      text,
      style: TextStyle(fontSize: 36, fontWeight: FontWeight.w400),
    ),
  );
}

Widget appLogo() {
  return Center(
      child: CircleAvatar(
    radius: 70,
    backgroundImage: AssetImage('assets/triviaholic_logo.png'),
  ));
}
