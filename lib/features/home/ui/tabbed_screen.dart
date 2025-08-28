import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:shoppe/core/routing/routes.dart';
import 'package:shoppe/core/utils/app_assets.dart';
import 'package:shoppe/features/home/logic/home_cubit.dart';
import 'package:shoppe/features/home/ui/home_screen.dart';
import '../../../core/theming/colors.dart';
class TabbedScreen extends StatelessWidget {
  const TabbedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, int>(
      builder: (context, index) {
        return Scaffold(
          bottomNavigationBar: ConvexAppBar(
            style: TabStyle.fixedCircle,
            backgroundColor: ColorsManager.white,
            activeColor: ColorsManager.primaryColor,
            color: ColorsManager.black,

            initialActiveIndex: 1,
            onTap: (index) {
              switch (index) {
                case 0:
                  break;
                case 1:
                  context.push(Routes.favorites);
                  break;
                case 2:
                  context.push(Routes.cart);
                  break;
                case 3:
                  break;
                case 4:
                  context.push(Routes.profile);
                  break;
              }
              ;
            },

            items: [
              TabItem(icon: Icons.home_outlined),
              TabItem(icon: Icons.favorite_outline),
              TabItem(
                icon: Container(
                  decoration: BoxDecoration(
                    color: ColorsManager.primaryColor,
                    shape: BoxShape.circle,
                  ),
                  child: Image.asset(
                    AppAssets.shoppingCartIcon,
                    color: Colors.white,
                  ),
                ),
              ),
              TabItem(icon: Icons.notifications_none, isIconBlend: true),
              TabItem(icon: Icons.person),
            ],
          ),
          backgroundColor: ColorsManager.backgroundColor,

          body: HomeScreen(),
        );
      },
    );
  }
}
