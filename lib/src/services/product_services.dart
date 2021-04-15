import 'package:dio/dio.dart';
import '../../models/models.dart';

// import '../../utils/utils.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Products {

  
    SharedPreferences prefs = await SharedPreferences.getInstance();


  final String baseURL = 'https://solutioninflux-wigtools.herokuapp.com';
  Dio _dio = Dio();

  Future<void> getProductsBySlug(AuthenticationModel userauth) async {

  }
  Future<void> getProductsByCategory(AuthenticationModel userauth) async {}
  Future<void> getProductsByBrand(AuthenticationModel userauth) async {}
  Future<void> getSingleProduct(AuthenticationModel userauth) async {}
}
