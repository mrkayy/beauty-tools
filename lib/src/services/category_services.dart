import 'package:dio/dio.dart';
import '../../models/models.dart';
import '../../utils/utils.dart';
// import 'package:shared_preferences/shared_preferences.dart';

class CategoryService {
  final String baseURL = 'https://api.wigtools.ng';
  // final String baseURL = 'https://solutioninflux-wigtools.herokuapp.com';
  Dio _dio = Dio();

  Future<Categories> getCategories() async {
    final header = {"Accepts": "application/json"};
    Categories authResult;
    try {
      final response = await _dio.get(
        '$baseURL/categories',
        // data: body,
        options: Options(headers: header),
      );

      // check or errors
      if (response.statusCode == 200) {
        authResult = Categories.fromMap(response.data);
      }
    } on DioError catch (err) {
      throw ResponseException.fromDioError(err);
    }
    return authResult;
  }

  Future<Category> getCategoryByID(String id) async {
    final header = {"Accepts": "application/json"};
    Category authResult;
    try {
      final response = await _dio.get(
        '$baseURL/categories/$id',
        // data: body,
        options: Options(headers: header),
      );

      // check or errors
      if (response.statusCode == 200) {
        // final result = convert.jsonDecode(response.body);
        authResult = Category.fromMap(response.data);
        // on login success save user data
        print(authResult);
      }
    } on DioError catch (err) {
      print(err);
      throw ResponseException.fromDioError(err);
    }
    return authResult;
  }
}
