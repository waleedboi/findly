import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../Constant/colors.dart';
import '../../../../../Constant/text_constant.dart';
import '../../../../Auth/Widgets/custom_auth_appbar.dart';

class ProfileTileContainer extends StatelessWidget {
  const ProfileTileContainer({
    super.key,
    required this.icon,
    required this.text,
    this.route,
    required this.onTap,
    this.iconheight,
    this.iconwidth,
  });
  final String icon;
  final String text;
  final String? route;
  final VoidCallback onTap;
  final double? iconheight;
  final double? iconwidth;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 56.h,
        padding: EdgeInsets.only(right: 14.w),
        decoration: BoxDecoration(
          color: whiteColor,
          borderRadius: BorderRadius.circular(10.r),
          boxShadow: [
            BoxShadow(
              color: const Color(0XFF000000).withOpacity(0.15),
              blurRadius: 15,
              spreadRadius: 1,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Row(
          children: [
            Container(
              height: 25.h,
              width: 3.w,
              color: primaryColor,
            ),
            SizedBox(width: 10.w),
            CircleContainer(
              height: 32.h,
              width: 32.w,
              color: primaryColor.withOpacity(0.1),
              child: Center(
                child: Image.asset(
                  icon,
                  height: iconheight ?? 13.h,
                  width: iconwidth ?? 13.w,
                  color: primaryColor,
                ),
              ),
            ),
            SizedBox(width: 10.w),
            workSansText(
                text: text,
                fontSize: 15.sp,
                fontWeight: FontWeight.w500,
                color: blackColor),
            const Spacer(),
            Icon(
              Icons.arrow_forward_ios,
              color: const Color(0xFFB0ADAD),
              size: 15.sp,
            ),
          ],
        ),
      ),
    );
  }
}

class ProfileTileContainer2 extends StatelessWidget {
  const ProfileTileContainer2({
    super.key,
    required this.icon,
    required this.text,
    this.route,
    required this.onTap,
    this.iconheight,
    this.iconwidth,
    this.bottomPadding,
  });
  final String icon;
  final String text;
  final String? route;
  final VoidCallback onTap;
  final double? iconheight;
  final double? iconwidth;
  final double? bottomPadding;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.only(top: 10.h, bottom: bottomPadding ?? 10.h),
        child: Container(
          height: 56.h,
          padding: EdgeInsets.only(right: 14.w),
          decoration: BoxDecoration(
            color: whiteColor,
            borderRadius: BorderRadius.circular(10.r),
            boxShadow: [
              BoxShadow(
                color: const Color(0XFF000000).withOpacity(0.15),
                blurRadius: 15,
                spreadRadius: 1,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: Row(
            children: [
              Container(
                height: 25.h,
                width: 3.w,
                color: primaryColor,
              ),
              SizedBox(width: 10.w),
              CircleContainer(
                height: 32.h,
                width: 32.w,
                color: primaryColor.withOpacity(0.1),
                child: Center(
                  child: Image.asset(
                    icon,
                    height: iconheight ?? 13.h,
                    width: iconwidth ?? 13.w,
                    color: primaryColor,
                  ),
                ),
              ),
              SizedBox(width: 10.w),
              workSansText(
                  text: text,
                  fontSize: 15.sp,
                  fontWeight: FontWeight.w500,
                  color: blackColor),
              const Spacer(),
              Icon(
                Icons.arrow_forward_ios,
                color: const Color(0xFFB0ADAD),
                size: 15.sp,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
