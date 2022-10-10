part of 'pomodoro_cubit.dart';

abstract class PomodoroState extends Equatable {
  const PomodoroState();

  @override
  List<Object> get props => [];
}

class PomodoroInitial extends PomodoroState {}
