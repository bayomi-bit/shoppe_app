import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theming/colors.dart';
import '../../../../core/theming/styles.dart';
import '../../../../core/widget/app_text_form_field.dart';
import '../../logic/register_cubit.dart';

class CustomFormField extends StatelessWidget {
  const CustomFormField({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<RegisterCubit>();
    return Form(
      key: cubit.formKey,
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.h),
            child: AppTextFormField(
              controller: cubit.emailController,
              backgroundColor: ColorsManager.moreLightGray,

              hintText: "Email",
              hintStyle: Styles.font14GrayRegular.copyWith(
                color: ColorsManager.lightGray,
              ),

              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your email';
                }
              },
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.h),
            child: AppTextFormField(
              controller: cubit.firstNameController,
              backgroundColor: ColorsManager.moreLightGray,
              hintStyle: Styles.font14GrayRegular.copyWith(
                color: ColorsManager.lightGray,
              ),

              hintText: "First Name",
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your first name';
                }
              },
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.h),
            child: AppTextFormField(
              controller: cubit.passwordController,
              isObscureText: true,
              backgroundColor: ColorsManager.moreLightGray,

              suffixIcon: Icon(
                Icons.visibility_off_outlined,
                color: ColorsManager.black,
              ),
              hintText: "Password",
              hintStyle: Styles.font14GrayRegular.copyWith(
                color: ColorsManager.lightGray,
              ),

              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your password';
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
