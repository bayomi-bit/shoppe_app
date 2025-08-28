import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theming/styles.dart';

class PriceRow extends StatelessWidget {
  final int discountedTotal ;
  final TextStyle? textStyle;
  final String text;
  const PriceRow({super.key,required this.discountedTotal, required this.text, this.textStyle});


  @override
  Widget build(BuildContext context) {
    return  Row(
        children: [

          Text(text,style: textStyle ?? Styles.font14GrayRegular.copyWith(
              fontSize: 17.sp
          )),
          const Spacer(),
          Text("\$$discountedTotal",style: Styles.font17BlackW400.copyWith(
              fontWeight: FontWeight.w600
          ),),
        ]
    );

  }
}
