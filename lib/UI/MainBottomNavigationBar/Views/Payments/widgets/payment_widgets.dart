import 'package:findly/Constant/colors.dart';
import 'package:findly/Constant/text_constant.dart';
import 'package:findly/UI/Auth/Widgets/custom_auth_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class PriceContainer extends StatelessWidget {
  const PriceContainer({super.key, this.text});
  final String? text;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topCenter,
      clipBehavior: Clip.none,
      children: [
        Container(
          width: 338.w,
          // height: 327.h,
          padding: EdgeInsets.only(left: 38.w, top: 60.h, bottom: 44.h),
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
            children: [
              const RowWidget(text: "Advertise for 3 Months"),
              SizedBox(height: 20.h),
              const RowWidget(text: "Reach more clients"),
              SizedBox(height: 20.h),
              const RowWidget(text: "24/7 Email support"),
              SizedBox(height: 49.h),
              Container(
                  height: 84.h,
                  width: 256.w,
                  margin: EdgeInsets.only(right: 38.w),
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                      colors: [
                        Color(0xFF37ABC8),
                        Color(0xFFBA68E7),
                      ],
                    ),
                    borderRadius: BorderRadius.circular(20.r),
                  ),
                  child: Center(
                    child: RichText(
                        text: TextSpan(
                      children: [
                        TextSpan(
                          text: text ?? "R299",
                          style: GoogleFonts.workSans(
                            color: whiteColor,
                            fontSize: 44.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        TextSpan(
                          text: "once",
                          style: GoogleFonts.workSans(
                            color: whiteColor,
                            fontSize: 14.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    )),
                  )),
            ],
          ),
        ),
        const StandardTextContainer(),
      ],
    );
  }
}

class RowWidget extends StatelessWidget {
  const RowWidget({
    super.key,
    required this.text,
  });
  final String text;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleContainer(
          color: secondaryColor,
          height: 19.57.h,
          width: 19.57.w,
        ),
        SizedBox(width: 10.w),
        workSansText(
            text: text,
            fontSize: 16.sp,
            color: const Color(0xFF4D4D4D),
            fontWeight: FontWeight.w400),
      ],
    );
  }
}

class StandardTextContainer extends StatelessWidget {
  const StandardTextContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: -17.h,
      child: Container(
        width: 168.w,
        height: 36.h,
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            colors: [
              Color(0xFF7BC9DE),
              Color(0xFF375EC8),
            ],
          ),
          borderRadius: BorderRadius.circular(10.r),
        ),
        child: Center(
          child: workSansText(
              text: "Standard",
              color: whiteColor,
              fontSize: 16.sp,
              fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
