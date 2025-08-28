import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:shoppe/features/cart/ui/widget/cart_item.dart';
import 'package:shoppe/features/cart/ui/widget/checkout.dart';
import '../../../core/theming/colors.dart';
import '../../../core/theming/styles.dart';
import '../../../core/widget/back_ic_app_bar.dart';
import '../../../core/widget/loading_widget.dart';
import '../logic/cart_cubit.dart';

class ProductsCartScreen extends StatelessWidget {
  const ProductsCartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartCubit, CartState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: Text(
              "My Cart",
              style: Styles.font15BlackW500.copyWith(fontSize: 18.sp),
            ),
            centerTitle: true,
            backgroundColor: ColorsManager.backgroundColor,
            leading: IconButton(
              onPressed: () {
                context.pop();
              },

              icon: BackIcAppBar(),
            ),
          ),
          backgroundColor: ColorsManager.backgroundColor,
          body: () {
            if (state is CartEmpty) {
              return Center(child: Text("Cart is empty"));
            }

            if (state is CartLoading) {
              return const Center(child: PrettyLoadingWidget());
            }
            if (state is CartSuccess) {
              return Column(
                children: [
                  Flexible(
                    child: ListView.builder(
                      itemCount: state.cartResponseModel.products!.length,
                      itemBuilder: (context, index) {
                        final product =
                            state.cartResponseModel.products![index];

                        return CartItem(product: product);
                      },
                    ),
                  ),

                  Checkout(
                    discountedTotal:
                        state.cartResponseModel.discountedTotal ?? 0,
                  ),
                ],
              );
            }
            if (state is CartError) {
              return Center(child: Text(state.message));
            }
            return Container();
          }(),
        );
      },
    );
  }
}
