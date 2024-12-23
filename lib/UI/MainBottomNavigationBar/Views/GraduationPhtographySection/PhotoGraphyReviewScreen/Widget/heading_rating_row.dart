import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../Constant/assets_constant.dart';
import '../../../../../../Constant/text_constant.dart';

class HeadingAndRatingRow extends StatelessWidget {
  const HeadingAndRatingRow({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 25.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          workSans16Text(text: "TDE Photography"),
          SizedBox(width: 45.w),
          Container(
            height: 30.h,
            width: 60.w,
            decoration: BoxDecoration(
                color: const Color(0xFFDADADA).withOpacity(0.7),
                borderRadius: BorderRadius.circular(6.r)),
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.only(bottom: 2.5.h),
                    child: Image.asset(
                      starfilled,
                      width: 11.w,
                      height: 10.15.h,
                    ),
                  ),
                  SizedBox(width: 1.89.w),
                  workSansText(
                      text: "4.9",
                      fontSize: 10.15.sp,
                      fontWeight: FontWeight.w500,
                      color: const Color(0xFF363030))
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
