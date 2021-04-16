import 'package:dio/dio.dart';
import 'dart:convert' as convert;
import 'package:shared_preferences/shared_preferences.dart';

import '../../models/models.dart';
import '../../utils/utils.dart';

class AuthenticationServices {
  final String baseURL = 'https://solutioninflux-wigtools.herokuapp.com';
  Dio _dio = Dio();

// signin to wigtools
  Future<SigninAuth> userLogin(
      AuthenticationModel userauth, dynamic context) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final body = {
      "email": "${userauth.email}",
      "password": "${userauth.password}",
    };
    print('data: $body');

    // final header = {"Accepts": "application/json"};
    SigninAuth result;
    try {
      final response = await _dio.post(
        '$baseURL/login',
        data: body,
      );

      // check or errors
      if (response.statusCode == 200) {
        result = SigninAuth.fromMap(response.data);
        // saving user token to device storage.
        if (result.status) {
          prefs.setBool('hasUser', false);
          prefs.setString("user_token", result.data.accessToken);
          prefs.setString("refresh_token", result.data.refreshToken);
        }
        print(result.message);
      }
    } on DioError catch (err) {
      print(err);
      throw ResponseException.fromDioError(err);
    }
    return result;
  }

// signup to wigtools
  Future<StatusResponse> userSignup(RegistrationModel usercreds) async {
    final body = {
      "email": "${usercreds.email}",
      "password": "${usercreds.password}",
      "user_type": "${usercreds.userType}"
    };
    print('data: $body');
    final header = {"Accepts": "application/json"};
    StatusResponse authResult;
    try {
      final response = await _dio.post(
        '$baseURL/register',
        data: body,
        options: Options(headers: header),
      );
      // check or errors
      if (response.statusCode == 200) {
        authResult = StatusResponse.fromMap(response.data);
      }
    } on DioError catch (err) {
      throw ResponseException.fromDioError(err);
    }
    return authResult;
  }

  Future<StatusResponse> checkUser(String email) async {
    final body = {
      "email": "$email",
    };
    final header = {"Accepts": "application/json"};

    print({'data': body});
    StatusResponse authResult;

    try {
      final response = await _dio.post(
        '$baseURL/check',
        data: body,
        options: Options(headers: header),
      );
      // check for errors
      if (response.statusCode == 200) {
        authResult = StatusResponse.fromMap(response.data);
        print(authResult);
      }
    } on DioError catch (err) {
      throw ResponseException.fromDioError(err);
    }
    return authResult;
  }

  Future<bool> logout() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final clearData = prefs.clear();
    return clearData;
  }
}
