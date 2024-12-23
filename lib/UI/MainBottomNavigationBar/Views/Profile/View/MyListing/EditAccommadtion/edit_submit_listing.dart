import 'package:findly/Constant/assets_constant.dart';
import 'package:findly/Constant/colors.dart';
import 'package:findly/Constant/enum.dart';
import 'package:findly/Constant/text_constant.dart';
import 'package:findly/Core/Custom/app_button.dart';
import 'package:findly/Core/Custom/container_widget.dart';
import 'package:findly/Models/AccommodationModels/get_user_accommodation.dart';
import 'package:findly/UI/Auth/Widgets/custom_auth_appbar.dart';
import 'package:findly/UI/MainBottomNavigationBar/Views/PrivacyAndTerms/terms_and_guideline.dart';
import 'package:findly/UI/MainBottomNavigationBar/main_bottom_navigationbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/route_manager.dart';

class EditSubmitListing extends StatelessWidget {
  const EditSubmitListing({super.key, required this.type, required this.data});

  final ServiceType type;
  final GetuserAccommodation data;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PopScope(
        canPop: false,
        child: BlueContainer(
            child: Stack(
          children: [
            const CustomAuthAppBar2(
              text: "Submit Listing",
               allowBackPress: false,
            ),
            WhiteContainer(
                topPadding: 117.h,
                child: Column(
                  children: [
                    SizedBox(height: 55.h),
                    Image.asset(
                      completedpana,
                      height: 296.h,
                      width: 296.w,
                    ),
                    SizedBox(height: 32.h),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 34.w),
                      child: workSansText2(
                          text: txt,
                          textAlign: TextAlign.center,
                          fontSize: 14.sp,
                          maxLines: 3,
                          fontWeight: FontWeight.normal,
                          color: const Color(0XFF112022)),
                    ),
                    SizedBox(height: 42.h),
                    Padding(
                      padding: EdgeInsets.only(left: 37.w, right: 38.w),
                      child: AppButton(
                        onTap: () {
                          Get.to(const TermsAndGuideline());
                        },
                        text: "See terms and Guidelines",
                        buttonColor: const Color(0xFFFF2A7F),
                      ),
                    ),
                    SizedBox(height: 18.h),
                    Padding(
                      padding: EdgeInsets.only(left: 37.w, right: 38.w),
                      child: AppButton(
                        onTap: () async {
                          Get.offAll(const MainBottomNavigationbar());
                        },
                        text: "Ok",
                        buttonColor: primaryColor,
                      ),
                    ),
                  ],
                ))
          ],
        )),
      ),
    );
  }
}

String txt =
    "Thank you for Submitting your listing. We are currently reviewing it to ensure that it Complies with our terms and Guidelines.";
