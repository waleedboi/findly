import 'package:findly/Constant/colors.dart';
import 'package:findly/Constant/text_constant.dart';
import 'package:findly/UI/MainBottomNavigationBar/Views/Payments/PaymentDetails/payment_details.dart';
import 'package:findly/UI/MainBottomNavigationBar/Views/Payments/widgets/payment_buttons.dart';
import 'package:findly/UI/MainBottomNavigationBar/Views/Payments/widgets/payment_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class PaymentHome extends StatelessWidget {
  const PaymentHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF2AD4FF),
      body: Container(
        margin: EdgeInsets.only(top: 80.h),
        padding: EdgeInsets.symmetric(horizontal: 26.w),
        width: 1.sw,
        height: 1.sh,
        decoration: BoxDecoration(
          color: whiteColor.withOpacity(0.89),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30.r),
            topRight: Radius.circular(30.r),
          ),
        ),
        child: Column(
          children: [
            SizedBox(height: 50.h),
            workSansText(
                text: "Listing packages",
                fontSize: 21.sp,
                color: const Color(0xFF0C4A9A),
                fontWeight: FontWeight.w700),
            SizedBox(height: 47.h),
            const PriceContainer(text: "R299"),
            SizedBox(height: 26.h),
            PaymentContinueButton(
              onTap: () {
                Get.to(() => const PaymentDetails());
              },
            ),
            SizedBox(height: 15.h),
            PaymentBackButton(
              onTap: () {
                Get.back();
              },
            ),
          ],
        ),
      ),
    );
  }
}
