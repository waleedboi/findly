import 'package:findly/Constant/colors.dart';
import 'package:findly/Constant/text_constant.dart';
import 'package:findly/Core/Custom/app_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class ListingDeletePopup extends StatelessWidget {
  const ListingDeletePopup({
    super.key,
    this.onDelete,
  });
  final VoidCallback? onDelete;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Center(
        child: Container(
          height: 200.h,
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
                  text: "Are you sure you want to delete this listing?",
                  textAlign: TextAlign.center,
                  maxLines: 5,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w600,
                  color: blackColor,
                ),
              ),
              SizedBox(height: 40.h),
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
                            onTap: onDelete ?? () {},
                            text: "Delete"))
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
