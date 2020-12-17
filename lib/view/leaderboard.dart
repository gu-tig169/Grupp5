import 'package:flutter/material.dart';
import 'package:triviaholic/colors/CustomColors.dart';
import 'package:triviaholic/view/widgets/navbar.dart';

class LeaderboardView extends StatefulWidget {
  @override
  _LeaderboardViewState createState() => _LeaderboardViewState();
}

class _LeaderboardViewState extends State<LeaderboardView> {
  final list = ['Sverre', 'Klabbe', 'Klasse'];

  final List<String> _filterList = ['Easy', 'Medium', 'Hard'];
  // String _filterValue = 'All';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: illuminatingEmerald,
        title: Text('Leaderboard'),
        actions: <Widget>[
          PopupMenuButton<String>(
            onSelected: (String value) {
              setState(() {
                //  _filterValue = value;
              });
            },
            itemBuilder: (BuildContext context) {
              return _filterList
                  .map((filter) =>
                      PopupMenuItem(value: filter, child: Text(filter)))
                  .toList();
            },
          )
        ],
      ),
      body: Center(child: listViewWidget()),
      bottomNavigationBar: BottomNavBar(),
    );
  }

  Widget listViewWidget() {
    return ListView.builder(
      itemCount: list.length,
      itemBuilder: (context, index) => _listItem(list[index], context),
    );
  }

  Widget _listItem(list, context) {
    return Padding(
        padding: const EdgeInsets.symmetric(vertical: 1, horizontal: 0),
        child: Card(
            child: ListTile(
          leading: CircleAvatar(
            backgroundImage: NetworkImage(
                'https://cdn.dribbble.com/users/499731/screenshots/3435273/proff.png'),
          ),
          title: Text(list),
          trailing: Text('10 ynkliga poäng'),
        )));
  }
}
