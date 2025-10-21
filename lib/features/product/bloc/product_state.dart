import 'package:freezed_annotation/freezed_annotation.dart';
import '../models/product.dart';

part 'product_state.freezed.dart';

@freezed
class ProductState with _$ProductState {
  const factory ProductState.initial() = _Initial;

  const factory ProductState.loading() = _Loading;

  const factory ProductState.loaded(List<Product> products, {@Default(true) bool hasMore}) =
      _Loaded;

  const factory ProductState.error(String message) = _Error;
}
