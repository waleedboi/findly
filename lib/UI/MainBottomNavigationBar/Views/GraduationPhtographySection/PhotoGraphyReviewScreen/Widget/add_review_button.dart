import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../Constant/colors.dart';
import '../../../../../../Constant/text_constant.dart';

class AddReviewButton extends StatelessWidget {
  const AddReviewButton({
    super.key,
    required this.onTap,
  });
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 42.h,
        width: 131.w,
        margin: EdgeInsets.only(left: 36.w),
        decoration: BoxDecoration(
            color: secondaryColor, borderRadius: BorderRadius.circular(5.14.r)),
        child: Center(
          child: workSansText(
              text: "+ Add Review",
              fontSize: 14.06.sp,
              color: whiteColor,
              fontWeight: FontWeight.w600),
        ),
      ),
    );
  }
}
