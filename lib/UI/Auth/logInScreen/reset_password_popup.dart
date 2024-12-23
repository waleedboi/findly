import 'package:findly/Core/Custom/custom_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../Constant/colors.dart';
import '../../../Constant/text_constant.dart';
import '../../../Core/Custom/app_button.dart';

class ResetPasswordPopup extends StatelessWidget {
  ResetPasswordPopup({
    super.key,
  });
  final TextEditingController textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Center(
        child: Container(
          height: 300.h,
          margin: EdgeInsets.symmetric(horizontal: 20.w),
          decoration: const BoxDecoration(
            color: whiteColor,
            borderRadius: BorderRadius.all(
              Radius.circular(10),
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Icon(Icons.delete, color: Colors.red, size: 50.r),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: workSansText2(
                  text: "Enter the email address associated with your account",
                  textAlign: TextAlign.center,
                  maxLines: 5,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w600,
                  color: blackColor,
                ),
              ),
              SizedBox(height: 30.h),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: CustomTextField2(
                    hintText: "Enetr your email",
                    controller: textEditingController),
              ),

              SizedBox(height: 30.h),

              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: Row(
                  children: [
                    Expanded(
                        child: AppButton(
                            borderRadius: 10.r,
                            buttonColor: Colors.grey.withOpacity(0.3),
                            height: 48.h,
                            textColor: textColor.withOpacity(0.7),
                            onTap: () {
                              Get.back();
                            },
                            text: "Cancel")),
                    SizedBox(width: 40.w),
                    Expanded(
                      child: AppButton(
                          borderRadius: 10.r,
                          height: 48.h,
                          buttonColor: primaryColor,
                          onTap: () {
                            Get.back();
                            // Get.offAll(() => LogInScreen());
                          },
                          text: "Get a link"),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
