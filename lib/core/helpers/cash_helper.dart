import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import '../../features/home/data/models/product_response_model.dart';

class CashHelper {
  static late SharedPreferences sharedPreferences;
  static const String favoritesKey = 'fav_products';

  static init() async {
    sharedPreferences = await SharedPreferences.getInstance();
    if (sharedPreferences.get(favoritesKey) is! List<String>) {
      await sharedPreferences.remove(favoritesKey);
    }
  }

  static setId(int id) {
    sharedPreferences.setInt('id', id);
  }

  static int? getId() {
    return sharedPreferences.getInt('id');
  }

  static saveString(String key, String value) {
    sharedPreferences.setString(key, value);
  }

  static String? getString(String key) {
    return sharedPreferences.getString(key);
  }

  static Future<void> setFavorite(Product product) async {
    final favorites = await getFavorites();
    if (!favorites.any((p) => p.id == product.id)) {
      favorites.add(product);
      final jsonList = favorites.map((p) => jsonEncode(p.toJson())).toList();
      await sharedPreferences.setStringList(favoritesKey, jsonList);
    }
  }

  static Future<void> removeFavorite(Product product) async {
    final favorites = await getFavorites();
    favorites.removeWhere((p) => p.id == product.id);
    final jsonList = favorites.map((p) => jsonEncode(p.toJson())).toList();
    await sharedPreferences.setStringList(favoritesKey, jsonList);
  }

  static Future<void> saveFavorites(List<Product> products) async {
    final jsonList = products.map((p) => jsonEncode(p.toJson())).toList();
    await sharedPreferences.setStringList(favoritesKey, jsonList);
  }

  static Future<bool> isFavorite(int productId) async {
    final favorites = await getFavorites();
    return favorites.any((p) => p.id == productId);
  }

  static Future<List<Product>> getFavorites() async {
    final storedValue = sharedPreferences.get(favoritesKey);

    if (storedValue is! List<String>) {
      return [];
    }

    return storedValue
        .map(
          (jsonString) =>
              Product.fromJson(jsonDecode(jsonString) as Map<String, dynamic>),
        )
        .toList();
  }
}
