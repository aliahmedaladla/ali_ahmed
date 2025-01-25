import 'package:dartz/dartz.dart';
import 'package:ufuqstore/dataProviders/error/failures.dart';
import 'package:ufuqstore/dataProviders/local_data_provider.dart';
import 'package:ufuqstore/dataProviders/network/Network_info.dart';
import 'package:ufuqstore/dataProviders/network/data_source_url.dart';
import 'package:ufuqstore/dataProviders/remote_data_provider.dart';
import 'package:ufuqstore/dataProviders/repository.dart';
import 'package:ufuqstore/features/ProductDeatils/data/model/ProductDeatils.dart';


class ProductDeatilsRepository extends Repository {
  final RemoteDataProvider remoteDataProvider; //get the data from the internet
  final NetworkInfo networkInfo; //check if the device is connected to internet
  final LocalDataProvider localDataProvider;
  ProductDeatilsRepository({
    required this.remoteDataProvider,
    required this.networkInfo,
    required this.localDataProvider
  });

  Future<Either<Failure, dynamic>> getAllProductDeatils(String id) async {
    return await sendRequest(
        checkConnection: networkInfo.isConnected,
        remoteFunction: () async {
          List<ProductDeatilsModel> remoteData =
              await remoteDataProvider.getData(
            url: DataSourceURL.getAllproducts +"/"+id,
            returnType: List,
            retrievedDataType: ProductDeatilsModel.init(),
          );


          return remoteData;
        },
        getCacheDataFunction: () async {

        });
  }
}
