import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shoppe/features/home/logic/category_logic/category_cubit.dart';

import '../../../../../core/helpers/spacing.dart';
import '../../../../../core/widget/loading_widget.dart';
import '../../../data/models/category_icon.dart';
import '../../../logic/category_logic/category_state.dart';
import '../../../logic/products_logic/products_cubit.dart';
import 'category_item.dart';

class CategoryBuilder extends StatelessWidget {
  const CategoryBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategoryCubit, CategoryState>(
      builder: (context, state) {
        if (state is CategoryLoading) {
          return const PrettyLoadingWidget();
        }
        if (state is CategorySuccess) {
          return Column(
            children: [
              SizedBox(
                height: 40.h,

                child: ListView.separated(
                  separatorBuilder: (_, __) => horizontalSpace(10),
                  itemCount: state.category.length,
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {

                    final isSelected = index == state.selectedIndex;
                    final category = state.category[index];
                    final icon = categoryIcons[category] ?? Icons.category;
                    final categoryName = state.category[index];

                    return GestureDetector(
                      onTap: () {
                        context.read<CategoryCubit>().selectedCategory(index);
                        context.read<ProductsCubit>().getProductByCategories(
                          category,
                        );
                      },
                      child: CategoryItem(
                        isSelected: isSelected,
                        categoryName: categoryName,
                        icon: icon,
                      ),
                    );
                  },
                ),
              ),
            ],
          );
        }
        if (state is CategoryError) {
          return Text(state.message);
        }
        return Text("No data");
      },
    );
  }
}
