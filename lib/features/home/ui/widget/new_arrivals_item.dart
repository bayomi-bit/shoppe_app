import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/helpers/spacing.dart';
import '../../../../core/theming/colors.dart';
import '../../../../core/theming/styles.dart';

class NewArrivalsItem extends StatelessWidget {
  final String productImage;
  final String productName;
  final double productPrice;

  const NewArrivalsItem({
    super.key,
    required this.productImage,
    required this.productName,
    required this.productPrice,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 8.w),
      margin: EdgeInsets.only(left: 5.w, right: 5.w),
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

      child: Row(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Best choice".toUpperCase(), style: Styles.font15blueW400),
              verticalSpace(5),
              Text(productName, style: Styles.font17BlackW400),
              verticalSpace(20),
              Text("\$ $productPrice ", style: Styles.font17BlackW400),
            ],
          ),
          Spacer(),
          Image.network(productImage, fit: BoxFit.cover, width: 137.w),
        ],
      ),
    );
  }
}
