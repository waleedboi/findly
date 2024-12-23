import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../../Constant/colors.dart';
import '../../../../../../../Constant/text_constant.dart';
import '../../../../../../../Core/Custom/image_container.dart';

class MapLocationListview extends StatelessWidget {
  const MapLocationListview({
    super.key,
    required this.onTap,
  });
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 11.78.h),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          height: 110.h,
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: whiteColor,
            borderRadius: BorderRadius.circular(12.r),
            border: Border.all(
              color: const Color(0xFFC6C5C5),
            ),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const ImageContainer(),
              SizedBox(width: 10.w),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: 155.w,
                        child: workSansText(
                          text: "New Lake Hotel",
                          fontWeight: FontWeight.w500,
                          fontSize: 12.sp,
                          color: textColor,
                        ),
                      ),
                      Icon(
                        Icons.star,
                        color: yelloColor,
                        size: 10.sp,
                      ),
                      SizedBox(width: 2.w),
                      workSansText(
                        text: "4.5",
                        fontWeight: FontWeight.w500,
                        fontSize: 8.sp,
                        color: textColor,
                      ),
                    ],
                  ),
                  SizedBox(height: 5.h),
                  Row(
                    children: [
                      Icon(
                        Icons.location_on_outlined,
                        color: secondaryColor,
                        size: 12.sp,
                      ),
                      SizedBox(width: 4.w),
                      SizedBox(
                        width: 155.w,
                        child: workSansText(
                          text: "214 Regory Newark",
                          fontWeight: FontWeight.normal,
                          fontSize: 10.sp,
                          color: const Color(0XFFB2ADAD),
                        ),
                      ),
                      // const Spacer(),
                      SizedBox(width: 17.w),
                    ],
                  ),
                  SizedBox(height: 6.h),
                  workSansText(
                    text: "From R5000",
                    fontWeight: FontWeight.normal,
                    fontSize: 10.sp,
                    color: const Color(0XFFB2ADAD),
                  ),
                  SizedBox(height: 4.h),
                  workSansText(
                      text: "Available",
                      color: secondaryColor,
                      fontSize: 10.56.sp),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
