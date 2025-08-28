import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shoppe/features/login/ui/widget/email_and_password_form.dart';
import 'package:shoppe/features/login/ui/widget/login_button_builder.dart';
import '../../../core/helpers/spacing.dart';
import '../../../core/theming/styles.dart';
import '../../../core/utils/app_assets.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.maxFinite,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(AppAssets.loginBubbles),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.0.w, vertical: 10.h),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Login", style: Styles.font52BlackBold),
              Text("Good to see you back!", style: Styles.font18BlackNunito),
              EmailAndPasswordForm(),

              LoginButtonBuilder(),

              verticalSpace(40),
            ],
          ),
        ),
      ),
    );
  }
}
