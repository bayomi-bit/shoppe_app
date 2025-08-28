import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../core/theming/colors.dart';
import '../../../../core/theming/styles.dart';
import '../../../../core/widget/app_text_form_field.dart';

class CustomTextField extends StatelessWidget {
  final String hintText;
  final TextEditingController controller;
  final IconData icon;

  const CustomTextField({
    super.key,
    required this.hintText,
    required this.controller,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return AppTextFormField(
      hintText: hintText,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter your $hintText';
        }
      },
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: ColorsManager.white),
      ),
      hintStyle: Styles.font14GrayRegular,
      suffixIcon: Icon(FontAwesomeIcons.penToSquare),
      backgroundColor: ColorsManager.white,
      prefixIcon: Container(
        width: 50.w,
        decoration: BoxDecoration(
          color: ColorsManager.lighterGray,
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.circular(15.r),
        ),
        child: Icon(size: 25.sp, icon, color: ColorsManager.black),
      ),
      controller: controller,

      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: ColorsManager.white),
      ),
    );
  }
}
