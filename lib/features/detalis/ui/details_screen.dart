import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:shoppe/core/theming/colors.dart';
import 'package:shoppe/core/widget/app_text_button.dart';
import '../../../core/helpers/spacing.dart';
import '../../../core/routing/routes.dart';
import '../../../core/theming/styles.dart';
import '../../cart/logic/cart_cubit.dart';
import '../../home/data/models/product_response_model.dart';

class DetailsScreen extends StatelessWidget {
  final Product product;

  const DetailsScreen({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    final cartCubit = context.read<CartCubit>();

    final priceAfterDiscount =
        product.price! * (1 - product.discountPercentage! / 100);

    return Scaffold(
      backgroundColor: ColorsManager.white,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              color: ColorsManager.backgroundColor,
              child: Image.network(product.images![0]),
            ),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: ColorsManager.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20.r),
                    topRight: Radius.circular(20.r),
                  ),
                ),

                child: Padding(
                  padding: const EdgeInsets.all(6.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Text(product.title!, style: Styles.font20W600Roboto),
                      Text(
                        "\$ ${product.price?.toStringAsFixed(2) ?? ""}",
                        style: Styles.font19W500AnekLatin,
                      ),
                      verticalSpace(15),
                      Text(
                        product.description!,
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                        style: Styles.font14GrayRegular.copyWith(
                          fontWeight: FontWeight.w300,
                          fontSize: 13.sp,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(right: 8.0.w, bottom: 10.h, left: 2.w),
              child: Row(
                children: [
                  Column(
                    children: [
                      Text(
                        "price",
                        style: Styles.font19W500AnekLatin.copyWith(
                          color: ColorsManager.gray,
                        ),
                      ),
                      verticalSpace(5),
                      Text(
                        "  \$ ${product.price}",
                        style: Styles.font19W500AnekLatin.copyWith(
                          color: ColorsManager.red,
                          decoration: TextDecoration.lineThrough,
                          decorationColor: Colors.black,
                          decorationThickness: 2,

                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                  Text(
                    "  \$ ${priceAfterDiscount.toStringAsFixed(2)}",
                    style: Styles.font19W500AnekLatin.copyWith(
                      color: ColorsManager.primaryColor,
                    ),
                  ),

                  Spacer(),
                  BlocListener<CartCubit, CartState>(
                    listener: (context, state) {
                      if (state is CartSuccess) {
                        context.pushReplacement(Routes.cart, extra: cartCubit);
                      }
                    },
                    child: AppTextButton(
                      verticalPadding: 0,
                      buttonWidth: 160,
                      buttonHeight: 55,
                      borderRadius: 30,
                      backgroundColor: ColorsManager.primaryColor,
                      buttonText: "Add To Cart",
                      textStyle: Styles.appTextButtonStyle,
                      onPressed: () {
                        context.read<CartCubit>().addProductToCart(product);
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
