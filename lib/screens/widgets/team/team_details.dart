import 'package:bt_football/bloc/bt_football_bloc.dart';
import 'package:bt_football/bloc/bt_football_state.dart';
import 'package:bt_football/colors.dart';
import 'package:bt_football/strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TeamDetailsWidget extends StatelessWidget {
  const TeamDetailsWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return BlocBuilder<BTFootballBloc, BTFootballState>(
      builder: (BuildContext context, BTFootballState state) {
        if (state is ProcessedState) {
          return Padding(
            padding: EdgeInsets.all(size.height * .02),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  AppStrings.headingBasicInformation.toUpperCase(),
                  style: const TextStyle(
                    color: AppColors.appBlack,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 2.5,
                ),
                Text(
                  '${AppStrings.labelAddress}: ${state.team.address}',
                  style: const TextStyle(color: AppColors.appBlack),
                ),
                const SizedBox(
                  height: 1.5,
                ),
                Text(
                  '${AppStrings.labelWebsite}: ${state.team.website}',
                  style: const TextStyle(color: AppColors.appBlack),
                ),
                const SizedBox(
                  height: 1.5,
                ),
                Text(
                  '${AppStrings.labelFounded}: ${state.team.founded}',
                  style: const TextStyle(color: AppColors.appBlack),
                ),
                const SizedBox(
                  height: 1.5,
                ),
                Text(
                  '${AppStrings.labelEmail}: ${state.team.email}',
                  style: const TextStyle(color: AppColors.appBlack),
                ),
                const SizedBox(
                  height: 1.5,
                ),
                Text(
                  '${AppStrings.labelPhone}: ${state.team.phone}',
                  style: const TextStyle(color: AppColors.appBlack),
                ),
                const SizedBox(
                  height: 1.5,
                ),
                Text(
                  '${AppStrings.labelClubColors}: ${state.team.clubColors}',
                  style: const TextStyle(color: AppColors.appBlack),
                ),
                const SizedBox(
                  height: 1.5,
                ),
                Text(
                  '${AppStrings.labelVenue}: ${state.team.venue}',
                  style: const TextStyle(color: AppColors.appBlack),
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
