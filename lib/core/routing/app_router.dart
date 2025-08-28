import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:shoppe/core/helpers/cash_helper.dart';
import 'package:shoppe/core/routing/routes.dart';
import 'package:shoppe/core/theming/colors.dart';
import 'package:shoppe/features/cart/ui/products_cart_screen.dart';
import 'package:shoppe/features/detalis/ui/details_screen.dart';
import 'package:shoppe/features/home/data/models/product_response_model.dart';
import 'package:shoppe/features/home/logic/category_logic/category_cubit.dart';
import 'package:shoppe/features/home/logic/home_cubit.dart';
import 'package:shoppe/features/home/logic/search_logic/search_cubit.dart';
import 'package:shoppe/features/home/ui/home_screen.dart';
import 'package:shoppe/features/login/logic/login_cubit.dart';
import 'package:shoppe/features/login/ui/login_screen.dart';
import 'package:shoppe/features/payment/logic/address_logic/address_cubit.dart';
import 'package:shoppe/features/payment/logic/contact_info_logic/contact_info_cubit.dart';
import 'package:shoppe/features/payment/logic/payment_logic/payment_cubit.dart';
import 'package:shoppe/features/profile/logic/profile_cubit.dart';
import 'package:shoppe/features/register/logic/register_cubit.dart';
import 'package:shoppe/features/register/register_screen.dart';

import '../../features/cart/logic/cart_cubit.dart';
import '../../features/favorites/logic/favorites_cubit.dart';
import '../../features/favorites/ui/favorites_screen.dart';
import '../../features/home/logic/products_logic/products_cubit.dart';
import '../../features/home/ui/tabbed_screen.dart';
import '../../features/home/ui/widget/search/search_overlay.dart';
import '../../features/onboarding/onboarding_screen.dart';
import '../../features/payment/ui/payment_screen.dart';
import '../../features/profile/ui/profile_screen.dart';
import '../di/dependency_injection.dart';

class AppRouter {
  static final GoRouter router = GoRouter(
    initialLocation: isLogin ? Routes.onboarding : Routes.home,
    routes: [
      // onboarding
      GoRoute(
        path: Routes.onboarding,
        builder: (context, state) => OnboardingScreen(),
      ),
      // register
      GoRoute(
        path: Routes.register,
        builder: (context, state) => BlocProvider(
          create: (context) => RegisterCubit(getIt()),
          child: RegisterScreen(),
        ),
      ),
      // login
      GoRoute(
        path: Routes.login,
        builder: (context, state) => BlocProvider(
          create: (context) => LoginCubit(getIt()),
          child: LoginScreen(),
        ),
      ),
      // home
      // tabbed
      GoRoute(
        path: Routes.home,
        builder: (context, state) => MultiBlocProvider(
          providers: [
            BlocProvider(create: (context) => HomeCubit()),
            BlocProvider(
              create: (context) => CategoryCubit(getIt())..getCategories(),
            ),
            BlocProvider(create: (context) => ProductsCubit(getIt())),

            BlocProvider(create: (context) => FavoritesCubit()..getFavorite()),
            BlocProvider(create: (context) => SearchCubit(getIt())),
          ],
          child: TabbedScreen(),
        ),
      ),
      // search
      GoRoute(
        path: Routes.search,
        pageBuilder: (context, state) {
          return CustomTransitionPage(
            opaque: false,
            barrierColor: ColorsManager.black.withOpacity(0.6),
            transitionDuration: const Duration(milliseconds: 300),
            child:
                MultiBlocProvider(providers: [
                  BlocProvider(create: (context) => SearchCubit(getIt())),
                  BlocProvider(create: (context) => FavoritesCubit()),
                ],  child: SearchOverlay()),
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
                  return FadeTransition(opacity: animation, child: child);
                },
          );
        },
      ),
      // payment
      GoRoute(
        path: Routes.payment,
        builder: (context, state) {
          final amount = state.extra as int;
          return MultiBlocProvider(
            providers: [
              BlocProvider(create: (context) => PaymentCubit(getIt())),
              BlocProvider(
                create: (context) =>
                    ContactInfoCubit(getIt())..getContactInfo(),
              ),
              BlocProvider(create: (context) => AddressCubit(getIt())),
            ],
            child: PaymentScreen(amount: amount),
          );
        },
      ),
      // favorites
      GoRoute(
        path: Routes.favorites,
        builder: (context, state) {
          return BlocProvider(
            create: (context) => FavoritesCubit()..getFavorite(),
            child: FavoritesScreen(),
          );
        },
      ),
      // product details
      GoRoute(
        path: Routes.details,
        builder: (context, state) {
          final product = state.extra as Product;
          return DetailsScreen(product: product);
        },
      ),
      // profile
      GoRoute(
        path: Routes.profile,
        builder: (context, state) => BlocProvider(
          create: (context) => ProfileCubit()..getProfile(),
          child: ProfileScreen(),
        ),
      ),
      // cart
      GoRoute(
        path: Routes.cart,

        builder: (context, state) {
          return ProductsCartScreen();
        },
      ),
    ],
  );
}

bool isLogin = false;

void changeLoginState() {
  if (CashHelper.getId() != null) isLogin = true;
}
