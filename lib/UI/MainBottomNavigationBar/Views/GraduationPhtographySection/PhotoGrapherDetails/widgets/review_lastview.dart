import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../Constant/assets_constant.dart';
import '../../../../../../Constant/colors.dart';
import '../../../../../../Constant/text_constant.dart';
import '../photographer_details.dart';

class DetailScreenReviewListView extends StatelessWidget {
  const DetailScreenReviewListView({
    super.key,
    required this.data,
    required this.islastItem,
  });

  final PhotoGraphyReviewModel data;
  final bool islastItem;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 14.h),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                height: 48.h,
                width: 48.w,
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(10.r),
                ),
                child: Image.asset(
                  data.profile!,
                  height: 48.h,
                  width: 48.w,
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(width: 12.w),
              SizedBox(
                height: 56.h,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    workSansText(
                        text: data.name!,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w600,
                        color: const Color(0xFF0F1828)),
                    SizedBox(height: 2.h),
                    SizedBox(
                      width: 161.w,
                      child: workSansText(
                          text: data.review!,
                          fontSize: 14.sp,
                          fontWeight: FontWeight.normal,
                          color: const Color(0xFFADB5BD)),
                    ),
                  ],
                ),
              ),
              const Spacer(),
              Column(
                children: [
                  workSansText(
                      text: data.time!,
                      fontSize: 12.sp,
                      color: blackColor.withOpacity(0.4),
                      fontWeight: FontWeight.w600),
                  SizedBox(height: 10.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      SizedBox(width: 15.w),
                      Image.asset(
                        starfilled,
                        width: 11.w,
                        height: 10.15.h,
                      ),
                      SizedBox(width: 4.68.w),
                      workSansText(
                          text: data.rating!,
                          fontSize: 10.16.sp,
                          color: const Color(0xFF363030),
                          fontWeight: FontWeight.w500)
                    ],
                  )
                ],
              )
            ],
          ),
          if (!islastItem) ...[
            SizedBox(height: 10.h),
            Divider(
              color: const Color(0xFFE9E9E9),
              height: 0.h,
              endIndent: 0.w,
              indent: 60.w,
            ),
          ]
        ],
      ),
    );
  }
}
