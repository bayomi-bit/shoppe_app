import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:shoppe/features/favorites/logic/favorites_cubit.dart';
import 'package:shoppe/features/favorites/ui/widget/favorite_item.dart';
import '../../../core/theming/colors.dart';
import '../../../core/widget/back_ic_app_bar.dart';
import '../../home/ui/widget/prouducts/products_builder.dart';

class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsManager.backgroundColor,

      appBar: AppBar(
        title: const Text("Favorites"),
        centerTitle: true,
        backgroundColor: ColorsManager.backgroundColor,

        leading: IconButton(
          icon: const BackIcAppBar(),
          onPressed: () {
            context.pop();
          },
        ),

        actions: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.0.w, vertical: 8.0.h),
            child: Icon(FontAwesomeIcons.heart, color: ColorsManager.black),
          ),
        ],
      ),
      body: BlocBuilder<FavoritesCubit, FavoritesState>(
        builder: (context, state) {
          if (state is FavoritesLoading) {
            return const Center(child: CircularProgressIndicator());
          }
          if (state is FavoritesError) {
            return Center(child: Text(state.message));
          }

          if (state is FavoritesLoaded) {
            return GridView.builder(
              shrinkWrap: true,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisExtent: 243.h,
                mainAxisSpacing: 10.h,
              ),
              itemCount: state.products.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.only(left: 5.w, right: 15.w),
                  child: GestureDetector(
                    onTap: () {
                      goToDetails(context, state.products[index]);
                    },
                    child: FavoriteItem(product: state.products[index]),
                  ),
                );
              },
            );
          }
          return const Center(child: Text("No Favorites"));
        },
      ),
    );
  }
}
