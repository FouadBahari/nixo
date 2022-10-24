import 'package:nixo/core/error/exception.dart';
import 'package:nixo/core/error/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:nixo/features/onboarding/data/datasources/onboarding_local_data_source.dart';
import 'package:nixo/features/onboarding/domain/repositories/on_boarding_repo.dart';

class OnBoardingRepoImpl extends OnBoardingRepo {
  OnBoardingLocalDataSource onBoardingLocalDataSource;
  OnBoardingRepoImpl({required this.onBoardingLocalDataSource});

  @override
  Future<Either<Failure, bool>> isFirstTime() async {
    try {
      bool isFirstTime = await onBoardingLocalDataSource.isFirstTime();
      return Right(isFirstTime);
    } on LocalException {
      return Left(LocalFailure());
    }
  }
}
