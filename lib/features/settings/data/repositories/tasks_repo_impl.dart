import 'package:nixo/core/error/exception.dart';
import 'package:nixo/core/error/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:nixo/core/network/network_infos.dart';
import 'package:nixo/features/tasks/data/datasources/tasks_local_data_source.dart';
import 'package:nixo/features/tasks/data/models/task_model.dart';
import 'package:nixo/features/tasks/domain/repositories/tasks_repo.dart';

class TasksRepositoryImpl extends TasksRepository{
  final NetworkInfos networkInfos;
  final TasksLocalDataSource tasksLocalDataSource;
  // final TasksRemoteDataSource tasksRemoteDataSource;

  TasksRepositoryImpl({required this.networkInfos,required this.tasksLocalDataSource});

  @override
  Future<Either<Failure, List<TaskModel>>> getTasks() async{
    try{
          final localDataSource = await tasksLocalDataSource.getLocalTasks();
    return Right(localDataSource);
    }on LocalException{
      return Left(LocalFailure());
    }
  }
  
}