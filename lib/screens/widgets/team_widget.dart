import 'package:bt_football/screens/widgets/team/team_details.dart';
import 'package:bt_football/screens/widgets/team/team_info.dart';
import 'package:bt_football/screens/widgets/team/team_squad.dart';
import 'package:flutter/material.dart';

class TeamWidget extends StatelessWidget {
  const TeamWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const <Widget>[
            TeamInfoWidget(),
            TeamDetailsWidget(),
            TeamSquadWidget(),
          ],
        ),
      ),
    );
  }
}
