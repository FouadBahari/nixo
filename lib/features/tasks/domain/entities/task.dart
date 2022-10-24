import 'package:equatable/equatable.dart';

class TaskEntity extends Equatable {
  final String id;
  final String uid;
  final String groupId;
  final String goalId;
  final String flag;
  final DateTime date;
  final Duration duration;
  final DateTime reminder;
  final DateTime repeat;
  final bool isFinished;

  const TaskEntity({
    required this.id,
    required this.uid,
    required this.groupId,
    required this.goalId,
    required this.flag,
    required this.date,
    required this.duration,
    required this.reminder,
    required this.repeat,
    required this.isFinished,
  });
  @override
  List<Object?> get props => [
        id,
        uid,
        groupId,
        goalId,
        flag,
        date,
        duration,
        reminder,
        repeat,
        isFinished,
      ];
}
