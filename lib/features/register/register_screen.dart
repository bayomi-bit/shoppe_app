import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shoppe/core/theming/styles.dart';
import 'package:shoppe/core/utils/app_assets.dart';
import 'package:shoppe/features/register/ui/widget/custom_form_field.dart';
import 'package:shoppe/features/register/ui/widget/register_button_builder.dart';
import '../../core/helpers/spacing.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  Image.asset(
                    AppAssets.bubbles,
                    fit: BoxFit.cover,
                    width: double.maxFinite,
                  ),
                  Positioned(
                    top: 140.h,
                    left: 20.w,
                    child: Column(
                      mainAxisSize: MainAxisSize.max,

                      children: [
                        Text("Create \nAccount", style: Styles.font52BlackBold),
                      ],
                    ),
                  ),
                ],
              ),

              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.0.w),
                child: Image.asset(AppAssets.uploadImage),
              ),
              verticalSpace(25.h),
              CustomFormField(),
              verticalSpace(45.h),
              //Register button
              RegisterButtonBuilder(),
            ],
          ),
        ),
      ),
    );
  }
}
