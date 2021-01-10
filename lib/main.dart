import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:triviaholic/route/route_handler.dart';
import 'package:triviaholic/state/player_state.dart';

void main() {
  var state = PlayerState();
  runApp(ChangeNotifierProvider(
      create: (context) => state,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: "/",
        onGenerateRoute: RouteHandler.generateRoute,
      )));
}
