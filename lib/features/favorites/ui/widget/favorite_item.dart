import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../core/helpers/spacing.dart';
import '../../../../core/theming/colors.dart';
import '../../../../core/theming/styles.dart';
import '../../../home/data/models/product_response_model.dart';
import '../../../home/ui/widget/category/category_item.dart';
import '../../logic/favorites_cubit.dart';

class FavoriteItem extends StatelessWidget {
  final Product product;
  const FavoriteItem({super.key, required this.product});

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
            padding: const EdgeInsets.only(left: 5.0, top: 10.0),
            child: GestureDetector (
              onTap: () => context.read<FavoritesCubit>().removeFavorite(product),
              child: FaIcon(
       FontAwesomeIcons.heart ,
                color: Colors.redAccent,
              ),
            ),
          ),


          Padding(
            padding: EdgeInsets.only(top: 5.h),
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
            ],
          ),
        ],
      ),
    );
  }
}
