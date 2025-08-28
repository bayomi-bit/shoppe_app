import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:shoppe/features/cart/data/data_source/cart_request_hive.dart';
import 'package:shoppe/features/cart/data/data_source/product_hive.dart';
import 'core/di/dependency_injection.dart';
import 'core/helpers/cash_helper.dart';
import 'core/network/Api_constant.dart';
import 'shoppe_app.dart';

void main() async {
  Stripe.publishableKey = ApiConstants.publishableKey;
  WidgetsFlutterBinding.ensureInitialized();
  await CashHelper.init();
  await Hive.initFlutter();
  Hive.registerAdapter(ProductsHiveAdapter());
  Hive.registerAdapter(CartRequestHiveAdapter());

  setupLocator();
  runApp(
    ShoppeApp(),
  );
}

