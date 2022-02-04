import 'package:bt_football/bloc/bt_football_bloc.dart';
import 'package:bt_football/bloc/bt_football_state.dart';
import 'package:bt_football/screens/widgets/team_widget.dart';
import 'package:bt_football/strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(AppStrings.appTitle),
      ),
      body: BlocBuilder<BTFootballBloc, BTFootballState>(
        builder: (BuildContext context, BTFootballState state) {
          if (state is ProcessingState) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          if (state is ErrorState) {
            return Center(
              child: RichText(
                text: TextSpan(
                  text: state.message,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.red),
                ),
              ),
            );
          }

          if (state is ProcessedState) {
            return const TeamWidget();
          }

          return Container();
        },
      ),
    );
  }
}
