import 'package:findly/UI/MainBottomNavigationBar/Views/PrivacyAndTerms/terms_and_guideline.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class TermAndGuidelineTextWidget extends StatelessWidget {
  const TermAndGuidelineTextWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return RichText(
        text: TextSpan(children: [
      TextSpan(
        text: "in accordance with our ",
        style: GoogleFonts.workSans(
          color: const Color(0xFF666666),
          fontSize: 11.sp,
          fontWeight: FontWeight.w400,
        ),
      ),
      TextSpan(
        text: "Terms and guidelines",
        style: GoogleFonts.workSans(
          color: const Color(0xFFFF6600),
          fontSize: 12.sp,
          fontWeight: FontWeight.w400,
        ),
        recognizer: TapGestureRecognizer()
          ..onTap = () {
            Get.to(() => const TermsAndGuideline());
          },
      )
    ]));
  }
}
