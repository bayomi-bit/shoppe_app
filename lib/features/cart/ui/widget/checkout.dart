import 'dart:ffi';

import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:shoppe/features/cart/ui/widget/price_row.dart';

import '../../../../core/helpers/spacing.dart';
import '../../../../core/routing/routes.dart';
import '../../../../core/theming/colors.dart';
import '../../../../core/theming/styles.dart';
import '../../../../core/widget/app_text_button.dart';

class Checkout extends StatelessWidget {
  final int discountedTotal;
  final VoidCallback? onClick;

  const Checkout({super.key, required this.discountedTotal, this.onClick});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      height: 250.h,
      decoration: BoxDecoration(
        color: ColorsManager.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20.r),
          topRight: Radius.circular(20.r),
        ),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.0.w, vertical: 15.h),
        child: Column(
          children: [
            PriceRow(discountedTotal: discountedTotal, text: "Subtotal"),
            verticalSpace(20),
            PriceRow(discountedTotal: 40, text: "Shipping"),
            verticalSpace(20),
            DottedLine(
              dashLength: 3,
              dashGapLength: 3,
              lineThickness: 1,
              dashColor: ColorsManager.lightGray,
            ),

            verticalSpace(20),
            PriceRow(
              discountedTotal: discountedTotal + 40,
              text: "TotalCost",
              textStyle: Styles.font17BlackW400.copyWith(
                fontWeight: FontWeight.w600,
              ),
            ),
            verticalSpace(20),
            AppTextButton(
              buttonText: "Checkout",
              backgroundColor: ColorsManager.primaryColor,
              textStyle: Styles.appTextButtonStyle,
              onPressed:onClick ?? () {
                context.push(Routes.payment, extra: discountedTotal + 40,);
              },
              borderRadius: 25.0.r,
              buttonHeight: 55.h,
              verticalPadding: 0.h,
            ),
          ],
        ),
      ),
    );
  }
}
