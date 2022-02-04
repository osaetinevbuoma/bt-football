import 'package:bt_football/models/score.dart';
import 'package:bt_football/models/team.dart';

class Match {
  final int id;
  final DateTime utcDate;
  final Score? score;
  final Team? homeTeam;
  final Team? awayTeam;

  Match({
    required this.id,
    required this.utcDate,
    this.score,
    this.homeTeam,
    this.awayTeam,
  });

  factory Match.fromJson(Map<String, dynamic> json) {
    return Match(
      id: json['id'],
      utcDate: _convertJsonDateToDatetime(json['utcDate']),
      score: Score.fromJson(json['score']),
      homeTeam: Team.fromJson(json['homeTeam']),
      awayTeam: Team.fromJson(json['awayTeam']),
    );
  }
}

DateTime _convertJsonDateToDatetime(String jsonDate) {
  var jsonDateArray = jsonDate.split('T');
  return DateTime.parse(jsonDateArray[0]);
}
