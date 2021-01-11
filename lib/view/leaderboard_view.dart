import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:triviaholic/colors/custom_colors.dart';
import 'package:triviaholic/model/player.dart';
import 'package:triviaholic/state/player_state.dart';
import 'package:triviaholic/view/widgets/gradient.dart';
import 'package:triviaholic/view/widgets/navbar.dart';

class LeaderboardView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: turquoiseGreen,
        title: Text('Leaderboard'),
      ),
      body: Gradienter(
        widget: Center(
          child: Consumer<PlayerState>(
              builder: (context, state, child) =>
                  _listViewWidget(state.sortbyScore())),
        ),
      ),
      bottomNavigationBar: BottomNavBar(),
    );
  }

  Widget _listViewWidget(List<Player> list) {
    return ListView.builder(
      itemCount: list.length,
      itemBuilder: (context, index) => _listItem(
          list[index].username, list[index].image, list[index].bestScore),
    );
  }

  Widget _listItem(String username, String image, int bestScore) {
    return Padding(
        padding: const EdgeInsets.symmetric(vertical: 1, horizontal: 0),
        child: Card(
            child: ListTile(
          leading: CircleAvatar(
            backgroundImage: AssetImage(image),
          ),
          title: Text(username),
          trailing: Text(bestScore.toString()),
        )));
  }
}
