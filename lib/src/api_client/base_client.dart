import 'dart:async';

import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:movie/src/core/utils/app_constants.dart';
import 'package:movie/src/injector.dart';

import 'exception_handler.dart';



class BaseClient {
  static const int timeOutDuration = 35;

  //GET
  Future<dynamic> get(String url) async {
    var uri = Uri.parse("$url?api_key=${injector<AppConstants>().liveApiKey}");
    try {
      var response =
      await http.get(
          uri,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': injector<AppConstants>().liveBearerToken,
        },
      ).timeout(const Duration(seconds: timeOutDuration));
      return _processResponse(response);
    } catch (e) {
      throw ExceptionHandlers().getExceptionString(e);
    }
  }

  //POST
  Future<dynamic> post(String url, dynamic payloadObj) async {
    var uri = Uri.parse(url);
    var payload = jsonEncode(payloadObj);
    try {
      var response = await http
          .post(uri, body: payload)
          .timeout(const Duration(seconds: timeOutDuration));

      return _processResponse(response);
    } catch (e) {
      throw ExceptionHandlers().getExceptionString(e);
    }
  }

  //DELETE
  //OTHERS

//----------------------ERROR STATUS CODES----------------------

  dynamic _processResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
        var responseJson = response.body;
        return responseJson;
      case 400: //Bad request
        throw BadRequestException(jsonDecode(response.body)['message']);
      case 401: //Unauthorized
        throw UnAuthorizedException(jsonDecode(response.body)['message']);
      case 403: //Forbidden
        throw UnAuthorizedException(jsonDecode(response.body)['message']);
      case 404: //Resource Not Found
        throw NotFoundException(jsonDecode(response.body)['message']);
      case 500: //Internal Server Error
      default:
        throw FetchDataException(
            'Something went wrong! ${response.statusCode}');
    }
  }
}
