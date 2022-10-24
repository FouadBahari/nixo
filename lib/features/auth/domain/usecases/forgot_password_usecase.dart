import 'package:dartz/dartz.dart';
import 'package:nixo/core/error/failure.dart';
import 'package:nixo/core/usecase/Usecase.dart';
import 'package:nixo/features/auth/domain/repositories/auth_repo.dart';

class ForgotPasswordUseCase implements Usecase<void, String> {
  final AuthRepo authRepo;
  ForgotPasswordUseCase({required this.authRepo});

  @override
  Future<Either<Failure, void>> call(email) {
    return authRepo.forgotPassword(email);
  }
}
