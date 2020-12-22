import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:triviaholic/colors/CustomColors.dart';
import 'package:triviaholic/model/Player.dart';
import 'package:triviaholic/state/PlayerState.dart';
import 'package:triviaholic/view/widgets/gradient.dart';
import 'package:triviaholic/view/widgets/navbar.dart';

class ProfileView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Player currentUser =
        Provider.of<PlayerState>(context, listen: false).getCurrentUser();
    return Scaffold(
      body: Gradienter(
        widget: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _profileTitle(currentUser.username),
              spaceBetween(70),
              _profilePicture(currentUser.image),
              spaceBetween(20),
              _profileInfo(currentUser.bestScore),
              spaceBetween(50),
              _editProfileButton(),
              spaceBetween(15),
              _deleteButton(context, currentUser),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavBar(),
    );
  }

  Widget _profilePicture(String image) {
    return Container(
      child: CircleAvatar(
        backgroundImage: AssetImage(image),
        radius: 50,
      ),
    );
  }

  Widget spaceBetween(double height) {
    return Container(
      height: height,
    );
  }

  Widget _profileInfo(int bestScore) {
    return Column(
      children: [
        Text(
          'Current highscore',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
        ),
        spaceBetween(20),
        Text(
          '$bestScore',
          style: TextStyle(fontSize: 30),
        ),
      ],
    );
  }

  Widget _editProfileButton() {
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
              'Edit',
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.w300),
            ),
            onPressed: () {}),
      ),
    );
  }

  Widget _deleteButton(BuildContext context, Player playerToDelete) {
    return Container(
      child: SizedBox(
        width: 100,
        height: 35,
        child: RaisedButton(
            color: Colors.red,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(17),
            ),
            child: Text(
              'Delete',
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
            ),
            onPressed: () {
              Provider.of<PlayerState>(context, listen: false)
                  .deletePlayer(playerToDelete.id);
              Provider.of<PlayerState>(context, listen: false)
                  .clearCurrentUser();
              Navigator.pushNamed(context, "/");
            }),
      ),
    );
  }

  Widget _profileTitle(String username) {
    return Container(
      margin: EdgeInsets.only(top: 1),
      child: Text(
        username,
        style: TextStyle(fontSize: 42),
      ),
    );
  }
}
