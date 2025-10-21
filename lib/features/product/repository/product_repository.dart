import '../data_sources/i_product_remote_data_sources.dart';
import '../models/product.dart';
import 'i_product_repository.dart';

class ProductRepository implements IProductRepository {
  final IProductRemoteDataSource _remoteDataSource;

  ProductRepository(this._remoteDataSource);

  @override
  Future<List<Product>> getProducts() async {
    try {
      return await _remoteDataSource.getProducts();
    } catch (e) {
      throw Exception('Repository error: $e');
    }
  }
}
