import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../Constant/colors.dart';
import '../../../../../Constant/text_constant.dart';
import '../../../../../Core/Custom/image_container.dart';

class MessageRelatedContainer extends StatelessWidget {
  const MessageRelatedContainer({super.key, required this.onTap});

  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 144.h,
        margin: EdgeInsets.only(bottom: 20.h, top: 20.h),
        padding: EdgeInsets.only(top: 10.h, left: 13.w, right: 13.w),
        decoration: BoxDecoration(
          color: const Color(0xFFDADADA),
          borderRadius: BorderRadius.circular(12.r),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            workSansText(
              text: "This conversation is related to:",
              fontSize: 13.sp,
              color: const Color(0XFF9B9B9B),
            ),
            Container(
              height: 97.47.h,
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: whiteColor,
                borderRadius: BorderRadius.circular(13.r),
              ),
              child: Row(
                children: [
                  const ImageContainer(),
                  SizedBox(width: 4.h),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Icon(
                            Icons.location_on_outlined,
                            color: secondaryColor,
                            size: 15.sp,
                          ),
                          SizedBox(width: 4.w),
                          SizedBox(
                            width: 155.w,
                            child: workSansText(
                              text: "Westdene, Johannesburg",
                              fontWeight: FontWeight.w500,
                              fontSize: 12.sp,
                              color: textColor,
                            ),
                          ),
                          // const Spacer(),
                          SizedBox(width: 17.w),
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
                      SizedBox(height: 6.h),
                      Padding(
                        padding: EdgeInsets.only(left: 5.w),
                        child: workSansText(
                            text: "From R5000",
                            color: textColor,
                            fontSize: 10.56.sp),
                      ),
                      SizedBox(height: 6.h),
                      Padding(
                        padding: EdgeInsets.only(left: 5.w),
                        child: workSansText(
                            text: "Available",
                            color: textColor,
                            fontSize: 10.56.sp),
                      )
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
