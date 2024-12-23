import 'package:findly/Constant/colors.dart';
import 'package:findly/Constant/text_constant.dart';
import 'package:findly/UI/MainBottomNavigationBar/Views/Payments/CompletePayment/complete_payment.dart';
import 'package:findly/UI/MainBottomNavigationBar/Views/Payments/PaymentDetails/widgets/cardnumber_textfield.dart';
import 'package:findly/UI/MainBottomNavigationBar/Views/Payments/PaymentDetails/widgets/cvv_textfield.dart';
import 'package:findly/UI/MainBottomNavigationBar/Views/Payments/PaymentDetails/widgets/expirydate_textfield.dart';
import 'package:findly/UI/MainBottomNavigationBar/Views/Payments/widgets/payment_buttons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/route_manager.dart';

class PaymentDetails extends StatelessWidget {
  const PaymentDetails({super.key});

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
                text: "Payment details",
                fontSize: 21.sp,
                color: const Color(0xFF0C4A9A),
                fontWeight: FontWeight.w700),
            SizedBox(height: 47.h),
            Container(
              width: 1.sw,
              height: 290.h,
              padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 18.h),
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
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 3.w),
                    child: workSansText(
                        text: "Card Number",
                        color: blackColor,
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w400),
                  ),
                  SizedBox(height: 5.h),
                  const CardNumberTextField(),
                  SizedBox(height: 17.h),
                  Row(
                    children: [
                      const ExpiryDateTextfield(),
                      SizedBox(width: 13.w),
                      const CvvTextField()
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 26.74.h),
            PaymentContinueButton(onTap: () {
              Get.to(() => const CompletePayment());
            }),
            SizedBox(height: 15.h),
            PaymentBackButton(onTap: () {
              Get.back();
            })
          ],
        ),
      ),
    );
  }
}
