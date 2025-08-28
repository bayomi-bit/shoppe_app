import 'package:hive/hive.dart';

part 'product_hive.g.dart';

@HiveType(typeId: 0)
class ProductsHive {
  @HiveField(0)
  int id;

  @HiveField(1)
  int quantity;

  ProductsHive({required this.id, required this.quantity});
}
