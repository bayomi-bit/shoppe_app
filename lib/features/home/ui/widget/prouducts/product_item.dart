import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/helpers/spacing.dart';
import '../../../../../core/theming/colors.dart';
import '../../../../../core/theming/styles.dart';
import '../../../../favorites/logic/favorites_cubit.dart';
import '../../../data/models/product_response_model.dart';
import '../category/category_item.dart';

class ProductItem extends StatelessWidget {
  final Product product;

  const ProductItem({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 8.w),
      margin: EdgeInsets.only(left: 5.w),
      width: 170.w,
      height: 243.h,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: ColorsManager.gray.withOpacity(0.5),
            blurRadius: 5,
            blurStyle: BlurStyle.inner,
          ),
        ],
        color: ColorsManager.moreLightGray,
        borderRadius: BorderRadius.circular(15.r),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(top: 20.h),
            child: Center(
              child: Image.network(
                product.images?[0] ?? "No image",
                fit: BoxFit.cover,
                width: 137.w,
                height: 110.h,
              ),
            ),
          ),
          verticalSpace(17.5),
          Text("Best Seller".toUpperCase(), style: Styles.font15blueW400),
          Text(
            limitWords(product.title ?? "No title", 2),
            style: Styles.font17BlackW400,
          ),
          Row(
            children: [
              Text(
                "\$${product.price?.toStringAsFixed(2) ?? "No price"}",
                style: Styles.font17BlackW400,
              ),
              const Spacer(),
              BlocBuilder<FavoritesCubit, FavoritesState>(
                builder: (context, state) {
                  bool isFavorite = false;

                  if (state is FavoritesLoaded) {
                    isFavorite = state.products.any((p) => p.id == product.id);
                  }

                  return Container(
                    decoration: BoxDecoration(
                      color: isFavorite
                          ? ColorsManager.green
                          : ColorsManager.blue,
                      borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(15.r),
                        topLeft: Radius.circular(15.r),
                      ),
                    ),
                    child: IconButton(
                      onPressed: () {
                        context.read<FavoritesCubit>().toggleFavorite(product);
                      },
                      icon: Icon(
                        isFavorite ? Icons.done : Icons.add,
                        color: ColorsManager.white,
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
