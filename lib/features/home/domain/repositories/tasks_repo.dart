import 'package:dartz/dartz.dart';
import 'package:nixo/core/error/failure.dart';
import 'package:nixo/features/tasks/domain/entities/task.dart';

abstract class TasksRepository{
  Future<Either<Failure, List<TaskEntity>>> getTasks();
}