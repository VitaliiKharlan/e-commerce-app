import '../models/product.dart';

abstract class IProductRemoteDataSource {
  Future<List<Product>> getProducts();
}