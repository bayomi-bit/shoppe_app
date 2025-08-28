import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/theming/colors.dart';

class SearchSection extends StatelessWidget {
  final GestureTapCallback? onClick;
  final bool? readOnly;
  final ValueChanged<String>? onChange ;

  const SearchSection({super.key, this.onClick,  this.readOnly ,  this.onChange});

  @override
  Widget build(BuildContext context) {
    return TextFormField(

      readOnly: readOnly ?? false,
      onTap: onClick,
      onChanged: onChange,

      decoration: InputDecoration(
        hintText: 'Search',
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(25.0.r),
          borderSide: BorderSide(width: 1.3.w, color: ColorsManager.white),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0.r),
          borderSide: BorderSide(color: ColorsManager.white, width: 1.3.w),
        ),
        contentPadding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
        fillColor: ColorsManager.moreLightGray,
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0.r),
          borderSide: BorderSide(color: ColorsManager.white, width: 1.3.w),
        ),
        filled: true,
        prefixIcon: Icon(Icons.search, color: ColorsManager.lightGray),
      ),
    );
  }
}
