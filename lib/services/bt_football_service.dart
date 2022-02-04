import 'dart:convert';

import 'package:bt_football/constants.dart';
import 'package:bt_football/models/match.dart';
import 'package:bt_football/models/team.dart';
import 'package:http/http.dart' as http;

class BTFootballService {
  final Map<String, String> headers = {
    "Content-Type": "application/json; charset=UTF-8",
    "X-AUTH-TOKEN": AppConstants.xAuthToken
  };

  Future<List<Match>> fetchMatches(String dateFrom, String dateTo) async {
    final response = await http.get(
        Uri.parse(
            "${AppConstants.apiUrl}/competitions/2021/matches?dateFrom=$dateFrom&dateTo=$dateTo"),
        headers: headers);
    if (response.statusCode == AppConstants.httpStatusOK) {
      List<Match> matches = [];
      var matchesList = jsonDecode(response.body)['matches'];
      for (var match in matchesList) {
        matches.add(Match.fromJson(match));
      }

      return matches;
    } else {
      throw Exception("Error occurred fetching matches");
    }
  }

  Future<Team> fetchTeam(int id) async {
    final response = await http
        .get(Uri.parse("${AppConstants.apiUrl}/teams/$id"), headers: headers);
    if (response.statusCode == AppConstants.httpStatusOK) {
      return Team.fromJson(jsonDecode(response.body));
    } else {
      throw Exception("Error occurred fetching team details");
    }
  }

  Team determineTeamWithMostWins(List<Match> matches) {
    Map<int, dynamic> teamMap = {};

    for (var match in matches) {
      if (!teamMap.containsKey(match.homeTeam!.id)) {
        teamMap[match.homeTeam!.id] = match.homeTeam;
      }

      if (!teamMap.containsKey(match.awayTeam!.id)) {
        teamMap[match.awayTeam!.id] = match.awayTeam;
      }

      Team homeTeam = teamMap[match.homeTeam!.id];
      Team awayTeam = teamMap[match.awayTeam!.id];

      if (match.score!.winner == "HOME_TEAM") {
        homeTeam.wins += 1;
        awayTeam.losses += 1;
      } else if (match.score!.winner == "AWAY_TEAM") {
        homeTeam.losses += 1;
        awayTeam.wins += 1;
      } else {
        homeTeam.draws += 1;
        awayTeam.draws += 1;
      }

      teamMap[match.homeTeam!.id] = homeTeam;
      teamMap[match.awayTeam!.id] = awayTeam;
    }

    var teams = teamMap.values.toList();
    teams.sort((a, b) => b.wins.compareTo(a.wins));

    return teams.first;
  }
}
