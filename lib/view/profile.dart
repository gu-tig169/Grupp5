import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:triviaholic/colors/CustomColors.dart';
import 'package:triviaholic/model/Player.dart';
import 'package:triviaholic/state/PlayerState.dart';
import 'package:triviaholic/view/widgets/gradient.dart';
import 'package:triviaholic/view/widgets/navbar.dart';
import 'package:triviaholic/model/ProfileImage.dart';

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
              _profileTitle(currentUser.username),
              spaceBetween(70),
              profileImage(currentUser),
              spaceBetween(20),
              dropDown(),
              _profileInfo(currentUser.bestScore),
              spaceBetween(50),
              _editProfileButton(currentUser),
              spaceBetween(15),
              _deleteButton(context, currentUser),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavBar(),
    );
  }

  // Widget _profilePicture(String image) {
  //   return Container(
  //     child: CircleAvatar(
  //       backgroundImage: AssetImage(image),
  //       radius: 50,
  //     ),
  //   );
  // }

  Widget profileImage(Player currentUser) {
    return Center(
        child: CircleAvatar(
      radius: 50,
      backgroundImage: (newImage == null)
          ? AssetImage(currentUser.image)
          : AssetImage(newImage.path),
    ));
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

  Widget _editProfileButton(Player currentUser) {
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
              'Save',
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.w300),
            ),
            onPressed: () {
              currentUser.image = newImage.path;
              Provider.of<PlayerState>(context, listen: false)
                  .editPlayer(currentUser);
              Navigator.pushNamed(context, "/");
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
                  .deletePlayer(deletedUser.id);
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

  Widget dropDown() {
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
              print(value);
            });
          },
          value: newImage,
          hint: Text('Choose avatar'),
          isExpanded: true,
        )));
  }
}
