import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shoppe/features/home/ui/widget/prouducts/product_item.dart';
import 'package:shoppe/features/home/ui/widget/prouducts/products_builder.dart';

import '../../../../../core/widget/loading_widget.dart';
import '../../../logic/search_logic/search_cubit.dart';

class SearchProductBuilder extends StatelessWidget {
  const SearchProductBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: BlocBuilder<SearchCubit, SearchState>(
        builder: (context, state) {
          if (state is SearchLoading) {
            return const PrettyLoadingWidget();
          }
          if (state is SearchError) {
            return const Text("Error");
          }

          if (state is SearchSuccess && state.products.isNotEmpty) {
            return GridView.builder(
              shrinkWrap: true,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 10.w,
                mainAxisSpacing: 10.h,
                mainAxisExtent: 250.h,
              ),
              padding: EdgeInsets.symmetric(horizontal: 6.w, vertical: 8.h),

              itemCount: state.products.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap:  () {
                    goToDetails(context, state.products[index]);
                  },
                  child: ProductItem(
                    product:  state.products[index],
                  ),
                );
              },
            );
          }
          return Text("No Result Found");
        },
      ),
    );
  }
}
