import 'package:nixo/core/error/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:nixo/core/usecase/Usecase.dart';
import 'package:nixo/features/onboarding/domain/repositories/on_boarding_repo.dart';

class IsFirstTimeUsecase extends Usecase<bool, NoParams> {
  OnBoardingRepo onBoardingRepo;

  IsFirstTimeUsecase({required this.onBoardingRepo});

  @override
  Future<Either<Failure, bool>> call(NoParams params) {
    return onBoardingRepo.isFirstTime();
  }
}
