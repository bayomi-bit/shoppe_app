import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/helpers/spacing.dart';

class CategoryItem extends StatelessWidget {
  final bool isSelected;
  final String categoryName;
  final IconData icon;

  const CategoryItem({
    super.key,
    required this.isSelected,
    required this.categoryName,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return IntrinsicWidth(
      child: AnimatedContainer(
        width: isSelected ? null : 40.w,

        duration: Duration(milliseconds: 300),

        decoration: BoxDecoration(
          color: isSelected ? Colors.blue : Colors.grey[300],
          borderRadius: BorderRadius.circular(20.r),
        ),
        child: isSelected
            ? Padding(
                padding: EdgeInsets.symmetric(horizontal: 5.0.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      width: 30.w,
                      height: 30.h,

                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15.r),
                      ),
                      child: Icon(icon),
                    ),
                    horizontalSpace(5),
                    Text(limitWords(categoryName, 1)),
                  ],
                ),
              )
            : Icon(icon),
      ),
    );
  }
}

String limitWords(String text, int maxWords) {
  List<String> words = text.split(' ');
  if (words.length <= maxWords) return text;
  return '${words.take(maxWords).join(' ')}...';
}
