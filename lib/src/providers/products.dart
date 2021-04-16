import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../services/services.dart';
import './app_providers.dart';
// import '../../models/models.dart';

final productServices = Provider((ref) => Products());

final products =
    FutureProvider.autoDispose.family((ref, String data) async {
  final _token = ref.read(userToken);
  final _usertoken = await _token;
  final service = ref.read(productServices);
  final getProducts =
      await service.getProductsByCategory(query: data, token: _usertoken);
  print(getProducts);
  return getProducts;
});
