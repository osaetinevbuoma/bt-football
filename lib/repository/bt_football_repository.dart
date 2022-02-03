import 'package:bt_football/models/match.dart';
import 'package:bt_football/models/team.dart';
import 'package:bt_football/services/bt_football_service.dart';

class BTFootballRepository {
  final BTFootballService btFootballService;

  const BTFootballRepository({required this.btFootballService});

  Future<List<Match>> fetchMatches(String dateFrom, String dateTo) =>
      btFootballService.fetchMatches(dateFrom, dateTo);
  Future<Team> fetchTeam(int id) => btFootballService.fetchTeam(id);
}
