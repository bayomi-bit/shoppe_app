import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shoppe/features/home/ui/widget/search/search_product_builder.dart';
import 'package:shoppe/features/home/ui/widget/search/search_section.dart';

import '../../../../../core/theming/colors.dart';
import '../../../logic/search_logic/search_cubit.dart';

class SearchOverlay extends StatelessWidget {
  const SearchOverlay({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Scaffold(
        backgroundColor: ColorsManager.backgroundColor,
        body: SafeArea(
          child: Column(
            children: [
              // search bar
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 8.0.w,
                  vertical: 8.0.h,
                ),
                child: SearchSection(
                  readOnly: false,
                  onChange: (query) {
                    context.read<SearchCubit>().searchProduct(query);
                  },
                ),
              ),
              // products list
              SearchProductBuilder(),
            ],
          ),
        ),
      ),
    );
  }
}
