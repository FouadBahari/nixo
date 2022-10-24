import 'package:dartz/dartz.dart';
import 'package:nixo/core/error/failure.dart';
import 'package:nixo/core/usecase/Usecase.dart';
import 'package:nixo/features/auth/domain/repositories/auth_repo.dart';

class GoogleAuthUseCase implements Usecase<void, NoParams> {
  final AuthRepo authRepo;
  GoogleAuthUseCase({required this.authRepo});

  @override
  Future<Either<Failure, void>> call(noParams) {
    return authRepo.googleAuth();
  }
}
