import 'package:nixo/features/tasks/data/models/task_model.dart';

abstract class TasksLocalDataSource{
  Future<List<TaskModel>> getLocalTasks();
}