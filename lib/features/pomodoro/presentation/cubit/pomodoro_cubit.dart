import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'pomodoro_state.dart';

class PomodoroCubit extends Cubit<PomodoroState> {
  PomodoroCubit() : super(PomodoroInitial());
}
