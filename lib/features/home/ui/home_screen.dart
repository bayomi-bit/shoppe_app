import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:shoppe/core/utils/app_assets.dart';
import 'package:shoppe/features/home/ui/widget/prouducts/products_builder.dart';
import 'package:shoppe/features/home/ui/widget/search/search_section.dart';
import '../../../core/helpers/spacing.dart';
import '../../../core/routing/routes.dart';
import '../../../core/theming/colors.dart';
import '../../../core/theming/styles.dart';
import 'widget/category/category_builder.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsManager.backgroundColor,
      appBar: AppBar(
        backgroundColor: ColorsManager.backgroundColor,
        title: Center(
          child: Column(
            children: [
              Text('Store location', style: Styles.font15LightGrayW500),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(Icons.location_on, color: ColorsManager.red),

                  Text('Cairo,Egypt', style: Styles.font20BlackW500),
                  horizontalSpace(10),
                ],
              ),
            ],
          ),
        ),
        leading: Padding(
          padding: EdgeInsets.only(left: 18.0.w, top: 5.h),
          child: SvgPicture.asset(
            AppAssets.menuIcon,
            height: 44.h,
            width: 44.w,
          ),
        ),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 18.w, top: 5),
            child: IconButton(
              onPressed: () {},
              icon: SvgPicture.asset(
                AppAssets.cartIcon,
                height: 44.h,
                width: 44.w,
              ),
            ),
          ),
        ],
      ),

      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.h),
        child: Column(
          children: [
            verticalSpace(20),
            SearchSection(
              readOnly: true,
              onClick: () => context.push(Routes.search),
            ),

            verticalSpace(10),
            CategoryBuilder(),
            ProductsBuilder(),
          ],
        ),
      ),
    );
  }
}
