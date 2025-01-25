import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:http/io_client.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';
import 'package:ufuqstore/features/Product/data/repository/ProductRepository.dart';
import 'package:ufuqstore/features/Product/presintation/manager/Product_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dataProviders/local_data_provider.dart';
import 'dataProviders/network/Network_info.dart';
import 'dataProviders/remote_data_provider.dart';
import 'package:get_it/get_it.dart';

// import 'features/Attacks/data/repository/AttackRepository.dart';
// import 'features/Attacks/presintation/manager/Attack_bloc.dart';
// import 'features/Boycott_Brands/data/repository/BrandRepository.dart';
// import 'features/Boycott_Brands/presintation/manager/brand_bloc.dart';
// import 'features/Boycott_markets/data/repository/MarketRepository.dart';
// import 'features/Boycott_markets/presintation/manager/market_bloc.dart';
// import 'features/Clipboard/data/repository/ClipboardRepository.dart';
// import 'features/Clipboard/presintation/manager/Clipboard_bloc.dart';
// import 'features/CountryBoycott/data/repository/CountryBoycottRepository.dart';
// import 'features/CountryBoycott/presintation/manager/CountryBoycott_bloc.dart';
// import 'features/Donations/data/repository/DonationsRepository.dart';
// import 'features/Donations/presintation/manager/Donations_bloc.dart';
// import 'features/Extermination/data/repository/ExterminationRepository.dart';
// import 'features/Extermination/presintation/manager/Extermination_bloc.dart';
// import 'features/Home/data/repository/HomeRepository.dart';
// import 'features/Home/presintation/manager/Home_bloc.dart';
// import 'features/Live/data/repository/LiveRepository.dart';
// import 'features/Live/presintation/manager/Live_bloc.dart';
// import 'features/Notifications/data/model/NotificationsModel.dart';
// import 'features/Onboarding/data/repository/CountryRepository.dart';
// import 'features/Onboarding/presintation/manager/Country_bloc.dart';
// import 'features/Rumors/data/repository/RumorsRepository.dart';
// import 'features/Rumors/presintation/manager/Rumors_bloc.dart';
// import 'features/ScanBarcode/data/repository/BarcodeRepository.dart';
// import 'features/ScanBarcode/presintation/manager/Barcode_bloc.dart';
// import 'features/Statistics/data/repository/StatisticsRepository.dart';
// import 'features/Statistics/presintation/manager/Statistics_bloc.dart';
// import 'features/Stories/data/repository/StoriesRepository.dart';
// import 'features/Stories/presintation/manager/Stories_bloc.dart';
import 'features/ProductDeatils/data/repository/ProductDeatilsRepository.dart';
import 'features/ProductDeatils/presintation/manager/ProductDeatils_bloc.dart';
import 'main.dart';

final sl = GetIt.instance;
Future<void> init() async {
  print('start injection');

//  ! Features
//   _initRegisterFeature();

  // client = await getSSLPinningClient();
  // _initCountry_blocFeature();
  // initNotification();
  // _initBrand_blocFeature();
  // _initProduct_blocFeature();
  // _initLive_blocFeature();
  // _initRumors_blocFeature();
  // _initBarcode_blocFeature();
  // _initAttack_blocFeature();
  // _initStatistics_blocFeature();
  // _initClipboardLives_blocFeature();
  // //checkForUpdates();
  // _initStories_blocFeature();
  // _initDonations_blocFeature();
  // _initHome_blocFeature();
  // _initCountryBoycott_blocFeature();
  // _initExtermination_blocFeature();
  _initProduct_blocFeature();
  ///service provider

  //! Core
  sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(sl()));
  //data providers

  // data sources
  sl.registerLazySingleton<RemoteDataProvider>(
          () => RemoteDataProvider(client: sl()));

  sl.registerLazySingleton<LocalDataProvider>(
          () => LocalDataProvider(sharedPreferences: sl()));



  //! External
  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton<SharedPreferences>(() => sharedPreferences);

  sl.registerLazySingleton(() => http.Client());
  sl.registerLazySingleton(() => InternetConnection());
}

void _initProduct_blocFeature() {
//bloc
  sl.registerFactory(() => Product_bloc(repository: sl()));

  //repositories
  sl.registerLazySingleton<ProductRepository>(
        () => ProductRepository(
      remoteDataProvider: sl(),
      localDataProvider: sl(),
      networkInfo: sl(),
    ),
  );
}


void _initCategories_blocFeature() {
//bloc
  sl.registerFactory(() => Product_bloc(repository: sl()));

  //repositories
  sl.registerLazySingleton<ProductRepository>(
        () => ProductRepository(
      remoteDataProvider: sl(),
      localDataProvider: sl(),
      networkInfo: sl(),
    ),
  );
}
void _initproductDeatils_blocFeature() {
//bloc
  sl.registerFactory(() => ProductDeatils_bloc(repository: sl()));

  //repositories
  sl.registerLazySingleton<ProductDeatilsRepository>(
        () => ProductDeatilsRepository(
      remoteDataProvider: sl(),
      localDataProvider: sl(),
      networkInfo: sl(),
    ),
  );
}

