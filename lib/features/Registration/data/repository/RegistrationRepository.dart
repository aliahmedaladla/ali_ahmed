import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';
import 'package:ufuqstore/dataProviders/error/failures.dart';
import 'package:ufuqstore/dataProviders/local_data_provider.dart';
import 'package:ufuqstore/dataProviders/network/Network_info.dart';
import 'package:ufuqstore/dataProviders/network/data_source_url.dart';
import 'package:ufuqstore/dataProviders/remote_data_provider.dart';
import 'package:ufuqstore/dataProviders/repository.dart';


import '../model/RegistrationModel.dart';

class RegistrationRepository extends Repository {
  final RemoteDataProvider remoteDataProvider; //get the data from the internet
  final NetworkInfo networkInfo; //check if the device is connected to internet
  final LocalDataProvider localDataProvider;
  RegistrationRepository(
      {required this.remoteDataProvider,
      required this.networkInfo,
      required this.localDataProvider});

  Future<Either<Failure, dynamic>> Sinup(String username,String email,String password) async {
    return await sendRequest(
        checkConnection: networkInfo.isConnected,
        remoteFunction: () async {
          RegistrationModel remoteData =
          await remoteDataProvider.sendJsonData(
            url: DataSourceURL.signup,
            returnType: RegistrationModel.init(),
            retrievedDataType: RegistrationModel.init(),
            jsonData: {
              "username":username,
              "email":email,
              "password":password
            },
          );
            print(remoteData);
          return remoteData;
        },
        getCacheDataFunction: () async {});
  }
  Future<Either<Failure, dynamic>> login(String username, String password) async {
    return await sendRequest(
        checkConnection: networkInfo.isConnected,
        remoteFunction: () async {
          RegistrationModel remoteData = await remoteDataProvider.sendJsonData(
            url: DataSourceURL.login,
            returnType: RegistrationModel.init(),
            retrievedDataType: RegistrationModel.init(),
            jsonData: {
              "username": username,
              "password": password
            },
          );
          print(remoteData);
          return remoteData;
        },
        getCacheDataFunction: () async {});
  }
}
