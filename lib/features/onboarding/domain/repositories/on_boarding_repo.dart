import 'package:dartz/dartz.dart';
import 'package:nixo/core/error/failure.dart';

abstract class OnBoardingRepo {
  Future<Either<Failure,bool>> isFirstTime();
}