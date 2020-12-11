import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:triviaholic/assets/CustomColors.dart';

class Gradienter extends StatelessWidget {
  Widget widget;
  Gradienter({this.widget});
  @override
  Widget build(BuildContext context) {
    return Container(
        child: this.widget,
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment(0.0, -1.0),
                end: Alignment(0.0, 0.7),
                colors: [turquoiseGreen, nyanza])));
  }
}
