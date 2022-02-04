import 'package:bt_football/models/squad.dart';

class Team {
  final int id;
  final String name;
  final String? crestUrl;
  final String? address;
  final String? website;
  final String? email;
  final String? phone;
  final int? founded;
  final String? clubColors;
  final String? venue;
  int wins = 0;
  int losses = 0;
  int draws = 0;
  final List<Squad>? squad;

  Team({
    required this.id,
    required this.name,
    this.crestUrl,
    this.address,
    this.website,
    this.email,
    this.phone,
    this.clubColors,
    this.founded,
    this.venue,
    this.squad,
  });

  factory Team.fromJson(Map<String, dynamic> json) {
    return Team(
      id: json['id'],
      name: json['name'],
      crestUrl: json['crestUrl'] ?? '',
      address: json['address'] ?? '',
      website: json['website'] ?? '',
      email: json['email'] ?? '',
      phone: json['phone'] ?? '',
      clubColors: json['clubColors'] ?? '',
      founded: json['founded'] ?? 0,
      venue: json['venue'] ?? '',
      squad: json['squad'] != null && json['squad'].length > 0
          ? _convertJsonSquadArray(json['squad'])
          : const [],
    );
  }
}

List<Squad> _convertJsonSquadArray(squad) {
  List<Squad> squadList = [];
  for (var player in squad) {
    squadList.add(Squad.fromJson(player));
  }

  return squadList;
}
