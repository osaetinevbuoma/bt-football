class Squad {
  final int id;
  final String name;
  final String position;

  Squad({required this.id, required this.name, required this.position});

  factory Squad.fromJson(Map<String, dynamic> json) {
    return Squad(
      id: json['id'],
      name: json['name'] ?? 'Unknown Name',
      position: json['position'] ?? 'Unknown Position',
    );
  }
}
