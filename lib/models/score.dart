class Score {
  final String winner;
  final Map<String, dynamic> fullTime;

  Score({
    required this.winner,
    required this.fullTime,
  });

  factory Score.fromJson(Map<String, dynamic> json) {
    return Score(
      winner: json['winner'] ?? '',
      fullTime: json['fullTime'] ?? const {},
    );
  }
}
