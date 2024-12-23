import 'package:findly/Constant/text_constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CompletePaymentPriceContainer extends StatelessWidget {
  const CompletePaymentPriceContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 269.11.w,
      padding: EdgeInsets.only(top: 16.h, bottom: 21.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.r),
        gradient: const LinearGradient(
          colors: [
            Color(0xFF7BC9DE),
            Color(0xFF8437C8),
          ],
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
        ),
      ),
      child: Column(
        children: [
          workSansText(
            text: "Subtotal:",
            fontSize: 21.sp,
            fontWeight: FontWeight.w400,
          ),
          workSansText(
            text: "R299",
            fontSize: 26.67.sp,
            fontWeight: FontWeight.bold,
          ),
          workSansText(
            text: "Total:",
            fontSize: 21.sp,
            fontWeight: FontWeight.w400,
          ),
          workSansText(
            text: "R299",
            fontSize: 26.67.sp,
            fontWeight: FontWeight.bold,
          ),
        ],
      ),
    );
  }
}
