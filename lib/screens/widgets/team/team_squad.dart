import 'package:bt_football/bloc/bt_football_bloc.dart';
import 'package:bt_football/bloc/bt_football_state.dart';
import 'package:bt_football/colors.dart';
import 'package:bt_football/models/squad.dart';
import 'package:bt_football/strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TeamSquadWidget extends StatelessWidget {
  const TeamSquadWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return BlocBuilder<BTFootballBloc, BTFootballState>(
      builder: (BuildContext context, BTFootballState state) {
        if (state is ProcessedState) {
          return Padding(
            padding: EdgeInsets.only(left: size.height * .09),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  AppStrings.headingTeamSquad.toUpperCase(),
                  style: const TextStyle(
                    color: AppColors.appBlack,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 2.5,
                ),
                ListView(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  padding: EdgeInsets.only(
                    bottom: size.height * .02,
                  ),
                  children: state.team.squad!
                      .map(
                        (Squad squad) => Padding(
                          padding: const EdgeInsets.only(bottom: 3.0),
                          child: Text('${squad.name}, ${squad.position}'),
                        ),
                      )
                      .toList(),
                ),
              ],
            ),
          );
        }

        return Container();
      },
    );
  }
}
