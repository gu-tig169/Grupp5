import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:triviaholic/colors/custom_colors.dart';
import 'package:triviaholic/model/player.dart';
import 'package:triviaholic/model/profile_image.dart';
import 'package:triviaholic/state/player_state.dart';
import 'package:triviaholic/view/widgets/gradient.dart';
import 'package:triviaholic/view/widgets/navbar.dart';
import 'package:triviaholic/view/widgets/common_widgets.dart';

class ProfileView extends StatefulWidget {
  @override
  _ProfileViewState createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  ProfileImage newImage;

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
              headerText(currentUser.username),
              spaceBetween(10),
              _profileImage(currentUser),
              spaceBetween(20),
              _dropDown(),
              spaceBetween(50),
              _profileInfo(currentUser.bestScore),
              spaceBetween(50),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _editProfileButton(currentUser),
                  _logoutButton('Log Out'),
                ],
              ),
              spaceBetween(15),
              spaceBetween(5),
              _deleteButton(context, currentUser),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavBar(),
    );
  }

  Widget _profileImage(Player currentUser) {
    return Center(
        child: CircleAvatar(
      radius: 50,
      backgroundImage: (newImage == null)
          ? AssetImage(currentUser.image)
          : AssetImage(newImage.path),
    ));
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

  Widget _editProfileButton(Player currentUser) {
    return Container(
      margin: EdgeInsets.only(right: 10),
      child: SizedBox(
        width: 150,
        height: 70,
        child: RaisedButton(
            color: customPink,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(17),
            ),
            child: Text(
              'Save',
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.w300),
            ),
            onPressed: () {
              currentUser.image = newImage.path;
              Provider.of<PlayerState>(context, listen: false)
                  .editPlayer(currentUser);
            }),
      ),
    );
  }

  Widget _deleteButton(BuildContext context, Player deletedUser) {
    return Container(
      child: SizedBox(
        width: 100,
        height: 35,
        child: RaisedButton(
            color: Colors.red[400],
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(17),
            ),
            child: Text(
              'Delete',
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
            ),
            onPressed: () {
              Provider.of<PlayerState>(context, listen: false)
                  .deletePlayer(deletedUser.id);

              Navigator.popUntil(context, ModalRoute.withName('/'));
              Navigator.pushNamed(context, '/');
            }),
      ),
    );
  }

  Widget _logoutButton(String text) {
    return Container(
        child: SizedBox(
            width: 150,
            height: 70,
            child: RaisedButton(
              color: customPink,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(17)),
              child: Text(
                text,
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.w300),
              ),
              onPressed: () {
                Provider.of<PlayerState>(context, listen: false)
                    .clearCurrentUser();

                Navigator.popUntil(context, ModalRoute.withName('/'));
                Navigator.pushNamed(context, '/');
              },
            )));
  }

  Widget _dropDown() {
    return Container(
        margin: EdgeInsets.only(right: 40, left: 40),
        decoration: ShapeDecoration(
            color: Colors.white,
            shape: RoundedRectangleBorder(
                side: BorderSide(
                    width: 2, style: BorderStyle.solid, color: turquoiseGreen),
                borderRadius: BorderRadius.circular(20))),
        child: DropdownButtonHideUnderline(
            child: DropdownButton(
          items: ProfileImage.images
              .map((image) => DropdownMenuItem(
                    child: Row(
                      children: [
                        Container(width: 6),
                        CircleAvatar(backgroundImage: AssetImage(image.path)),
                        Container(
                          width: 10,
                        ),
                        Text(
                          image.title,
                          style: TextStyle(fontSize: 22),
                        ),
                      ],
                    ),
                    value: image,
                  ))
              .toList(),
          onChanged: (value) {
            setState(() {
              newImage = value;
            });
          },
          value: newImage,
          hint: Text('Choose avatar'),
          isExpanded: true,
        )));
  }
}
