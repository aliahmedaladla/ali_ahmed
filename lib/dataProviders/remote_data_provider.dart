import 'dart:convert';
import 'dart:developer';
import 'dart:typed_data';
import 'package:http/http.dart' as http;
import './error/exceptions.dart';
import './network/data_source_url.dart';

class RemoteDataProvider {
  final http.Client client;

  RemoteDataProvider({required this.client});

  Future<dynamic> sendData({
    required String url,
    required Map<String, dynamic> body,
    required retrievedDataType,
    dynamic returnType,
  }) async {
    log('send data launched');

    log('body is ' + body.toString());
    log("I am here " + url);
    //  String id = await getDeviceId();

    // var encrypter = await generateEncryptedHash(
    //     id + "," + "/api/" + url, dotenv.dotenv.env['API_KEY']!.toString());
    // print(encrypter);
    // print("============================");
    final response = await client.post(
      Uri.parse(DataSourceURL.baseUrl + url),
      body: body,
      headers: {
        'X-Requested-With': 'XMLHttpRequest',
        'Accept': 'application/json',
        'Content-Type': 'application/json',
        'Authorization': 'Bearer zaCELgL.Omar_abdu-Af50DDqtlx_ibrahem_Ahmed',
        // "X-Encrypted-Hash": encrypter.toString(),
        // "id": id
      },
    );

    log(DataSourceURL.baseUrl + url);
    log("response.body " + response.body.toString());
    log(response.statusCode.toString());
    // log("returnType " + returnType.toString());

    if (response.statusCode == 200) {
      log('the status code is 200');
      if (returnType == List) {
        final List<dynamic> data = jsonDecode(utf8.decode(response.bodyBytes));
        log('the data data type is List');
        log("the data from return type is ${retrievedDataType.fromJsonList(data)}");

        return retrievedDataType.fromJsonList(data);
      } else if (returnType == int) {
        final dynamic data = response.body;
        return data;
      } else if (returnType == String) {
        print('the data is string ');
        final dynamic data = json.decode(utf8.decode(response.bodyBytes));
        return data;
      } else {
        final dynamic data = json.decode(utf8.decode(response.bodyBytes));
        log('remote data provider is $data');

        if (data is List) {
          if (data.isEmpty) {
            log('data exception');
            throw EmptyException();
          } else {
            print('data is not empty');
          }
        }

        print('data is $data');
        return retrievedDataType.fromJson(data);
      }
    } else if (response.statusCode == 201) {
      return 1;
    } else if (response.statusCode == 416) {
      throw NoAvailableWorkHoursException();
    } else if (response.statusCode == 417) {
      throw VerifyCodeException();
    } else if (response.statusCode == 401) {
      throw UnauthenticatedException();
    } else if (response.statusCode == 404) {
      throw NotFoundException();
    } else if (response.statusCode == 406) {
      throw InvalidException();
    } else if (response.statusCode == 410) {
      throw ExpireException();
    } else if (response.statusCode == 430) {
      throw UniqueException();
    } else if (response.statusCode == 434) {
      throw UserExistsException();
    } else if (response.statusCode == 400) {
      return 1;
    } else if (response.statusCode == 433) {
      throw ReceiveException();
    } else if (response.statusCode == 500) {
      throw ServerException();
    } else if (response.statusCode == 453) {
      throw BarcodeNotFoundException();
    }
  }

  Future<dynamic> sendFile({
    required String url,
    dynamic body,
    required retrievedDataType,
    dynamic returnType,
  }) async {
    log('send data launched');

    log('body is ' + body.toString());
    log("I am here " + url);
    var request = new http.MultipartRequest("POST", Uri.parse(url));
    request.files.add(await http.MultipartFile.fromPath('image', body));
    var response = await request.send();
    final resBody = await response.stream.bytesToString();
    log("response.body ");

    log(response.statusCode.toString());
    // log("returnType " + returnType.toString());

    if (response.statusCode == 200) {
      return jsonDecode(resBody);
    } else if (response.statusCode == 201) {
      return 1;
    } else if (response.statusCode == 416) {
      throw NoAvailableWorkHoursException();
    } else if (response.statusCode == 420) {
      throw AIException();
    } else if (response.statusCode == 417) {
      throw VerifyCodeException();
    } else if (response.statusCode == 401) {
      throw UnauthenticatedException();
    } else if (response.statusCode == 404) {
      return jsonDecode(resBody);
    } else if (response.statusCode == 406) {
      throw InvalidException();
    } else if (response.statusCode == 410) {
      throw ExpireException();
    } else if (response.statusCode == 430) {
      throw UniqueException();
    } else if (response.statusCode == 434) {
      throw UserExistsException();
    } else if (response.statusCode == 439) {
      throw BlockedException();
    } else if (response.statusCode == 433) {
      throw ReceiveException();
    } else if (response.statusCode == 420) {
      throw AIException();
    } else if (response.statusCode == 500) {
      throw ServerException();
    } else if (response.statusCode == 453) {
      throw BarcodeNotFoundException();
    }
  }

