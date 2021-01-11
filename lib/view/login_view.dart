import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:triviaholic/colors/custom_colors.dart';
import 'package:triviaholic/state/player_state.dart';
import 'package:triviaholic/view/widgets/common_widgets.dart';
import 'package:triviaholic/view/widgets/gradient.dart';

// ignore: must_be_immutable
class LoginView extends StatelessWidget {
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
                spaceBetween(60),
                appLogo(),
                spaceBetween(40),
                headerText("Log In"),
                spaceBetween(50),
                _usernameTextField("Enter your username.", usernameController),
                _passwordTextField("Enter your password.", passwordController),
                spaceBetween(10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _loginButton(context, "Sign in"),
                    _newProfileButton(context, "Create User"),
                  ],
                ),
                spaceBetween(110),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _usernameTextField(String hint, TextEditingController controller) {
    return Container(
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

  Widget _passwordTextField(String hint, TextEditingController controller) {
    return Container(
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

  Widget _newProfileButton(BuildContext context, String text) {
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

  Widget _loginButton(BuildContext context, String text) {
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
                  ? Navigator.pushNamedAndRemoveUntil(
                      context, "/start", (Route<dynamic> route) => false)
                  : alert(context, "Triviaholic found a problem!",
                      "Wrong username or password.");
            }),
      ),
    );
  }
}
