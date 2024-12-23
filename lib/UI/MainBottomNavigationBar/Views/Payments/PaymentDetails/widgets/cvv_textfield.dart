import 'package:findly/Constant/colors.dart';
import 'package:findly/Constant/text_constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class CvvTextField extends StatelessWidget {
  const CvvTextField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(left: 3.w),
            child: workSansText(
                text: "Cvv",
                color: blackColor,
                fontSize: 14.sp,
                fontWeight: FontWeight.w400),
          ),
          SizedBox(height: 5.h),
          TextFormField(
            decoration: InputDecoration(
              hintText: "Enter cvv",
              hintStyle: GoogleFonts.workSans(
                color: const Color(0xFFB3B3B3),
                fontSize: 14.sp,
                fontWeight: FontWeight.w400,
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.r),
                borderSide: const BorderSide(
                  color: Color(0xFF2AD4FF),
                ),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.r),
                borderSide: const BorderSide(
                  color: Color(0xFF2AD4FF),
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.r),
                borderSide: const BorderSide(
                  color: Color(0xFF2AD4FF),
                ),
              ),
              filled: true,
              fillColor: const Color(0xFFF2F2F2),
            ),
            inputFormatters: [
              FilteringTextInputFormatter.digitsOnly,
              LengthLimitingTextInputFormatter(4),
            ],
            keyboardType: TextInputType.number,
            obscureText: true,
          ),
        ],
      ),
    );
  }
}
