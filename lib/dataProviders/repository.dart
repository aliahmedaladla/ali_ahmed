import 'dart:developer';
import 'package:dartz/dartz.dart';
import 'error/exceptions.dart';
import 'error/failures.dart';

typedef Future<dynamic> GetDataFunction();
typedef dynamic GetCacheDataFunction();

class Repository {
  Future<Either<Failure, dynamic>> sendRequest({
    GetDataFunction? remoteFunction,
    GetCacheDataFunction? getCacheDataFunction,
    Future<bool>? checkConnection,
  }) async {
    log('send request running');

    if (await checkConnection!) {
      log('check connection ');
      try {
        log('try from repositories');

        final remoteData = await remoteFunction!();
        log('the data from repositories is $remoteData');
        return Right(remoteData);
      } on ServierExeption {
        return Left(ServerFailure());
      } on NotFound {
        return Left(NotFounFailure());
      } on BlockedUser {
        return Left(BlockedUserFailure());
      } on BarcodeNotFoundException {
        return Left(BarcodeNotFoundFailure());
      } on ValidationException {
        return Left(ValidationFailure());
      } on CacheException {
        return Left(CacheFailure());
      } on AIException {
        return Left(AiFailure());
      }
    } else {
      if (getCacheDataFunction == null) {
        return Left(ConnectionFailure());
      }

      try {
        final localData = await getCacheDataFunction();
        return Right(localData);
      } on CacheException {
        return Left(CacheFailure());
      } on EmptyException {
        return Left(NotFoundFailure());
      } catch (Exception) {
        print(Exception);
        return Left(ConnectionFailure());
      }
    }
  }
}
