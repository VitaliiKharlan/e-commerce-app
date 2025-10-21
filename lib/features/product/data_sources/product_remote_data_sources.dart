import 'package:dio/dio.dart';
import '../models/product.dart';
import 'i_product_remote_data_sources.dart';


class ProductRemoteDataSource implements IProductRemoteDataSource {
  final Dio _dio;

  ProductRemoteDataSource(this._dio);

  @override
  Future<List<Product>> getProducts() async {
    try {
      final response = await _dio.get('https://fakestoreapi.com/products');

      final List<dynamic> jsonList = response.data;
      return jsonList.map((json) => Product.fromJson(json)).toList();
    } catch (e) {
      throw Exception('Failed to load products: $e');
    }
  }
}
