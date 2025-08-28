import 'package:hive/hive.dart';
import 'package:shoppe/features/cart/data/data_source/product_hive.dart';

import '../models/cart_request_model.dart';

part 'cart_request_hive.g.dart';

@HiveType(typeId: 1)
class CartRequestHive {
  @HiveField(0)
  int userId;

  @HiveField(1)
  List<ProductsHive> products;

  CartRequestHive({required this.userId, required this.products});
}
