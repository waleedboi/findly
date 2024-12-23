import 'package:findly/Constant/colors.dart';
import 'package:findly/Constant/text_constant.dart';
import 'package:findly/UI/MainBottomNavigationBar/Views/Payments/widgets/payment_buttons.dart';
import 'package:findly/UI/MainBottomNavigationBar/main_bottom_navigationbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class SuccessfulPaymentPop extends StatelessWidget {
  const SuccessfulPaymentPop({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: 316.h,
        // width: 338.w,
        // margin: EdgeInsets.symmetric(horizontal: 40.w),
        padding: EdgeInsets.only(top: 36.h, left: 50.w, right: 50.w),
        decoration: BoxDecoration(
          color: whiteColor,
          borderRadius: BorderRadius.circular(20.r),
          boxShadow: [
            BoxShadow(
              color: const Color(0xFF000000).withOpacity(0.1),
              blurRadius: 20.r,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          children: [
            workSansText(
                text: "Payment Successful",
                fontSize: 24.sp,
                fontWeight: FontWeight.w400,
                color: blackColor),
            SizedBox(height: 11.h),
            GradientIcon(
              icon: Icons.check_circle,
              size: 112.sp,
              gradient: const LinearGradient(
                colors: <Color>[Color(0xFF18ACFE), Color(0xFF0163E0)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            workSansText(
                text: "Your listing will be added shortly!",
                fontSize: 12.sp,
                fontWeight: FontWeight.w400,
                color: blackColor),
            SizedBox(height: 26.h),
            PaymentBackButton(
                text: "Ok",
                width: 86.w,
                onTap: () {
                  Get.offAll(() => const MainBottomNavigationbar());
                })
          ],
        ),
      ),
    );
  }
}

class GradientIcon extends StatelessWidget {
  final IconData icon;
  final double size;
  final Gradient gradient;

  const GradientIcon({
    super.key,
    required this.icon,
    required this.size,
    required this.gradient,
  });

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      shaderCallback: (Rect bounds) {
        return gradient.createShader(bounds);
      },
      child: Icon(
        icon,
        size: size,
        color: Colors.white,
      ),
    );
  }
}
