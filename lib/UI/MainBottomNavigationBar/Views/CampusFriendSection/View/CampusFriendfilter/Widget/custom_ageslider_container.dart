import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../../Constant/colors.dart';
import '../../../../../../../Constant/text_constant.dart';
import '../../../../AccommoadtionSection/View/AccommoadtionFilter/widget/custom_checkbox.dart';
import 'custom_age_slider.dart';

class AgeRangeSliderContainer extends StatelessWidget {
  const AgeRangeSliderContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return FilterContainer(
      leftpadding: 0,
      rightpadding: 0,
      width: 283.w,
      // height: 93.h,
      topPadding: 10.h,
      bottomPadding: 10.h,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: workSansText(
                text: "Age",
                fontSize: 16.sp,
                fontWeight: FontWeight.w500,
                color: textColor),
          ),
          SizedBox(height: 4.h),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 5.w),
            child: SizedBox(
                height: 44.h,
                width: 250.w,
                child: const CustomAgeRangeSlider()),
          ),
          SizedBox(height: 4.h),
        ],
      ),
    );
  }
}
