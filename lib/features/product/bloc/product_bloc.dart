import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core/logger/i_logger_service.dart';
import '../models/product.dart';
import '../repository/i_product_repository.dart';
import 'product_event.dart';
import 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  final IProductRepository _repository;
  final ILoggerService _logger;
  int _currentPage = 1;
  final int _pageSize = 5;
  bool _hasMore = true;
  final List<Product> _allProducts = [];
  final List<Product> _products = [];

  ProductBloc(this._repository, this._logger)
    : super(const ProductState.initial()) {
    on<LoadProductsEvent>(_onLoadProducts);
    on<LoadMoreProductsEvent>(_loadMore);
  }

  Future<void> _onLoadProducts(
    LoadProductsEvent event,
    Emitter<ProductState> emit,
  ) async {
    emit(const ProductState.loading());
    _logger.log('Loading products...', logLevel: LogLevel.info);

    try {
      final products = await _repository.getProducts();
      _logger.log(
        'Products loaded: ${products.length}',
        logLevel: LogLevel.info,
      );

// Сохраняем ВСЕ товары для пагинации
      _allProducts.clear();
      _allProducts.addAll(products);

      // Добавляем только первую страницу в отображаемый список
      _products.clear();
      _products.addAll(products.take(_pageSize));

      _hasMore = _allProducts.length > _products.length;
      _currentPage = 1;


      emit(ProductState.loaded(_products, hasMore: _hasMore));
    } catch (e, s) {
      _logger.log(
        'Failed to load products: $e',
        error: e,
        stackTrace: s,
        logLevel: LogLevel.error,
      );
      emit(ProductState.error(e.toString()));
    }
  }

  Future<void> _loadMore(event, emit) async {
    if (!_hasMore) return;

    _currentPage++;

    final nextProductsStart = _currentPage * _pageSize - _pageSize;
    final nextProductsEnd = (_currentPage) * _pageSize;

    final nextProducts =
    _allProducts.sublist(nextProductsStart, nextProductsEnd > _allProducts.length ? _allProducts.length : nextProductsEnd);

    _products.addAll(nextProducts);

    _hasMore = _products.length < _allProducts.length;
    emit(ProductState.loaded(_products, hasMore: _hasMore));
  }
}
