
import 'package:flutter/cupertino.dart';

import '../../data/models/product_response_model.dart';

@immutable
sealed class ProductsState {}

final class ProductsInitial extends ProductsState {}
final class ProductLoading extends ProductsState {}
final class ProductSuccess extends ProductsState {
  final List<Product> products;
  ProductSuccess({required this.products});
}
final class ProductError extends ProductsState {
  final String message;
  ProductError({required this.message});
}