import 'package:findly/Core/Custom/app_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/route_manager.dart';

import '../../../../../../Constant/colors.dart';
import '../../../../../../Constant/text_constant.dart';
import '../../../../../../Core/Custom/custom_textfield.dart';
import '../../../MarketPlaceSection/MarketPlaceSubmitListing/marketplace_submitlisting.dart';

class AddReviewWidget extends StatelessWidget {
  AddReviewWidget({
    super.key,
  });
  final TextEditingController textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Center(
        child: Container(
          height: 400.h,
          margin: EdgeInsets.symmetric(horizontal: 20.w),
          decoration: const BoxDecoration(
            color: whiteColor,
            borderRadius: BorderRadius.all(
              Radius.circular(10),
            ),
          ),
          child: Column(
            children: [
              SizedBox(height: 15.h),
              workSansText(
                text: "What's your rating?",
                fontSize: 14.sp,
                fontWeight: FontWeight.bold,
                color: blackColor,
              ),
              SizedBox(height: 15.h),
              RatingBar.builder(
                initialRating: 2,
                minRating: 1,
                direction: Axis.horizontal,
                allowHalfRating: true,
                itemCount: 5,
                itemSize: 35.sp,
                itemPadding: EdgeInsets.symmetric(horizontal: 3.w),
                itemBuilder: (context, _) => Icon(
                  Icons.star_rate_rounded,
                  color: const Color(0xFFF7B10D),
                  size: 20.sp,
                ),
                onRatingUpdate: (rating) {
                  print(rating);
                  // model.setRating(rating);
                },
              ),
              SizedBox(height: 15.h),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 70.w),
                child: workSansText2(
                  text: "Please share your opinion about the product",
                  textAlign: TextAlign.center,
                  maxLines: 2,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w600,
                  color: blackColor,
                ),
              ),
              SizedBox(height: 15.h),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 15.w),
                child: CustomTextField2(
                  maxLines: 4,
                  hintText: txt,
                  controller: textEditingController,
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
                            buttonColor: secondaryColor,
                            onTap: () {
                              Get.back();
                            },
                            text: "Post"))
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
