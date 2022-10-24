import 'package:nixo/features/tasks/data/models/task_model.dart';

abstract class TasksLocalDataSource{
  Future<List<TaskModel>> getLocalTasks();
}

class TasksLocalDataSourceImpl implements TasksLocalDataSource{
  @override
  Future<List<TaskModel>> getLocalTasks() {
    throw UnimplementedError();
  }
}