import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/routing/routes.dart';
import '../../../../core/widget/dialog.dart';
import '../../../cart/ui/widget/checkout.dart';
import '../../logic/payment_logic/payment_cubit.dart';

class PaymentBuilder extends StatelessWidget {
  final int amount;

  const PaymentBuilder({super.key, required this.amount});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PaymentCubit, PaymentState>(
      listener: (context, state) {
        if (state is PaymentSuccess) {
          DialogManager.showSuccessDialog(
            context: context,
            title: "Success",
            onPress: () {
              context.push(Routes.home);
            },
            description: "Your Payment is successful",
          );
        }
        if (state is PaymentError) {
          DialogManager.showErrorDialog(
            context: context,
            title: "Error",
            onPress: () {},
            description: state.message,
          );
        }
      },
      builder: (context, state) {
        return Checkout(
          discountedTotal: amount - 40,
          onClick: () {
            context.read<PaymentCubit>().makePayment(amount, "USD");
          },
        );
      },
    );
  }
}
