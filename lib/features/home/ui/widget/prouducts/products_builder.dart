import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:shoppe/core/routing/routes.dart';
import 'package:shoppe/core/theming/colors.dart';
import 'package:shoppe/core/theming/styles.dart';

import 'package:shoppe/features/home/ui/widget/new_arrivals_item.dart';
import 'package:shoppe/features/home/ui/widget/prouducts/product_item.dart';

import '../../../../../core/helpers/spacing.dart';
import '../../../../../core/widget/loading_widget.dart';

import '../../../logic/products_logic/products_cubit.dart';
import '../../../logic/products_logic/products_state.dart';

class ProductsBuilder extends StatelessWidget {
  const ProductsBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 4.0.w, vertical: 8.0.h),
          child: Row(
            children: [
              Text(
                "Popular Now",
                style: Styles.font18BlackW200.copyWith(
                  fontWeight: FontWeight.w500,
                ),
              ),
              Spacer(),
              TextButton(
                onPressed: () {

                },
                child: Text(
                  "See All",
                  style: Styles.font14GrayRegular.copyWith(
                    color: ColorsManager.primaryColor,
                  ),
                ),
              ),
            ],
          ),
        ),

        BlocBuilder<ProductsCubit, ProductsState>(
          builder: (context, state) {
            if (state is ProductLoading) {
              return const PrettyLoadingWidget();
            }
            if (state is ProductSuccess) {
              return ListView.separated(
                separatorBuilder: (_, __) => verticalSpace(10),
                itemCount: 1,
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                itemBuilder: (context, index) => Column(

                  children: [
                    // products row
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 4.0.w,
                        vertical: 4.0.h,
                      ),
                      child: Row(
                        children: [
                          GestureDetector(
                            onTap: () {
                              goToDetails( context, state.products[index]);
                            },
                            child: ProductItem(
                          product:  state.products[index],


                            ),
                          ),
                          Spacer(),
                          GestureDetector(
                            onTap: () {
                              goToDetails( context, state.products[index + 2]);
                            },
                            child: ProductItem(
                             product:  state.products[index + 2],

                            ),
                          ),
                        ],
                      ),
                    ),

                    // "new arrivals" text row
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 4.0.w,
                        vertical: 8.0.h,
                      ),
                      child: Row(
                        children: [
                          Text(
                            "New Arrivals",
                            style: Styles.font18BlackW200.copyWith(
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Spacer(),
                          TextButton(
                            onPressed: () {},
                            child: Text(
                              "See All",
                              style: Styles.font14GrayRegular.copyWith(
                                color: ColorsManager.primaryColor,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),

                    // new arrivals section
                    GestureDetector(
                      onTap: () {
                        goToDetails( context, state.products[index + 4]);
                      },
                      child: NewArrivalsItem(
                        productImage: state.products[index + 4].images![index],
                        productName:
                            state.products[index + 4].title ?? "no title",
                        productPrice: state.products[index + 4].price ?? 0.0,
                      ),
                    ),
                  ],
                ),
              );
            }
            if (state is ProductError) {
              return Center(child: Text(state.message));
            }
            return const Text("No Data");
          },
        ),
      ],
    );
  }
}
void goToDetails(context,product) => GoRouter.of(context).push(Routes.details,extra: product);