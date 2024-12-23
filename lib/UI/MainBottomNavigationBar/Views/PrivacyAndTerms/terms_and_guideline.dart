import 'package:findly/Constant/text_constant.dart';
import 'package:findly/UI/Auth/Widgets/custom_auth_appbar.dart';
import 'package:findly/UI/MainBottomNavigationBar/Views/PrivacyAndTerms/privacy_and_terms.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../Constant/colors.dart';
import '../../../../Core/Custom/container_widget.dart';

class TermsAndGuideline extends StatelessWidget {
  const TermsAndGuideline({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: BlueContainer(
            child: Stack(
      children: [
        CustomAuthAppBar2(text: "Terms & Guidelines", width: 50.w),
        WhiteContainer(
          topPadding: 117.h,
          // height: 0.8.sh,
          child: SingleChildScrollView(
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 26.w, vertical: 30.h),
              padding: EdgeInsets.symmetric(horizontal: 25.w, vertical: 30.h),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20.r),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.2),
                    spreadRadius: 5,
                    blurRadius: 10,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: workSansText2(
                maxLines: 200,
                text: privacyTermText,
                fontSize: 12.72.sp,
                fontWeight: FontWeight.normal,
                color: blackColor.withOpacity(0.4),
              ),
            ),
          ),
        ),
      ],
    )));
  }
}
