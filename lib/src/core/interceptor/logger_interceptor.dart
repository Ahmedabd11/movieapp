import 'dart:developer';

import 'package:dio/dio.dart';

class LoggerInterceptor extends InterceptorsWrapper {
  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    log("\n❌❌❌❌ ------- Failure Response Start ------- ❌❌❌❌\n\n");
    log("ERROR::: ${err.message}");
    log("URL::: ${err.response?.realUri}");
    log("Headers::: ${err.response?.headers}");
    if (err.requestOptions.data != null) {
      log("Request Body::: ${err.requestOptions.data}");
    }
    log("Response Code::: ${err.response?.statusCode}");
    log("Response::: ${err.response?.data}");
    log("\n❌❌❌❌ ------- Failure Response End ------- ❌❌❌❌\n\n");
    super.onError(err, handler);
  }

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    log("Requesting to URL: ${options.uri}");
    log("Request Headers: ${options.headers}");
    super.onRequest(options, handler);
  }

  @override
  void onResponse(
      Response<dynamic> response, ResponseInterceptorHandler handler) {
    switch (response.statusCode) {
      case 200:
        log("\n✅✅✅ ------- Success Response Start ------- ✅✅✅ \n");
        log("URL::: ${response.realUri}");
        log("Headers::: ${response.headers}");
        if (response.requestOptions.data != null) {
          log("Request Body::: ${response.requestOptions.data}");
        }
        log("Response Code::: ${response.statusCode}");
        log("Response::: ${response.data}");
        log("\n✅✅✅ ------- Success Response End ------- ✅✅✅ \n");
    }
    super.onResponse(response, handler);
  }
}