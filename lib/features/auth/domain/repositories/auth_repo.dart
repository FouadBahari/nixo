import 'package:dartz/dartz.dart';
import 'package:nixo/core/error/failure.dart';
import 'package:nixo/features/auth/domain/entities/user_entity.dart';

abstract class AuthRepo {
  Future<Either<Failure,void>> signUp(UserEntity user);
  Future<Either<Failure,void>> createUser(UserEntity user);
  Future<Either<Failure,void>> googleAuth();
  Future<Either<Failure,void>> facebookAuth();
  Future<Either<Failure,void>> forgotPassword(String email);
  Future<Either<Failure,bool>> isSignIn();
  Future<Either<Failure,void>> signIn(UserEntity user);
  Future<Either<Failure,void>> signOut();
  Future<Either<Failure,String>> getCurrentUId();
}
