import 'package:dartz/dartz.dart';
import 'package:nixo/core/error/failure.dart';
import 'package:nixo/core/usecase/Usecase.dart';
import 'package:nixo/features/auth/domain/repositories/auth_repo.dart';

class IsSignInUseCase implements Usecase<bool, NoParams> {
  final AuthRepo authRepo;
  IsSignInUseCase({required this.authRepo});
  
  @override
  Future<Either<Failure, bool>> call(params) {
    return authRepo.isSignIn();
  }
}
