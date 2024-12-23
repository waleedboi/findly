import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../../Constant/assets_constant.dart';
import '../../../../../../../Constant/colors.dart';

class FilterButton extends StatelessWidget {
  const FilterButton({
    super.key,
    required this.onTap,
    this.image,
  });
  final VoidCallback onTap;
  final String? image;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 58.h,
        width: 55.w,
        padding: EdgeInsets.all(10.r),
        decoration: BoxDecoration(
          color: whiteColor,
          borderRadius: BorderRadius.circular(10.r),
          boxShadow: [
            BoxShadow(
              color: blackColor.withOpacity(0.2),
              spreadRadius: 0,
              blurRadius: 30,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Image.asset(image ?? menu),
      ),
    );
  }
}
