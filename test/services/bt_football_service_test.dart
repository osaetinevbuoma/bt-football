import 'package:bt_football/models/match.dart';
import 'package:bt_football/models/team.dart';
import 'package:bt_football/services/bt_football_service.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Test BT Football service methods', () {
    test('Fetch matches based on duration of the last 30 days', () async {
      final service = BTFootballService();
      List<Match> matches =
          (await service.fetchMatches('2022-01-04', '2022-02-03'))
              .cast<Match>();

      expect(matches.isNotEmpty, true);
    });

    test('Determine team with most wins', () async {
      final service = BTFootballService();
      List<Match> matches =
          (await service.fetchMatches('2022-01-04', '2022-02-03'))
              .cast<Match>();
      Team team = service.determineTeamWithMostWins(matches);

      expect(team.name.isNotEmpty, true);
      expect(team.founded?.isNaN, false);
      expect(team.wins.isNaN, false);
      expect(team.losses.isNaN, false);
      expect(team.draws.isNaN, false);
    });

    test('Fetch team squad details', () async {
      final service = BTFootballService();
      Team team = await service.fetchTeam(57);

      expect(team.name.isNotEmpty, true);
      expect(team.name.isNotEmpty, true);
      expect(team.clubColors?.isNotEmpty, true);
      expect(team.founded?.isNaN, false);
      expect(team.squad?.isNotEmpty, true);
    });
  });
}