  Future<dynamic> sendJsonData({
    required String url,
    required Map<String, dynamic> jsonData,
    required retrievedDataType,
    dynamic returnType,
  }) async {
    log('sendJsonData launched');
    log('jsonData: ${jsonData.toString()}');
    log('URL: $url');

    final response = await client.post(
      Uri.parse(DataSourceURL.baseUrl + url),
      body: json.encode(jsonData),  // تحويل البيانات إلى JSON string
      headers: {
        'X-Requested-With': 'XMLHttpRequest',
        'Accept': 'application/json',
        'Content-Type': 'application/json',
        'Authorization': 'Bearer zaCELgL.Omar_abdu-Af50DDqtlx_ibrahem_Ahmed',
      },
    );

    log('Response status code: ${response.statusCode}');
    log('Response body: ${response.body}');

    if (response.statusCode == 200) {
      if (returnType == List) {
        final List<dynamic> data = jsonDecode(utf8.decode(response.bodyBytes));
        return retrievedDataType.fromJsonList(data);
      } else if (returnType == int) {
        return response.body;
      } else if (returnType == String) {
        return json.decode(utf8.decode(response.bodyBytes));
      } else {
        final dynamic data = json.decode(utf8.decode(response.bodyBytes));
        if (data is List && data.isEmpty) {
          throw EmptyException();
        }
        return retrievedDataType.fromJson(data);
      }
    } else if (response.statusCode == 201) {
      return 1;
    } else if (response.statusCode == 416) {
      throw NoAvailableWorkHoursException();
    } else if (response.statusCode == 417) {
      throw VerifyCodeException();
    } else if (response.statusCode == 401) {
      throw UnauthenticatedException();
    } else if (response.statusCode == 404) {
      throw NotFoundException();
    } else if (response.statusCode == 406) {
      throw InvalidException();
    } else if (response.statusCode == 410) {
      throw ExpireException();
    } else if (response.statusCode == 430) {
      throw UniqueException();
    } else if (response.statusCode == 434) {
      throw UserExistsException();
    } else if (response.statusCode == 439) {
      throw BlockedException();
    } else if (response.statusCode == 433) {
      throw ReceiveException();
    } else if (response.statusCode == 500) {
      throw ServerException();
    } else if (response.statusCode == 453) {
      throw BarcodeNotFoundException();
    }
  }

  Future<dynamic> sendPatch(
      {required String url,
      dynamic body,
      required retrievedDataType,
      dynamic returnType,
      required String id}) async {
    var headersList = {
      'Accept': '*/*',
      'User-Agent': 'Thunder Client (https://www.thunderclient.com)',
      'Content-Type': 'application/json',
      'Authorization': 'key'
    };
    var url = Uri.parse('https://toffan.net/api/form/stories/' + id);

    var body = {"id": int.parse(id), "views": 1};

    var req = http.Request('PATCH', url);
    req.headers.addAll(headersList);
    req.body = json.encode(body);

    var res = await req.send();
    final resBody = await res.stream.bytesToString();

    if (res.statusCode >= 200 && res.statusCode < 300) {
      print(resBody);
    } else {
      print("------------------------------");
      print(res.reasonPhrase);
      print("--------------------------------");
    }
  }

  Future<dynamic> getData({
    required String url,
    required retrievedDataType,
    dynamic returnType,
  }) async {
    log('send data launched');

    log('body is ');
    log("I am here " + url);

    final response = await client.get(
      Uri.parse(DataSourceURL.baseUrl + url),
      headers: {
        'Authorization': 'Bearer zaCELgL.Omar_abdu-Af50DDqtlx_ibrahem_Ahmed',
        'X-Requested-With': 'XMLHttpRequest',
        'Accept': 'application/json',
        "Accept-Language": "en-US,en",
        "Cache-Control": "max-age=0",
        "Connection": "keep-alive",
        "Sec-GPC": "1",
        "User-Agent":
            "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36"
      },
    );

    log(DataSourceURL.baseUrl + url);
    log("response.body " + response.body.toString());
    log(response.statusCode.toString());
    // log("returnType " + returnType.toString());

    if (response.statusCode == 200) {
      log('the status code is 200');
      if (returnType == List) {
        final List<dynamic> data = jsonDecode(utf8.decode(response.bodyBytes));
        log('the data data type is List');
        log("the data from return type is ${retrievedDataType.fromJsonList(data)}");

        return retrievedDataType.fromJsonList(data);
      } else if (returnType == int) {
        final dynamic data = response.body;
        return data;
      } else if (returnType == String) {
        print('the data is string ');
        final dynamic data = json.decode(utf8.decode(response.bodyBytes));
        return data;
      } else {
        final dynamic data = json.decode(utf8.decode(response.bodyBytes));
        log('remote data provider is $data');

        if (data is List) {
          if (data.isEmpty) {
            log('data exception');
            throw EmptyException();
          } else {
            print('data is not empty');
          }
        }

        print('data is $data');
        return retrievedDataType.fromJson(data);
      }
    } else if (response.statusCode == 201) {
      return 1;
    } else if (response.statusCode == 416) {
      throw NoAvailableWorkHoursException();
    } else if (response.statusCode == 417) {
      throw VerifyCodeException();
    } else if (response.statusCode == 401) {
      throw UnauthenticatedException();
    } else if (response.statusCode == 404) {
      throw NotFoundException();
    } else if (response.statusCode == 406) {
      throw InvalidException();
    } else if (response.statusCode == 410) {
      throw ExpireException();
    } else if (response.statusCode == 430) {
      throw UniqueException();
    } else if (response.statusCode == 434) {
      throw UserExistsException();
    } else if (response.statusCode == 439) {
      throw BlockedException();
    } else if (response.statusCode == 433) {
      throw ReceiveException();
    } else if (response.statusCode == 500) {
      throw ServerException();
    } else if (response.statusCode == 453) {
      throw BarcodeNotFoundException();
    }
  }
}
