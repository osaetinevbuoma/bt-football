import 'package:bt_football/bloc/bt_football_bloc.dart';
import 'package:bt_football/bloc/bt_football_state.dart';
import 'package:bt_football/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class TeamInfoWidget extends StatelessWidget {
  const TeamInfoWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return BlocBuilder<BTFootballBloc, BTFootballState>(
      builder: (BuildContext context, BTFootballState state) {
        if (state is ProcessedState) {
          return Padding(
            padding: EdgeInsets.only(top: size.height * .05),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SvgPicture.network(
                  state.team.crestUrl!,
                  height: size.height * .20,
                ),
                const SizedBox(
                  height: 10.0,
                ),
                RichText(
                  text: TextSpan(
                    text: state.team.name,
                    style: const TextStyle(color: Colors.black),
                  ),
                  textScaleFactor: 2.0,
                ),
                const SizedBox(
                  height: 10.0,
                ),
                RichText(
                  textScaleFactor: 1.5,
                  text: TextSpan(
                    text: 'W: ${state.team.wins} ',
                    style: const TextStyle(color: AppColors.appBlack),
                    children: <TextSpan>[
                      TextSpan(
                        text: 'L: ${state.team.losses} ',
                        style: const TextStyle(color: AppColors.appBlack),
                      ),
                      TextSpan(
                        text: 'D: ${state.team.draws}',
                        style: const TextStyle(color: AppColors.appBlack),
                      ),
                    ],
                  ),
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
