import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../Constant/colors.dart';

class SocialButton extends StatelessWidget {
  const SocialButton({
    super.key,
    required this.onTap,
    required this.image,
  });
  final VoidCallback onTap;
  final String image;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 59.h,
        width: 59.w,
        decoration: BoxDecoration(
            color: primaryColor.withOpacity(0.15), shape: BoxShape.circle),
        child: Center(
          child: Image.asset(
            image,
            height: 25.h,
            width: 25.w,
          ),
        ),
      ),
    );
  }
}
