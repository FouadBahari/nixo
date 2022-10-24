import 'package:dartz/dartz.dart';
import 'package:nixo/core/error/failure.dart';
import 'package:nixo/core/usecase/Usecase.dart';
import 'package:nixo/features/auth/domain/repositories/auth_repo.dart';

class GetCurrentUidUseCase implements Usecase<String, NoParams> {
  final AuthRepo authRepo;
  GetCurrentUidUseCase({required this.authRepo});
  
  @override
  Future<Either<Failure, String>> call(params) {
    return authRepo.getCurrentUId();
  }
}
