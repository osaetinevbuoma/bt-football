import 'package:bt_football/models/match.dart';
import 'package:bt_football/models/team.dart';
import 'package:bt_football/repository/bt_football_repository.dart';
import 'package:bt_football/services/bt_football_service.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bt_football_event.dart';
import 'bt_football_state.dart';

class BTFootballBloc extends Bloc<BTFootballEvent, BTFootballState> {
  final BTFootballService _btFootballService;
  final BTFootballRepository _btFootballRepository;

  BTFootballBloc(BTFootballService btFootballService,
      BTFootballRepository btFootballRepository)
      : _btFootballService = btFootballService,
        _btFootballRepository = btFootballRepository,
        super(BTFootballInitial()) {
    on<FetchMatchesEvent>(_mapFetchMatchesEventToState);
  }

  void _mapFetchMatchesEventToState(
      FetchMatchesEvent event, Emitter<BTFootballState> emit) async {
    try {
      emit(ProcessingState());

      List<Match> matches = await _btFootballRepository.fetchMatches(
          event.dateFrom, event.dateTo);
      Team teamWithMostWins =
          _btFootballService.determineTeamWithMostWins(matches);

      Team teamDetails =
          await _btFootballRepository.fetchTeam(teamWithMostWins.id);
      teamDetails.wins = teamWithMostWins.wins;
      teamDetails.losses = teamWithMostWins.losses;
      teamDetails.draws = teamWithMostWins.draws;

      emit(ProcessedState(team: teamDetails));
    } catch (error, stacktrace) {
      if (kDebugMode) {
        print(stacktrace);
      }

      emit(ErrorState(message: error.toString()));
    }
  }
}
