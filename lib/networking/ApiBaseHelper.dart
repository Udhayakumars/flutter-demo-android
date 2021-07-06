import 'dart:io';
import 'dart:convert';
import 'dart:async';
import 'package:MMLMobile/utils/Preference.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';
import 'package:toast/toast.dart';
import 'CustomException.dart';
import 'package:MMLMobile/utils/UtilMethods.dart' as UtilMethods;
import 'package:MMLMobile/utils/APIConstants.dart' as APIConstants;

import 'package:path/path.dart';

class ApiBaseHelper {
  String _baseUrl, _token;
  var dio = Dio();

  Future<dynamic> get(String url) async {
    _baseUrl = await Preference.getItem("BASEURL");
    _token = await Preference.getItem("IsLoggedIn");

    print('Api Get, url $_baseUrl$url');
    var responseJson;
    try {
      final response = await http.get(_baseUrl + url, headers: {
        "content-type": "application/json",
        "Authorization": "Bearer " + _token,
      });
      responseJson = _returnResponse(response);
    } on SocketException {
      print('No net');
      throw FetchDataException('No Internet connection');
    }
    print('api get recieved!');
    print(responseJson.toString());
    return responseJson;
  }

  Future<dynamic> post(String url, dynamic body, BuildContext context) async {
    _baseUrl = await Preference.getItem("BASEURL");
    _token = await Preference.getItem("IsLoggedIn");

    // print('Api Post, url $_baseUrl$url $body $_token');
    print(
        "==========================API POST PARAMS=========================================");
    print("=================================================================");
    debugPrint('URL $_baseUrl$url $body', wrapWidth: 1024);
    print(
        "===================================================================");
    print("=================================================================");
    var responseJson;
    try {
      final response = await http.post(_baseUrl + url, body: body, headers: {
        "Accept": "application/json",
        "content-type": "application/json",
        "Authorization": "Bearer " + _token,
      });
      responseJson = _returnResponse(response, context: context, url: url);
    } on SocketException {
      print('No net');
      UtilMethods.showToast('No Internet connection',
          context: context, duration: Toast.LENGTH_LONG, gravity: Toast.BOTTOM);
      throw FetchDataException('No Internet connection');
    }

    // print('api post received');
    print(
        "==========================API POST RECEIVED========================");
    print(
        "===================================================================");
    debugPrint("URL $_baseUrl$url ${responseJson.toString()}", wrapWidth: 1024);
    print(
        "===================================================================");
    print(
        "===================================================================");

    return responseJson;
  }

  Future<dynamic> fileUploadPost(
      String url, Map<String, dynamic> body, BuildContext context) async {
    _baseUrl = await Preference.getItem("BASEURL");
    _token = await Preference.getItem("IsLoggedIn");

    // print('Api Post, url $_baseUrl$url $body $_token');
    print(
        "==========================API POST PARAMS=========================================");
    print("=================================================================");
    debugPrint('URL $_baseUrl$url $body', wrapWidth: 1024);
    print(
        "===================================================================");
    print("=================================================================");
    var responseJson;
    try {
      var formData = FormData.fromMap(body);

      final response = await dio.post(_baseUrl + url,
          data: formData,
          options: Options(contentType: 'multipart/form-data', headers: {
            "Authorization": "Bearer " + _token,
          }));

      responseJson =
          _returnResponse(response, context: context, fileUpload: true);
    } on SocketException {
      print('No net');
      UtilMethods.showToast('No Internet connection',
          context: context, duration: Toast.LENGTH_LONG, gravity: Toast.BOTTOM);
      throw FetchDataException('No Internet connection');
    }


    print(
        "==========================API POST RECEIVED========================");
    print(
        "===================================================================");
    debugPrint("URL $_baseUrl$url ${responseJson.toString()}", wrapWidth: 1024);
    print(
        "===================================================================");
    print(
        "===================================================================");

    return responseJson;
  }

  Future<dynamic> put(String url, dynamic body) async {
    _baseUrl = await Preference.getItem("BASEURL");
    print('Api Put, url $url');
    var responseJson;
    try {
      final response = await http.put(_baseUrl + url, body: body);
      responseJson = _returnResponse(response);
    } on SocketException {
      print('No net');
      throw FetchDataException('No Internet connection');
    }
    print('api put.');
    print(responseJson.toString());
    return responseJson;
  }

  Future<dynamic> delete(String url) async {
    _baseUrl = await Preference.getItem("BASEURL");
    print('Api delete, url $url');
    var apiResponse;
    try {
      final response = await http.delete(_baseUrl + url);
      apiResponse = _returnResponse(response);
    } on SocketException {
      print('No net');

      throw FetchDataException('No Internet connection');
    }
    print('api delete.');
    return apiResponse;
  }
}

dynamic _returnResponse(response,
    {BuildContext context, fileUpload, url}) async {
  switch (response.statusCode) {
    case 200:
      // print(response.data);

      var responseJson = fileUpload != null
          ? response.data
          : json.decode(response.body.toString());
      return responseJson;
    case 400:
    case 404:
      throw BadRequestException(fileUpload != null
          ? response.data.toString()
          : response.body.toString());
    case 401:
    case 403:
      Preference.removeKey("IsLoggedIn");
      throw UnauthorisedException(fileUpload != null
          ? response.data.toString()
          : response.body.toString());
    case 501:
      print(response.body.toString());
      UtilMethods.showToast(
          fileUpload != null
              ? response.data.toString()
              : response.body.toString(),
          context: context,
          duration: Toast.LENGTH_LONG,
          gravity: Toast.BOTTOM);
      VoidCallback callback = () async {
        await UtilMethods.eventLogout(context);
      };
      if (APIConstants.BASE_LOGIN != url) {
        UtilMethods.errorAlertDialog(
            context,
            "Alert",
            "Technical issues. Please logout and login after sometime",
            callback);
      }
      throw InvalidInputException(fileUpload != null
          ? response.reasonPhras
          : "" +
              " : " +
              (fileUpload != null
                  ? response.data.toString()
                  : response.body.toString()));
    case 500:
    default:
      throw InvalidInputException(
          'Error occured while Communication with Server with StatusCode : ${response.statusCode}');
  }
}
