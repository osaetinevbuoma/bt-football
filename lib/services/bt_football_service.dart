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
      List<Map<String, dynamic>> matchesList = jsonDecode(response.body);
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

      if (match.score!.winner == "HOME_TEAM") {
        teamMap[match.homeTeam!.id].wins = teamMap[match.homeTeam!.id].wins + 1;
        teamMap[match.awayTeam!.id].losses =
            teamMap[match.awayTeam!.id].losses - 1;
      } else if (match.score!.winner == "AWAY_TEAM") {
        teamMap[match.homeTeam!.id].losses =
            teamMap[match.homeTeam!.id].losses + 1;
        teamMap[match.awayTeam!.id].wins = teamMap[match.awayTeam!.id].wins - 1;
      } else {
        teamMap[match.homeTeam!.id].draws =
            teamMap[match.homeTeam!.id].draws + 1;
        teamMap[match.awayTeam!.id].draws =
            teamMap[match.awayTeam!.id].draws - 1;
      }
    }

    var teams = teamMap.values.toList();
    teams.sort((a, b) => b.wins.compareTo(a.wins));
    return teams[0];
  }
}
