import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:triviaholic/assets/CustomColors.dart';
import 'package:triviaholic/view/widgets/navbar.dart';
import 'package:triviaholic/view/widgets/gradient.dart';

class CreateProfileView extends StatefulWidget {
  @override
  _CreateProfileViewState createState() => _CreateProfileViewState();
}

class _CreateProfileViewState extends State<CreateProfileView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: nyanza,
      resizeToAvoidBottomInset: false,
      body: Center(
          child: Gradienter(
        widget: Column(
          children: [
            spaceBetween(120),
            userTextField('Username'),
            spaceBetween(40),
            dropDown(),
            spaceBetween(40),
            profileImage(),
            spaceBetween(40),
            createProfileButton(),
          ],
        ),
      )),
      bottomNavigationBar: BottomNavBar(),
    );
  }

  Widget userTextField(String hint) {
    return Container(
      //decoration: BoxDecoration(color: Colors.white),
      margin: EdgeInsets.only(right: 40, left: 40),
      child: TextField(
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
    List<String> mockObjects = [
      'Spongebob',
      'Leo DiCaprio',
      'Jake Gyllenhall',
      'Niko'
    ];
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
          items: mockObjects
              .map((avatar) => DropdownMenuItem(
                    child: Row(
                      children: [
                        Container(width: 6),
                        Icon(Icons.portrait_rounded),
                        Container(
                          width: 10,
                        ),
                        Text(
                          avatar,
                          style: TextStyle(fontSize: 22),
                        ),
                      ],
                    ),
                    //value: avatar,
                  ))
              .toList(),
          onChanged: (value) {},
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
      backgroundImage: NetworkImage(
          'https://img.buzzfeed.com/buzzfeed-static/static/2017-08/7/5/asset/buzzfeed-prod-fastlane-02/sub-buzz-12005-1502099529-5.jpg'),
    ));
  }

  Widget createProfileButton() {
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
            onPressed: () {}),
      ),
    );
  }
}
