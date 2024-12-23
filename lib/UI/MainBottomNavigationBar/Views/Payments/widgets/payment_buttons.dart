import 'package:findly/Constant/colors.dart';
import 'package:findly/Constant/text_constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PaymentBackButton extends StatelessWidget {
  const PaymentBackButton({
    super.key,
    required this.onTap,
    this.text,
    this.width,
  });
  final VoidCallback onTap;
  final String? text;
  final double? width;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 56.h,
        width: width ?? 1.sw,
        margin: EdgeInsets.symmetric(horizontal: 12.w),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.r),
          gradient: const LinearGradient(
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            colors: [
              Color(0xFF18ACFE),
              Color(0xFF0163E0),
            ],
          ),
        ),
        child: Center(
          child: workSansText(
              text: text ?? "Back",
              color: whiteColor,
              fontSize: 16.sp,
              fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}

class PaymentContinueButton extends StatelessWidget {
  const PaymentContinueButton({
    super.key,
    required this.onTap,
    this.text,
  });

  final VoidCallback onTap;
  final String? text;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 56.h,
        width: 1.sw,
        margin: EdgeInsets.symmetric(horizontal: 12.w),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.r),
          gradient: const LinearGradient(
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            stops: [0.0, 0.21, 1.0],
            colors: [
              Color(0xFFB13589),
              Color(0xFFAB2FC6),
              Color(0xFF8A3AC8),
            ],
          ),
        ),
        child: Center(
          child: workSansText(
              text: text ?? "Continue",
              color: whiteColor,
              fontSize: 16.sp,
              fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
