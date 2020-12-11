import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:triviaholic/assets/CustomColors.dart';

class CreateProfileView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: illuminatingEmerald,
        title: Text('New Profile'),
      ),
    );
  }
}
