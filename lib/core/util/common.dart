import 'package:shared_preferences/shared_preferences.dart';

import '../../dataProviders/local_data_provider.dart';
import '../../injection_container.dart';

cachedData({required key, required data}) async {
  try {
    final customer =
    await LocalDataProvider(sharedPreferences: sl<SharedPreferences>())
        .cacheData(key: key, data: data);
  } catch (e) {
    print(e);
  }
}

getCachedData(
    {required key,
      required retrievedDataType,
      required dynamic returnType}) async {
  try {
    return LocalDataProvider(sharedPreferences: sl<SharedPreferences>())
        .getCachedData(
        key: key,
        retrievedDataType: retrievedDataType,
        returnType: returnType);
  } catch (e) {
    print(e);
  }
}

