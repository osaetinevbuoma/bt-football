import 'package:bt_football/models/team.dart';
import 'package:equatable/equatable.dart';

class BTFootballState extends Equatable {
  const BTFootballState();

  @override
  List<Object?> get props => [];
}

class BTFootballInitial extends BTFootballState {}

class ProcessingState extends BTFootballState {}

class ErrorState extends BTFootballState {
  final String message;

  const ErrorState({required this.message});

  @override
  List<Object?> get props => [message];
}

class ProcessedState extends BTFootballState {
  final Team team;

  const ProcessedState({required this.team});

  @override
  List<Object?> get props => [team];
}
