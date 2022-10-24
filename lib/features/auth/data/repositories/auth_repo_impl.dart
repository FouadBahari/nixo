import 'package:nixo/core/error/exception.dart';
import 'package:nixo/core/error/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:nixo/core/network/network_infos.dart';
import 'package:nixo/features/auth/data/datasources/auth_remote_data_source.dart';
import 'package:nixo/features/auth/domain/entities/user_entity.dart';
import 'package:nixo/features/auth/domain/repositories/auth_repo.dart';

class AuthRepositoryImpl extends AuthRepo {
  final NetworkInfos networkInfos;
  final AuthRemoteDataSource authRemoteDataSource;

  AuthRepositoryImpl(
      {required this.networkInfos, required this.authRemoteDataSource});

  @override
  Future<Either<Failure, void>> createUser(UserEntity user) async {
    try {
      await authRemoteDataSource.createUser(user);
      return const Right(null);
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, void>> facebookAuth() async {
    try {
      await authRemoteDataSource.facebookAuth();
      return const Right(null);
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, void>> forgotPassword(String email) async {
    try {
      await authRemoteDataSource.forgotPassword(email);
      return const Right(null);
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, String>> getCurrentUId() async {
    try {
      String currentUid = await authRemoteDataSource.getCurrentUId();
      return Right(currentUid);
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, void>> googleAuth() async {
    try {
      await authRemoteDataSource.googleAuth();
      return const Right(null);
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, bool>> isSignIn() async {
    try {
      bool isSignIn = await authRemoteDataSource.isSignIn();
      return Right(isSignIn);
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, void>> signIn(UserEntity user) async {
    try {
      await authRemoteDataSource.signIn(user);
      return const Right(null);
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, void>> signOut() async {
    try {
      await authRemoteDataSource.signOut();
      return const Right(null);
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, void>> signUp(UserEntity user) async {
    try {
      await authRemoteDataSource.signUp(user);
      return const Right(null);
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}
