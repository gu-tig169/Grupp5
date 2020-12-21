import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:triviaholic/Network/rest_service.dart';
import 'package:triviaholic/colors/CustomColors.dart';
import 'package:triviaholic/model/Player.dart';
import 'package:triviaholic/model/ProfileImage.dart';
import 'package:triviaholic/state/PlayerState.dart';
import 'package:triviaholic/view/widgets/gradient.dart';
import 'package:triviaholic/view/widgets/navbar.dart';

class CreateProfileView extends StatefulWidget {
  @override
  _CreateProfileViewState createState() => _CreateProfileViewState();
}

class _CreateProfileViewState extends State<CreateProfileView> {
  ProfileImage currentImage;
  TextEditingController editController = TextEditingController();
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
            spaceBetween(120),
            userTextField('Username'),
            spaceBetween(40),
            dropDown(),
            spaceBetween(40),
            profileImage(),
            spaceBetween(40),
            createProfileButton(context),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavBar(),
    );
  }

  Widget userTextField(String hint) {
    return Container(
      //decoration: BoxDecoration(color: Colors.white),
      margin: EdgeInsets.only(right: 40, left: 40),
      child: TextField(
        controller: editController,
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
              currentImage = value;
              print(value);
            });
          },
          value: currentImage,
          hint: Text('Choose avatar'),
          isExpanded: true,
        )));
  }

  Widget spaceBetween(double height) {
    return Container(
      height: height,
    );
  }

  Widget profileImage() {
    return Center(
        child: CircleAvatar(
      radius: 50,
      backgroundImage: (currentImage != null)
          ? AssetImage(currentImage.path)
          : AssetImage('assets/blondegirl.png'),
    ));
  }

  alertUserExists(BuildContext context) {
    // set up the button
    Widget okButton = FlatButton(
      child: Text("OK"),
      onPressed: () {
        Navigator.pop(context);
      },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text("Triviaholic found a problem!"),
      content: Text("This username is already used"),
      actions: [
        okButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  Widget createProfileButton(context) {
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
                          username: editController.text,
                          image: currentImage.path));
              print(userNameExists);
              (userNameExists)
                  ? alertUserExists(context)
                  : Navigator.pushNamed(context, '/start');
              ;
            }),
      ),
    );
  }
}
