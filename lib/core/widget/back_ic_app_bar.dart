import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../theming/colors.dart';

class BackIcAppBar extends StatelessWidget {
  const BackIcAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 70.w,
      height: 60.h,
      decoration: BoxDecoration(
        color: ColorsManager.white,

        shape: BoxShape.circle,
      ),
      child: const Icon(
        size: 17,
        Icons.arrow_back_ios_new_outlined,
        color: ColorsManager.black,
      ),
    );
  }
}
