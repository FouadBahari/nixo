import 'package:dartz/dartz.dart';
import 'package:nixo/core/error/failure.dart';
import 'package:nixo/core/usecase/Usecase.dart';
import 'package:nixo/features/tasks/domain/entities/task.dart';
import 'package:nixo/features/tasks/domain/repositories/tasks_repo.dart';

class GetTasksUseCase implements Usecase<List<TaskEntity>, NoParams> {
  final TasksRepository tasksRepository;
  GetTasksUseCase({required this.tasksRepository});
  @override
  Future<Either<Failure, List<TaskEntity>>> call(params) {
    return tasksRepository.getTasks();
  }
}
