import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:triviaholic/Network/rest_service.dart';
import 'package:triviaholic/colors/custom_colors.dart';
import 'package:triviaholic/model/player.dart';
import 'package:triviaholic/model/profile_image.dart';
import 'package:triviaholic/state/player_state.dart';
import 'package:triviaholic/view/widgets/gradient.dart';
import 'package:triviaholic/view/widgets/common_widgets.dart';

class CreateProfileView extends StatefulWidget {
  @override
  _CreateProfileViewState createState() => _CreateProfileViewState();
}

class _CreateProfileViewState extends State<CreateProfileView> {
  ProfileImage currentImage;
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: turquoiseGreen,
        title: Text('Create Profile'),
        centerTitle: true,
      ),
      resizeToAvoidBottomInset: false,
      body: Gradienter(
        widget: Column(
          children: [
            spaceBetween(50),
            _userTextField('Username', usernameController, false),
            spaceBetween(10),
            _userTextField("Password", passwordController, true),
            spaceBetween(10),
            _dropDown(),
            spaceBetween(40),
            _profileImage(),
            spaceBetween(40),
            _createProfileButton(context),
          ],
        ),
      ),
    );
  }

  Widget _userTextField(
      String hint, TextEditingController controller, bool obscure) {
    return Container(
      margin: EdgeInsets.only(right: 40, left: 40),
      child: TextField(
        obscureText: obscure,
        controller: controller,
        decoration: InputDecoration(
            fillColor: Colors.white,
            filled: true,
            hintText: hint,
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide: BorderSide(width: 2, color: turquoiseGreen)),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide: BorderSide(width: 4, color: turquoiseGreen))),
      ),
    );
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
              currentImage = value;
            });
          },
          value: currentImage,
          hint: Text('Choose avatar'),
          isExpanded: true,
        )));
  }

  Widget _profileImage() {
    return Center(
        child: CircleAvatar(
      radius: 50,
      backgroundImage: (currentImage != null)
          ? AssetImage(currentImage.path)
          : AssetImage('assets/blondegirl.png'),
    ));
  }

  Widget _createProfileButton(context) {
    return Container(
      child: SizedBox(
        width: 250,
        height: 70,
        child: RaisedButton(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(17)),
            color: Color(0xfffff3d9d8),
            child: Text(
              'Create Profile',
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.w300),
            ),
            onPressed: () {
              RestService.getPlayers();
              bool userNameExists =
                  Provider.of<PlayerState>(context, listen: false).addPlayer(
                      Player(
                          username: usernameController.text,
                          password: passwordController.text,
                          image: currentImage.path));
              if (userNameExists) {
                alert(context, "Triviaholic found a problem!",
                    "This username is already used");
              } else {
                Navigator.pushNamed(context, '/start');
              }
            }),
      ),
    );
  }
}
