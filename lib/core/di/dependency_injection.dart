import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:shoppe/features/home/logic/category_logic/category_cubit.dart';
import 'package:shoppe/features/home/logic/search_logic/search_cubit.dart';
import 'package:shoppe/features/login/data/repo/login_rebository.dart';
import 'package:shoppe/features/login/data/repo/login_rebository_impl.dart';
import 'package:shoppe/features/login/logic/login_cubit.dart';
import 'package:shoppe/features/payment/data/rebo/payment_repository.dart';
import 'package:shoppe/features/payment/logic/payment_logic/payment_cubit.dart';
import 'package:shoppe/features/register/data/rebo/register_rebository.dart';
import 'package:shoppe/features/register/logic/register_cubit.dart';

import '../../features/cart/data/rebo/cart_repository.dart';
import '../../features/cart/data/rebo/cart_repository_impl.dart';
import '../../features/cart/logic/cart_cubit.dart';
import '../../features/home/data/rebo/home_rebository.dart';
import '../../features/home/data/rebo/home_rebository_impl.dart';
import '../../features/home/logic/products_logic/products_cubit.dart';
import '../../features/payment/data/rebo/payment_repository_impl.dart';
import '../../features/payment/logic/address_logic/address_cubit.dart';
import '../../features/payment/logic/contact_info_logic/contact_info_cubit.dart';
import '../../features/register/data/rebo/register_rebository_impl.dart';
import '../network/api_consumer.dart';
import '../network/dio_network/dio_service.dart';
import '../network/dio_network/diofactory.dart';

final  getIt = GetIt.instance;

void setupLocator(){
  //dio
  Dio dio =  DioFactory().dio;
  getIt.registerLazySingleton<ApiConsumer>(()=>DioService(dio));
//register
  getIt.registerFactory<RegisterCubit>(() => RegisterCubit(getIt()));
  getIt.registerLazySingleton<RegisterRepository>(() => RegisterRepositoryImpl(getIt()));
  //login
  getIt.registerFactory<LoginCubit>(()=> LoginCubit(getIt()));
  getIt.registerLazySingleton<LoginRepository>(()=>((LoginRepositoryImpl(getIt()))));
  //home
  getIt.registerFactory<CategoryCubit>(()=>CategoryCubit(getIt()));
  getIt.registerFactory<SearchCubit>(()=>SearchCubit(getIt()));
  getIt.registerFactory<ProductsCubit>(()=>ProductsCubit(getIt()));
  getIt.registerLazySingleton<HomeRepository>(() => HomeRepositoryImpl(getIt()));

  //cart
  getIt.registerFactory<CartCubit>(() => CartCubit(getIt()));
  getIt.registerLazySingleton<CartRepository>(() => CartRepositoryImpl(getIt()));

  //payment
  getIt.registerFactory<PaymentCubit>(()=>PaymentCubit(getIt()));
  getIt.registerLazySingleton<PaymentRepository>(()=>PaymentRepositoryImpl(getIt()));
    //address
    getIt.registerFactory<AddressCubit>(()=>AddressCubit(getIt()));
    //Contact info
    getIt.registerFactory<ContactInfoCubit>(()=>ContactInfoCubit(getIt()));


}