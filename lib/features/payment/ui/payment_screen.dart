import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:shoppe/features/payment/ui/widgets/address_builder.dart';
import 'package:shoppe/features/payment/ui/widgets/contact_info_builder.dart';
import 'package:shoppe/features/payment/ui/widgets/payment_builder.dart';
import '../../../core/helpers/spacing.dart';
import '../../../core/theming/colors.dart';
import '../../../core/theming/styles.dart';
import '../../../core/widget/back_ic_app_bar.dart';

class PaymentScreen extends StatelessWidget {
  final int amount;

  const PaymentScreen({super.key, required this.amount});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsManager.backgroundColor,
      appBar: AppBar(
        backgroundColor: ColorsManager.backgroundColor,
        title: Text(
          "Payment",
          style: Styles.font15BlackW500.copyWith(fontSize: 18.sp),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: const BackIcAppBar(),
          onPressed: () {
            context.pop();
          },
        ),
      ),
      body: Column(
        children: [
          // info card
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 12.0.w, vertical: 20.0.h),
            child: Container(
              width: double.maxFinite,
              height: 434.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.r),
                color: ColorsManager.white,
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 20.0.w,
                  vertical: 15.0.h,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ContactInfoBuilder(),
                    verticalSpace(10),
                    Text("Address", style: Styles.font15BlackW500),
                    verticalSpace(10),
                    AddressBuilder(),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
      // payment section
      bottomSheet: PaymentBuilder(amount: amount),
    );
  }
}
