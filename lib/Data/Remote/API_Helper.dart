import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart'as http;
import 'package:shared_preferences/shared_preferences.dart';

import 'API_Exceptions.dart';

class ApiHelper {
  Future<dynamic> postAPI({
    required String Url,
    bool isHeaderRequired = true,
    Map<String, String>? mHeaders,
    Map<String, dynamic>? mBodyParams,
  }) async {
    try {
      mHeaders ??= {};
      if (isHeaderRequired) {
        mHeaders['Content-Type'] = 'application/json';
      }

      final res = await http.post(
        Uri.parse(Url),
        body: mBodyParams != null ? jsonEncode(mBodyParams) : null,
        headers: mHeaders,
      )
          .timeout(const Duration(seconds: 15));
      if (res.statusCode == 200) {
        return jsonDecode(res.body);
      } else {
        return returnJsonResponse(res);
      }
    } on SocketException catch (e) {
      print("SocketException: $e");
      throw FetchDataException(
          ErrorMsg: "No Internet connection. Please check your connection and try again.");
    }
  }

  dynamic returnJsonResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
      case 201:
        {
          var mData = jsonDecode(response.body);
          return mData;
        }
      case 400:
        throw BadRequestException(ErrorMsg: response.body.toString());
      case 401:
      case 403:
        throw UnAuthorizedRequestException(ErrorMsg: response.body.toString());
      case 500:
      default:
        throw FetchDataException(
            ErrorMsg: "Error occured while communication with server Status Code : ${response
                .statusCode}");
    }
  }
}
