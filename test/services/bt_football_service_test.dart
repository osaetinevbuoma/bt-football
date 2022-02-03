import 'package:bt_football/services/bt_football_service.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Test BT Football service methods', () {
    test('Fetch matches based on duration of the last 30 days', () async {
      final service = BTFootballService();
      List<Match> matches =
          (await service.fetchMatches('2022-01-03', '2022-02-03'))
              .cast<Match>();

      // expect(matches.length, matcher)
    });
  });
}
