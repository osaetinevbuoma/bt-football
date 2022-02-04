import 'package:bt_football/bloc/bt_football_bloc.dart';
import 'package:bt_football/bloc/bt_football_event.dart';
import 'package:bt_football/repository/bt_football_repository.dart';
import 'package:bt_football/screens/home_screen.dart';
import 'package:bt_football/services/bt_football_service.dart';
import 'package:bt_football/strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

final BTFootballService btFootballService = BTFootballService();
final BTFootballRepository btFootballRepository = BTFootballRepository(
  btFootballService: btFootballService,
);

void main() {
  runApp(const BTFootballApp());
}

class BTFootballApp extends StatelessWidget {
  const BTFootballApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    DateTime dateTo = DateTime.now();
    DateTime dateFrom = dateTo.subtract(const Duration(days: 30));
    DateFormat formatter = DateFormat('yyyy-MM-dd');

    return MaterialApp(
      title: AppStrings.appTitle,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: RepositoryProvider<BTFootballRepository>(
        create: (BuildContext context) => btFootballRepository,
        child: BlocProvider<BTFootballBloc>(
          create: (BuildContext context) => BTFootballBloc(
            btFootballService,
            btFootballRepository,
          )..add(
              FetchMatchesEvent(
                dateFrom: formatter.format(dateFrom),
                dateTo: formatter.format(dateTo),
              ),
            ),
          child: const HomeScreen(),
        ),
      ),
    );
  }
}
