import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import '../../models/models.dart';
import '../../utils/utils.dart';

// import '../../utils/utils.dart';

class Products {
  final String baseURL = 'https://api.wigtools.ng';
  // final String baseURL = 'https://solutioninflux-wigtools.herokuapp.com';
  Dio _dio = Dio();

  Future<List<Map<String, dynamic>>> getProductsByCategory(
      {String query, @required String token}) async {
    final header = {
      "Accept": "application/json",
      "Authorization": "Bearer $token"
    };
    // received payload
    print({'req': query});

    try {
      final response = await _dio.get(
        '$baseURL/products?category_menu=$query',
        // data: body,
        options: Options(headers: header),
      );
      // check or errors
      if (response.statusCode == 200) {
        // authResult = Categories.fromMap(response.data);
        print(response.data);
      }
    } on DioError catch (err) {
      throw ResponseException.fromDioError(err);
    }
    return [];
  }

  // Future<void> getProductsBySlug(AuthenticationModel userauth) async {}
  // Future<void> getProductsByBrand(AuthenticationModel userauth) async {}
  // Future<void> getSingleProduct(AuthenticationModel userauth) async {}
}
