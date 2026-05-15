import 'product_api_service.dart';
import '../models/product.dart';

class ProductRepository {
  const ProductRepository({this.apiService = const ProductApiService()});

  final ProductApiService apiService;

  Future<List<Product>> getProducts() async {
    return apiService.getProducts();
  }
}
