import 'package:flutter/material.dart';
import 'package:triviaholic/colors/CustomColors.dart';
import 'package:triviaholic/view/widgets/gradient.dart';
import 'package:triviaholic/view/widgets/navbar.dart';

class ProfileView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Gradienter(
        widget: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _profileTitle(),
              spaceBetween(70),
              _profilePicture(),
              spaceBetween(20),
              _profileInfo(),
              spaceBetween(50),
              _deleteButton(),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavBar(),
    );
  }

  Widget _profilePicture() {
    return Container(
      child: CircleAvatar(
        backgroundImage: NetworkImage(
            'https://lh3.googleusercontent.com/proxy/Ygs0ZwjugIm0NZ7QggK4SGH-3nSpKt8o7Xn8FdeJPoD1kGw8TzYYVW4WUk3tLLv9qocZGBO5HkEu-vFmwea552yptkIgJJHWbcioSbCYvoWwMNTkmI_mS8cqs7N5ExhcYqfWQgBaFEEa1z0r_wWjErLp2Q'),
        radius: 50,
      ),
    );
  }

  Widget spaceBetween(double height) {
    return Container(
      height: height,
    );
  }

  Widget _profileInfo() {
    return Column(
      children: [
        Text(
          'Peter Parker',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
        ),
        spaceBetween(20),
        Text(
          'Points: 100',
          style: TextStyle(fontSize: 30),
        ),
      ],
    );
  }

  Widget _deleteButton() {
    return Container(
      child: SizedBox(
        width: 200,
        height: 70,
        child: RaisedButton(
            color: customPink,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(17),
            ),
            child: Text(
              'Delete',
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.w300),
            ),
            onPressed: () {}),
      ),
    );
  }

  Widget _profileTitle() {
    return Container(
      margin: EdgeInsets.only(top: 1),
      child: Text(
        'Your Profile',
        style: TextStyle(fontSize: 42),
      ),
    );
  }
}
