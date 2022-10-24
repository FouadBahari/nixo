import 'package:nixo/features/tasks/domain/entities/task.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class TaskModel extends TaskEntity {
  const TaskModel({
    required String id,
    required String uid,
    required String groupId,
    required String goalId,
    required String flag,
    required DateTime date,
    required Duration duration,
    required DateTime reminder,
    required DateTime repeat,
    required bool isFinished,
  }) : super(
            id: id,
            uid: uid,
            goalId: goalId,
            groupId: groupId,
            date: date,
            duration: duration,
            flag: flag,
            isFinished: isFinished,
            reminder: reminder,
            repeat: repeat);

  factory TaskModel.fromSnapshot(DocumentSnapshot snapshot) {
    return TaskModel(
      id: snapshot.get('id'),
      uid: snapshot.get('uid'),
      groupId: snapshot.get('groupId'),
      goalId: snapshot.get('goalId'),
      flag: snapshot.get('flag'),
      date: snapshot.get('date'),
      duration: snapshot.get('duration'),
      reminder: snapshot.get('reminder'),
      repeat: snapshot.get('repeat'),
      isFinished: snapshot.get('isFinished'),
    );
  }

  Map<String, dynamic> toDocument() {
    return {
      "id": id,
      "uid": uid,
      "groupId": groupId,
      "goalId": goalId,
      "flag": flag,
      "date": date,
      "duration": duration,
      "reminder": reminder,
      "repeat": repeat,
      "isFinished": isFinished,
    };
  }
}
