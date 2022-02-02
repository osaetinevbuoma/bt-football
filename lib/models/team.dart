class Team {
  final int id;
  final String name;
  final String crestUrl;
  final String address;
  final String website;
  final String email;
  final String founded;
  final String clubColors;
  final String venue;

  Team({
    required this.id,
    required this.name,
    required this.crestUrl,
    required this.address,
    required this.website,
    required this.email,
    required this.clubColors,
    required this.founded,
    required this.venue,
  });

  factory Team.fromJson(Map<String, dynamic> json) {
    return Team(
      id: json['id'],
      name: json['name'],
      crestUrl: json['crestUrl'],
      address: json['address'],
      website: json['website'],
      email: json['email'],
      clubColors: json['clubColors'],
      founded: json['founded'],
      venue: json['venue'],
    );
  }
}
