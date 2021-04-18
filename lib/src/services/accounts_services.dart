import 'package:dio/dio.dart';

import '../../models/models.dart';
import '../../utils/utils.dart';

class AccountServices {
  final String baseURL = 'https://solutioninflux-wigtools.herokuapp.com';
  Dio _dio = Dio();

// update user profile wigtools
  Future<StatusResponse> updateProfile(Accounts account) async {
    final body = {
      "first_name": "${account.fName}",
      "last_name": "${account.lName}",
      "phone": "${account.phone}",
    };
    print('data: $body');

    final header = {"Accepts": "application/json"};
    StatusResponse result;
    try {
      final response = await _dio.post(
        '$baseURL/users/profile',
        data: body,
        options: Options(headers: header),
      );

      // check or errors
      if (response.statusCode == 200) {
        result = StatusResponse.fromMap(response.data);

        print(result.message);
      }
    } on DioError catch (err) {
      print(err);
      throw ResponseException.fromDioError(err);
    }
    return result;
  }

// get user profile
  Future<StatusResponse> getProfile() async {
    final header = {"Accepts": "application/json"};
    StatusResponse authResult;
    try {
      final response = await _dio.get(
        '$baseURL/users/profile',
        options: Options(headers: header),
      );
      // check resquest status
      if (response.statusCode == 200) {
        print(response.data);
        // authResult = StatusResponse.fromMap(response.data);
      }
    } on DioError catch (err) {
      throw ResponseException.fromDioError(err);
    }
    return authResult;
  }

  Future<StatusResponse> getAddressess() async {
    final header = {"Accepts": "application/json"};
    StatusResponse authResult;

    try {
      final response = await _dio.get(
        '$baseURL/users/addresses',
        options: Options(headers: header),
      );
      // check for errors
      if (response.statusCode == 200) {
        // authResult = StatusResponse.fromMap(response.data);
        print(response.data);
      }
    } on DioError catch (err) {
      throw ResponseException.fromDioError(err);
    }
    return authResult;
  }

  Future<StatusResponse> addAddress(Address info) async {
    final body = {
      "city": "${info.city}",
      "state": "${info.state}",
      "country": "${info.country}",
      "address_line": "${info.address}",
      "postal_code": "${info.postalCode}",
      "region_id": int.tryParse(info.region),
    };
    print('data: $body');

    final header = {"Accepts": "application/json"};
    StatusResponse result;
    try {
      final response = await _dio.post(
        '$baseURL/users/addresses',
        data: body,
        options: Options(headers: header),
      );

      // check or errors
      if (response.statusCode == 200) {
        // result = StatusResponse.fromMap(response.data);

        print(response.data);
      }
    } on DioError catch (err) {
      print(err);
      throw ResponseException.fromDioError(err);
    }
    return result;
  }
  
  Future<StatusResponse> updateAddress(Address info) async {
    final body = {
      "city": "${info.city}",
      "state": "${info.state}",
      "country": "${info.country}",
      "address_line": "${info.address}",
      "postal_code": "${info.postalCode}",
      "region_id": int.tryParse(info.region),
    };
    print('data: $body');

    final header = {"Accepts": "application/json"};
    StatusResponse result;
    try {
      final response = await _dio.put(
        '$baseURL/users/addresses/:id',
        data: body,
        options: Options(headers: header),
      );
      // check or errors
      if (response.statusCode == 200) {
        // result = StatusResponse.fromMap(response.data);

        print(response.data);
      }
    } on DioError catch (err) {
      print(err);
      throw ResponseException.fromDioError(err);
    }
    return result;
  }




}
