import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shoppe/core/theming/styles.dart';
import 'package:shoppe/features/login/logic/login_cubit.dart';

import '../../../../core/theming/colors.dart';
import '../../../../core/widget/app_text_form_field.dart';

class EmailAndPasswordForm extends StatelessWidget {
  const EmailAndPasswordForm({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<LoginCubit>();
    return Form(
      key: cubit.formKey,
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 0.w, vertical: 10.h),
            child: AppTextFormField(
              controller: cubit.usernameController,
              backgroundColor: ColorsManager.moreLightGray,

              hintText: "Username",
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
            padding: EdgeInsets.symmetric(horizontal: 0.w, vertical: 0.h),
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
