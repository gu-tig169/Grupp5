import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:triviaholic/colors/CustomColors.dart';
import 'package:triviaholic/model/Player.dart';
import 'package:triviaholic/state/PlayerState.dart';
import 'package:triviaholic/view/widgets/navbar.dart';
import 'package:triviaholic/view/widgets/gradient.dart';

class SelectProfileView extends StatelessWidget {
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Gradienter(
            widget: Column(
              children: [
                spaceBetween(140),
                appLogo(),
                //  spaceBetween(),
                selectProfileText(),
                usernameTextField("Enter your username.", usernameController),
                passwordTextField("Enter your password.", passwordController),
                spaceBetween(50),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    loginButton(context, "Sign in"),
                    newProfileButton(context, "Create User"),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  /* Widget profileDropDown(List<Player> list, BuildContext context) {
    return Container(
        margin: EdgeInsets.only(top: 10, left: 40, right: 40),
        decoration: BoxDecoration(
            border: Border.all(width: 1.5, color: brunsWickGreen),
            borderRadius: BorderRadius.all(Radius.circular(20.0))),
        child: DropdownButton<String>(
          dropdownColor: nyanza,
          isExpanded: true,
          iconSize: 50,
          icon: Icon(
            Icons.arrow_drop_down,
            color: brunsWickGreen,
          ),
          iconEnabledColor: darkJungleGreen,
          items: list
              .map((userItem) => DropdownMenuItem<String>(
                      child: Row(children: [
                        Container(
                          margin: EdgeInsets.only(
                            left: 8.8,
                          ),
                          child: Text(userItem.username.toString(),
                              style: TextStyle(fontSize: 22)),
                        ),
                      ]),
                      value: userItem.username)
                  // klura här sen
                  )
              .toList(),
          onChanged: (value) {
            Provider.of<PlayerState>(context, listen: false)
                .setCurrentUser(value, "password");
            Navigator.pushNamed(context, '/start');
          },
          hint: Container(
            margin: EdgeInsets.only(
              left: 8.8,
            ),
            child: (Text(
              'Choose profile',
              style: TextStyle(fontStyle: FontStyle.italic),
            )),
          ),
        ));
  } */

  Widget usernameTextField(String hint, TextEditingController controller) {
    return Container(
      //decoration: BoxDecoration(color: Colors.white),
      margin: EdgeInsets.only(
        right: 40,
        left: 40,
        bottom: 10,
      ),
      child: TextField(
        obscureText: false,
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

  Widget passwordTextField(String hint, TextEditingController controller) {
    return Container(
      //decoration: BoxDecoration(color: Colors.white),
      margin: EdgeInsets.only(
        right: 40,
        left: 40,
        bottom: 10,
      ),
      child: TextField(
        obscureText: true,
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

  alertWrongCredentials(BuildContext context) {
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
      content: Text("Wrong username or password."),
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

  Widget appLogo() {
    return Center(
        child: CircleAvatar(
      radius: 70,
      backgroundImage: AssetImage('assets/triviaholic_logo.png'),
    ));
  }

  Widget selectProfileText() {
    return Container(
      margin: EdgeInsets.only(bottom: 50, top: 30),
      child: Text(
        'Log in',
        style: TextStyle(
            fontSize: 36, fontWeight: FontWeight.w300, color: darkJungleGreen),
      ),
    );
  }

  Widget newProfileButton(BuildContext context, String text) {
    return Container(
      margin: EdgeInsets.only(bottom: 50, top: 50, left: 5, right: 5),
      alignment: Alignment.bottomCenter,
      child: SizedBox(
        width: 180,
        height: 70,
        child: RaisedButton(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
                side: BorderSide(color: customPink)),
            color: customPink,
            child: Text(
              text,
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.w300),
            ),
            onPressed: () {
              Navigator.pushNamed(context, '/create');
            }),
      ),
    );
  }

  Widget loginButton(BuildContext context, String text) {
    return Container(
      margin: EdgeInsets.only(bottom: 50, top: 50, left: 5, right: 5),
      alignment: Alignment.bottomCenter,
      child: SizedBox(
        width: 180,
        height: 70,
        child: RaisedButton(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
                side: BorderSide(color: customPink)),
            color: customPink,
            child: Text(
              text,
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.w300),
            ),
            onPressed: () {
              bool correctCredentials =
                  Provider.of<PlayerState>(context, listen: false)
                      .setCurrentUser(
                          usernameController.text, passwordController.text);

              correctCredentials
                  ? Navigator.pushNamed(context, "/start")
                  : alertWrongCredentials(context);
            }),
      ),
    );
  }
}

Widget spaceBetween(double height) {
  return SizedBox(height: height);
}
