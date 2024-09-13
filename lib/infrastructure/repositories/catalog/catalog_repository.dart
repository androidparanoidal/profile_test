import 'package:injectable/injectable.dart';
import 'package:test_profile/domain/product/product.dart';
import '../../../domain/category/category.dart';
import 'fake_categories.dart';
import 'fake_products.dart';

@injectable
class CatalogRepository {
  CatalogRepository();

  Future<List<Category>> getCategories() async {
    await Future.delayed(const Duration(seconds: 2));
    final categories = fakeCategories.map((category) => Category.fromJson(category)).toList();
    return categories;
  }

  Future<List<Product>> getProductByCategory(int id, List<Map<String, Object>> section) async {
    await Future.delayed(const Duration(seconds: 2));
    final products = section.map((product) => Product.fromJson(product)).toList();
    return products;
  }
}
