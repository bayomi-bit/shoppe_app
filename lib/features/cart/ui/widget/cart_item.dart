import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shoppe/core/theming/styles.dart';

import '../../../../core/theming/colors.dart';
import '../../data/models/cart_response_model.dart';
import '../../logic/cart_cubit.dart';

class CartItem extends StatelessWidget {
  final ProductsResponse product;

  const CartItem({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.h),
      child: Row(
        children: [
          Container(
            width: 87.w,
            height: 85.h,
            decoration: BoxDecoration(
              color: ColorsManager.white,
              borderRadius: BorderRadius.circular(15.r),
            ),
            child: Image.network(product.thumbnail ?? "", fit: BoxFit.cover),
          ),
          Padding(
            padding: EdgeInsets.only(left: 8.w, right: 8.w, top: 8.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  "    ${product.title ?? "No title"}",
                  style: Styles.font15BlackW500,
                ),
                Text(
                  "    \$${product.discountedPrice}",
                  style: Styles.font15BlackW500,
                ),
                Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        context.read<CartCubit>().quantityMinus(product.id!);
                      },
                      icon: Icon(
                        FontAwesomeIcons.circleMinus,
                        color: ColorsManager.red,
                        size: 18.sp,
                      ),
                    ),
                    Text(product.quantity.toString()),
                    IconButton(
                      onPressed: () {
                        context.read<CartCubit>().quantityPlus(product.id!);
                      },
                      icon: Icon(
                        FontAwesomeIcons.circlePlus,
                        color: ColorsManager.primaryColor,
                        size: 18.sp,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const Spacer(),
          IconButton(
            onPressed: () {
              context.read<CartCubit>().removeProductFromCart(product.id!);
            },
            icon: Icon(FontAwesomeIcons.trashCan, size: 18.sp),
          ),
        ],
      ),
    );
  }
}
