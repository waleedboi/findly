import 'package:findly/UI/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../Constant/assets_constant.dart';
import '../../../Constant/colors.dart';

class AuthLogoWidget extends StatelessWidget {
  const AuthLogoWidget({
    super.key,
    this.isFrombottomSheet,
  });
  final bool? isFrombottomSheet;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 25.w, right: 25.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: () {
              // Navigator.pop(context);
              if (isFrombottomSheet ?? false) {
                Get.back();
              } else {
                Get.offAll(const SplashScreen(), transition: Transition.fadeIn);
              }
            },
            child: Icon(
              Icons.arrow_back,
              color: blackColor,
              size: 25.sp,
            ),
          ),
          Image.asset(
            logo,
            height: 78.h,
            width: 78.w,
          ),
          SizedBox(width: 25.w)
        ],
      ),
    );
  }
}

class TopNotchContainer extends StatelessWidget {
  const TopNotchContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 4.h,
      width: 36.w,
      margin: EdgeInsets.only(top: 10.h),
      decoration: BoxDecoration(
        color: lightGreyColor.withOpacity(0.5),
        borderRadius: BorderRadius.circular(11.r),
      ),
    );
  }
}
