import 'package:findly/Constant/colors.dart';
import 'package:findly/Constant/text_constant.dart';
import 'package:findly/Core/Custom/circular_progress.dart';
import 'package:findly/UI/MainBottomNavigationBar/Views/Payments/CompletePayment/widgets/complete_payment_price_container.dart';
import 'package:findly/UI/MainBottomNavigationBar/Views/Payments/CompletePayment/widgets/terms_and_guidelinetext_widget.dart';
import 'package:findly/UI/MainBottomNavigationBar/Views/Payments/CompletePayment/widgets/unsuccessful_payment_popup.dart';
import 'package:findly/UI/MainBottomNavigationBar/Views/Payments/widgets/payment_buttons.dart';
import 'package:findly/UI/MainBottomNavigationBar/Views/Profile/View/AddPhotoGraphyGig/add_photographygig_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

class CompletePayment extends StatelessWidget {
  const CompletePayment({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<AddPhotographygigViewmodel>(
        builder: (context, model, child) {
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
                  text: "Complete payment",
                  fontSize: 21.sp,
                  color: const Color(0xFF0C4A9A),
                  fontWeight: FontWeight.w700),
              SizedBox(height: 47.h),
              Container(
                width: 1.sw,
                padding: EdgeInsets.only(
                    left: 33.w, top: 34.h, right: 35.w, bottom: 34.h),
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
                    const CompletePaymentPriceContainer(),
                    SizedBox(height: 38.h),
                    workSansText(
                      text: "By tapping pay, you agree to pay the total above",
                      fontSize: 11.sp,
                      color: const Color(0xFF666666),
                      fontWeight: FontWeight.w400,
                    ),
                    const TermAndGuidelineTextWidget(),
                  ],
                ),
              ),
              SizedBox(height: 26.h),
              model.loading
                  ? const KCircularProgress()
                  : PaymentContinueButton(
                      text: "Pay",
                      onTap: () async {
                        await model.addGig();
                      }),
              SizedBox(height: 15.h),
              PaymentBackButton(
                  text: "Cancel",
                  onTap: () {
                    Get.dialog(
                      const PopScope(
                        canPop: false,
                        child: UnscuccessulPaymentPpoup(),
                      ),
                      barrierDismissible: false,
                    );
                  })
            ],
          ),
        ),
      );
    });
  }
}
