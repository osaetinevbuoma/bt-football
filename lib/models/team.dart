import 'package:bt_football/models/squad.dart';

class Team {
  final int id;
  final String name;
  final String? crestUrl;
  final String? address;
  final String? website;
  final String? email;
  final String? founded;
  final String? clubColors;
  final String? venue;
  final int? wins;
  final int? losses;
  final int? draws;
  final List<Squad> squad;

  Team({
    required this.id,
    required this.name,
    this.crestUrl,
    this.address,
    this.website,
    this.email,
    this.clubColors,
    this.founded,
    this.venue,
    this.wins,
    this.losses,
    this.draws,
    required this.squad,
  });

  factory Team.fromJson(Map<String, dynamic> json) {
    return Team(
      id: json['id'],
      name: json['name'],
      crestUrl: json['crestUrl'] ?? '',
      address: json['address'] ?? '',
      website: json['website'] ?? '',
      email: json['email'] ?? '',
      clubColors: json['clubColors'] ?? '',
      founded: json['founded'] ?? '',
      venue: json['venue'] ?? '',
      squad: json['squad'],
    );
  }
}
