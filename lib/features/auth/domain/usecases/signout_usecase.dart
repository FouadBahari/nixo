import 'package:dartz/dartz.dart';
import 'package:nixo/core/error/failure.dart';
import 'package:nixo/core/usecase/Usecase.dart';
import 'package:nixo/features/auth/domain/repositories/auth_repo.dart';

class SignOutUseCase implements Usecase<void, NoParams> {
  final AuthRepo authRepo;
  SignOutUseCase({required this.authRepo});
  
  @override
  Future<Either<Failure, void>> call(params) {
    return authRepo.signOut();
  }
}
