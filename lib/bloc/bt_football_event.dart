import 'package:equatable/equatable.dart';

class BTFootballEvent extends Equatable {
  const BTFootballEvent();

  @override
  List<Object?> get props => [];
}

class FetchMatchesEvent extends BTFootballEvent {
  final String dateFrom;
  final String dateTo;

  const FetchMatchesEvent({
    required this.dateFrom,
    required this.dateTo,
  });

  @override
  List<Object?> get props => [dateFrom, dateTo];
}

class FetchTeamEvent extends BTFootballEvent {
  final int id;

  const FetchTeamEvent({required this.id});

  @override
  List<Object?> get props => [id];
}
