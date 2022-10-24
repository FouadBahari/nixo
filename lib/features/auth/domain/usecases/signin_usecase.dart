import 'package:dartz/dartz.dart';
import 'package:nixo/core/error/failure.dart';
import 'package:nixo/core/usecase/Usecase.dart';
import 'package:nixo/features/auth/domain/entities/user_entity.dart';
import 'package:nixo/features/auth/domain/repositories/auth_repo.dart';

class SignInUseCase implements Usecase<void, UserEntity> {
  final AuthRepo authRepo;
  SignInUseCase({required this.authRepo});
  
  @override
  Future<Either<Failure, void>> call(params) {
    return authRepo.signIn(params);
  }
}