//
// void _initBrand_blocFeature() {
// //bloc
//   sl.registerFactory(() => brand_bloc(repository: sl()));
//   sl.registerFactory(() => Form_bloc(repository: sl()));
//   sl.registerFactory(() => alternativeBrand_bloc(repository: sl()));
//   //repositories
//   sl.registerLazySingleton<BrandRepository>(
//     () => BrandRepository(
//       remoteDataProvider: sl(),
//       localDataProvider: sl(),
//       networkInfo: sl(),
//       local_data_provider_hive: sl(),
//     ),
//   );
// }
//
// void _initProduct_blocFeature() {
// //bloc
//   sl.registerFactory(() => Alternative_product_bloc(repository: sl()));
//   sl.registerFactory(() => product_bloc(repository: sl()));
//
//   //repositories
//   sl.registerLazySingleton<ProductRepository>(
//     () => ProductRepository(
//       remoteDataProvider: sl(),
//       localDataProvider: sl(),
//       networkInfo: sl(),
//     ),
//   );
// }
//
// void _initLive_blocFeature() {
// //bloc
//   sl.registerFactory(() => Live_bloc(repository: sl()));
//
//   //repositories
//   sl.registerLazySingleton<LiveRepository>(
//     () => LiveRepository(
//       remoteDataProvider: sl(),
//       localDataProvider: sl(),
//       networkInfo: sl(),
//       local_data_provider_hive: sl(),
//     ),
//   );
// }
//
// void _initStories_blocFeature() {
// //bloc
//   sl.registerFactory(() => Stories_bloc(repository: sl()));
//
//   //repositories
//   sl.registerLazySingleton<StoriesRepository>(
//     () => StoriesRepository(
//       remoteDataProvider: sl(),
//       localDataProvider: sl(),
//       networkInfo: sl(),
//       local_data_provider_hive: sl(),
//     ),
//   );
// }
//
// void _initExtermination_blocFeature() {
// //bloc
//   sl.registerFactory(() => Extermination_bloc(repository: sl()));
//
//   //repositories
//   sl.registerLazySingleton<ExterminationRepository>(
//     () => ExterminationRepository(
//       remoteDataProvider: sl(),
//       localDataProvider: sl(),
//       networkInfo: sl(),
//       local_data_provider_hive: sl(),
//     ),
//   );
// }
//
// void _initStatistics_blocFeature() {
// //bloc
//   sl.registerFactory(() => Statistics_bloc(repository: sl()));
//
//   //repositories
//   sl.registerLazySingleton<StatisticsRepository>(
//     () => StatisticsRepository(
//       remoteDataProvider: sl(),
//       localDataProvider: sl(),
//       networkInfo: sl(),
//       local_data_provider_hive: sl(),
//     ),
//   );
// }
//
// void _initRumors_blocFeature() {
// //bloc
//   sl.registerFactory(() => Rumors_bloc(repository: sl()));
//
//   //repositories
//   sl.registerLazySingleton<RumorsRepository>(
//     () => RumorsRepository(
//       remoteDataProvider: sl(),
//       localDataProvider: sl(),
//       networkInfo: sl(),
//       local_data_provider_hive: sl(),
//     ),
//   );
// }
//
// void _initBarcode_blocFeature() {
// //bloc
//   sl.registerFactory(() => Barcode_bloc(repository: sl()));
//   sl.registerFactory(() => Pictures_Ai_bloc(repository: sl()));
//
//   //repositories
//   sl.registerLazySingleton<BarcodeRepository>(
//     () => BarcodeRepository(
//       remoteDataProvider: sl(),
//       localDataProvider: sl(),
//       networkInfo: sl(),
//       local_data_provider_hive: sl(),
//     ),
//   );
// }
//
// void _initAttack_blocFeature() {
// //bloc
//   sl.registerFactory(() => Attack_bloc(repository: sl()));
//
//   //repositories
//   sl.registerLazySingleton<AttackRepository>(
//     () => AttackRepository(
//       remoteDataProvider: sl(),
//       localDataProvider: sl(),
//       networkInfo: sl(),
//     ),
//   );
// }
//
// void _initCountryBoycott_blocFeature() {
// //bloc
//   sl.registerFactory(() => CountryBoycott_bloc(repository: sl()));
//
//   //repositories
//   sl.registerLazySingleton<CountryBoycottRepository>(
//     () => CountryBoycottRepository(
//       remoteDataProvider: sl(),
//       localDataProvider: sl(),
//       networkInfo: sl(),
//       local_data_provider_hive: sl(),
//     ),
//   );
// }
//
// void _initHome_blocFeature() {
// //bloc
//   sl.registerFactory(() => Home_bloc(repository: sl()));
//
//   //repositories
//   sl.registerLazySingleton<HomeRepository>(
//     () => HomeRepository(
//       remoteDataProvider: sl(),
//       localDataProvider: sl(),
//       networkInfo: sl(),
//     ),
//   );
// }
//
// void _initClipboardLives_blocFeature() {
// //bloc
//   sl.registerFactory(() => ClipboardLives_bloc(repository: sl()));
//   sl.registerFactory(() => ClipboardRumors_bloc(repository: sl()));
//   sl.registerFactory(() => ClipboardDonations_bloc(repository: sl()));
//
//   //repositories
//   sl.registerLazySingleton<ClipboardRepository>(
//     () => ClipboardRepository(
//       remoteDataProvider: sl(),
//       localDataProvider: sl(),
//       networkInfo: sl(),
//     ),
//   );
// }
//
// void _initDonations_blocFeature() {
// //bloc
//   sl.registerFactory(() => Donations_bloc(repository: sl()));
//   sl.registerFactory(() => DonationsDetails_bloc(repository: sl()));
//
//   //repositories
//   sl.registerLazySingleton<DonationsRepository>(
//     () => DonationsRepository(
//       remoteDataProvider: sl(),
//       localDataProvider: sl(),
//       networkInfo: sl(),
//       local_data_provider_hive: sl(),
//     ),
//   );
// }

