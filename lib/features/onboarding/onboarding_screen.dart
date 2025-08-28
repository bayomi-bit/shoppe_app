import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:shoppe/core/routing/routes.dart';
import 'package:shoppe/core/theming/colors.dart';
import 'package:shoppe/core/utils/app_assets.dart';
import 'package:shoppe/core/widget/app_text_button.dart';
import '../../core/helpers/spacing.dart';
import '../../core/theming/styles.dart';
class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
          child: Column(
            children: [
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // onboarding Logo
                    Center(child: Image.asset(AppAssets.onboarding)),
                    //App name
                    Text("Shoppe", style: Styles.font52BlackBold),
                    //App description
                    Text(
                      "Beautiful eCommerce app\n     for your online store",
                      style: Styles.font18BlackW200,
                    ),
                  ],
                ),
              ),
              //Get started button
              AppTextButton(
                backgroundColor: ColorsManager.primaryColor,
                borderRadius: 16.0.r,
                buttonHeight: 60.h,
                buttonWidth: 390.w,
                buttonText: 'let\'s get Started',
                textStyle: Styles.font22WhiteNunito,
                onPressed: () {
                  context.push(Routes.login);
                },
              ),
              verticalSpace(20),
              //Already have an account
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Already have an account ?",
                    style: Styles.font18BlackW200,
                  ),
                  GestureDetector(
                    onTap: () {
                      context.push(Routes.register);
                    },
                    child: Icon(
                      Icons.arrow_circle_right,
                      color: ColorsManager.primaryColor,
                    ),
                  ),
                ],
              ),
              verticalSpace(20),
            ],
          ),
        ),
      ),
    );
  }
}
