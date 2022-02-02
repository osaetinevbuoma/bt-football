class Squad {
  final int id;
  final String name;
  final String position;
  final int? wins;
  final int? losses;
  final int? draws;

  Squad({
    required this.id,
    required this.name,
    required this.position,
    this.wins,
    this.losses,
    this.draws,
  });

  factory Squad.fromJson(Map<String, dynamic> json) {
    return Squad(
      id: json['id'],
      name: json['name'],
      position: json['position'],
    );
  }
}