// Future<void> checkForUpdates() async {
//   try {
//     int? currentPatchNumber = await shorebirdCodePush.currentPatchNumber();
//     final isUpdateAvailable =
//         await shorebirdCodePush.isNewPatchAvailableForDownload();
//
//     if (isUpdateAvailable) {
//       try {
//         EasyLoading.show(
//             status: "جاري تنزيل التحديثات الجديده يرجى الانتظار...");
//
//         await shorebirdCodePush.downloadUpdateIfAvailable();
//         await EasyLoading.showSuccess("تم التحديث بنجاح");
//         await EasyLoading.dismiss();
//         await Restart.restartApp();
//       } catch (e) {
//         EasyLoading.showError(
//             "    فشل تحميل التحديثات يرجى المحاولة مرة اخرى ......");
//         print(e);
//       }
//     }
//
//     // Check whether a patch is available to install.
//   } catch (e) {
//     print(e);
//   }
// }
//
// Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
//   if (message.notification! != null) {
//     init();
//
//     List<NotificationsModel> notification = [];
//     List<NotificationsModel> notificationNumber = [];
//     notification = await getCachedData(
//             key: "notification",
//             retrievedDataType: NotificationsModel.init(),
//             returnType: List) ??
//         [];
//     notificationNumber = await getCachedData(
//             key: "notificationNumber",
//             retrievedDataType: NotificationsModel.init(),
//             returnType: List) ??
//         [];
//
//     notification.add(NotificationsModel(
//         imageUrl: message.notification!.android!.imageUrl ?? "",
//         title: message.notification!.title,
//         body: message.notification!.body));
//     notificationNumber.add(NotificationsModel(
//         imageUrl: message.notification!.android!.imageUrl ?? "",
//         title: message.notification!.title,
//         body: message.notification!.body));
//     cachedData(key: "notification", data: notification);
//     cachedData(key: "notificationNumber", data: notificationNumber);
//
//     NotificationsController.getNotificationsNumber();
//     NotificationsController.update();
//   }
//   return Future<void>.value();
// }
//
// initNotification() {
//   FirebaseMessaging.instance.requestPermission();
//   print(_firebaseMessaging.getToken());
//   FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
//   FirebaseMessaging.onMessage.listen((RemoteMessage message) async {
//     print('Got a message whilst in the foreground!');
//     if (message.notification! != null) {
//       List<NotificationsModel> notification = [];
//       List<NotificationsModel> notificationNumber = [];
//       notification = await getCachedData(
//               key: "notification",
//               retrievedDataType: NotificationsModel.init(),
//               returnType: List) ??
//           [];
//       notificationNumber = await getCachedData(
//               key: "notificationNumber",
//               retrievedDataType: NotificationsModel.init(),
//               returnType: List) ??
//           [];
//
//       notification.add(NotificationsModel(
//           imageUrl: message.notification!.android!.imageUrl ?? "",
//           title: message.notification!.title,
//           body: message.notification!.body));
//       notificationNumber.add(NotificationsModel(
//           imageUrl: message.notification!.android!.imageUrl ?? "",
//           title: message.notification!.title,
//           body: message.notification!.body));
//       cachedData(key: "notification", data: notification);
//       cachedData(key: "notificationNumber", data: notificationNumber);
//
//       NotificationsController.getNotificationsNumber();
//       NotificationsController.update();
//     }
//   });
// }
//
// Future<SecurityContext> get globalContext async {
//   final sslCert = await rootBundle.load('assets/certificate/toffan.net.crt');
//   SecurityContext securityContext = SecurityContext(withTrustedRoots: false);
//   securityContext.setTrustedCertificatesBytes(sslCert.buffer.asInt8List());
//   return securityContext;
// }
//
// Future<http.Client> getSSLPinningClient() async {
//   HttpClient client = HttpClient(context: await globalContext);
//   client.badCertificateCallback =
//       (X509Certificate cert, String host, int port) => false;
//   IOClient ioClient = IOClient(client);
//   return ioClient;
// }
