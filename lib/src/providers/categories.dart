import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../services/services.dart';
import '../../models/models.dart';

// Creating a provider refrence for the app_category_list 
final categoryService = Provider<CategoryService>((ref) => CategoryService());

final category = FutureProvider.autoDispose<Categories>((ref) async {
  final service = ref.read(categoryService);
  final getCategories = await service.getCategories();
  print(getCategories);
  return getCategories;
});
