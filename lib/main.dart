import 'package:flutter/material.dart';
import 'package:triviaholic/route_handler.dart';
import 'package:triviaholic/state/PlayerState.dart';
import 'package:provider/provider.dart';

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
