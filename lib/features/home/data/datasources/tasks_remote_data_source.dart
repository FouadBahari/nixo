import 'package:nixo/features/tasks/data/models/task_model.dart';

abstract class TasksRemoteDataSource{
  Future<List<TaskModel>> getRemoteTasks();
}