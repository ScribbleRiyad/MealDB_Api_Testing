import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

import 'base_api_service.dart';

class NetworkApiServices extends BaseApiServices {
  static Future<BaseOptions> getBaseOptions() async {

    BaseOptions options = BaseOptions(
      connectTimeout: const Duration(seconds: 10000),
      receiveTimeout: const Duration(seconds: 5000),
      followRedirects: false,
      validateStatus: (status) {
        return status! < 550;
      },

      headers: {
        "Accept": "application/json",
        'Content-type': 'application/json',
        'X-Requested-With': 'XMLHttpRequest',
        'Authorization': 'Bearer Token',
      },
    );

    return options;
  }

  @override
  Future<dynamic> getApi(url) async {
    if (kDebugMode) {
      print(url);
    }
    Dio dio = Dio(await getBaseOptions());

    dynamic responseJson;
    try {
      Response response = await dio.get(url);
      responseJson = returnResponse(response);
      // print(response);

    } catch (e) {}
    // on SocketException {
    //   throw InternetException('');
    // }on RequestTimeOut {
    //   throw RequestTimeOut('');
    //
    // }
    // print(responseJson);
    return responseJson;
  }

  @override
  Future<dynamic> postApi(payload, url) async {
    if (kDebugMode) {
      print(url);
      print(payload);
    }
    Dio dio = Dio(await getBaseOptions());

    dynamic responseJson;
    try {
      final response = await dio.post(url, data: payload);
      responseJson = returnResponse(response);


    } catch (e) {


    }
 }

    return responseJson;
  }

  dynamic returnResponse(Response response) {
    switch (response.statusCode) {
      case 200:
        dynamic responseJson = response.data;
        return responseJson;
      case 400:
        dynamic responseJson = response.data;
        return responseJson;
      case 401:
        dynamic responseJson = response.data;
        return responseJson;
      case 500:
        dynamic responseJson = response.data;
        return responseJson;
      case 422:
        dynamic responseJson = response.data;
        return responseJson;
      default:
      // throw FetchDataException('Error ccoured while communicating with server '+response.statusCode.toString()) ;
    }
  }
}
