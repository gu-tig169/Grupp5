import 'package:flutter/material.dart';
import 'package:triviaholic/assets/CustomColors.dart';
import 'package:triviaholic/view/widgets/navbar.dart';

class LeaderboardView extends StatefulWidget {
  @override
  _LeaderboardViewState createState() => _LeaderboardViewState();
}

class _LeaderboardViewState extends State<LeaderboardView> {
  final list = ['Svenne', 'Babbe', 'Klasse'];

  final List<String> _filterList = ['Easy', 'Medium', 'Hard'];
  String _filterValue = 'All';

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
                _filterValue = value;
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
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 1, horizontal: 0),
          child: Card(
            child: ListTile(
              leading: CircleAvatar(
                backgroundImage: NetworkImage(
                    'https://pickaface.net/gallery/avatar/20150122_232640_100_simple.png'),
              ),
              title: Text(list[index]),
            ),
          ),
        );
      },
    );
  }
}

/*
class LeaderBoard extends StatelessWidget {
  // LeaderBoard(this.list);

  @override
  Widget build(BuildContext context) {
    final list = ['1', '2', '3', '4'];
    return ListView.builder(
        itemCount: list.length,
        itemBuilder: (context, index) {
          return ListTile(title: Text(list[index]));
        });

    //listItem(list[index], context));
  }
}

new DropdownButton(
      items: <String>['Easy', 'Medium', 'Hard'].map((String value) {
        return new DropdownMenuItem(
          value: value,
          child: new Text(value),
        );
      }).toList(),
      onChanged: (_) {},
    );

*/

/* Widget listItem(index, context) {
    return ListTile(
      leading: Image(
        image: NetworkImage(
            'https://cdn.dribbble.com/users/499731/screenshots/3435273/proff.png'),
      ),
      title: Text('Noa'),
      trailing: Text('10 ynkla poäng'),
    );
  } */
