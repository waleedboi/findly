import 'package:findly/UI/MainBottomNavigationBar/Views/GraduationPhtographySection/GraduationPhotoGraphyHome/getGig_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../Constant/colors.dart';
import '../../../../../../Constant/text_constant.dart';

class RegionNames extends StatelessWidget {
  const RegionNames({
    super.key,
    this.gig,
  });

  final Gig? gig;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        RegionContainer(
          text: gig?.regions ?? '',
          gradient: const LinearGradient(
            colors: [
              Color(0xFF6AA4F1),
              Color(0xFF22508E),
            ], // Gradient colors
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
          ),
        ),
      ],
    );
  }
}

class RegionContainer extends StatelessWidget {
  const RegionContainer({
    super.key,
    required this.text,
    required this.gradient,
    this.width,
  });

  final String text;
  final Gradient gradient;
  final double? width;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 14.w),
      decoration: BoxDecoration(
        gradient: gradient,
        borderRadius: BorderRadius.circular(17.56.r),
      ),
      child: Center(
        child: workSansText(
            text: text,
            color: whiteColor,
            fontSize: 11.56.sp,
            fontWeight: FontWeight.w500),
      ),
    );
  }
}
