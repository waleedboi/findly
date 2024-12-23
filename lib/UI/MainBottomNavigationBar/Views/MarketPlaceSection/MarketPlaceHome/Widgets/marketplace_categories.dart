import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../Constant/text_constant.dart';

class MarketplaceCategories extends StatelessWidget {
  const MarketplaceCategories({
    super.key,
    required this.image,
    required this.text,
    required this.height,
    required this.width,
    this.textWidth,
    required this.onTap,
    required this.isSelected,
  });
  final String image;
  final String text;
  final double height;
  final double width;
  final double? textWidth;
  final VoidCallback onTap;
  final bool isSelected;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Container(
            height: 68.87.h,
            width: 68.87.w,
            decoration: BoxDecoration(
              color: const Color(0xFF999999).withOpacity(0.15),
              borderRadius: BorderRadius.circular(12.r),
              border: isSelected
                  ? Border.all(color: const Color(0XFFFFFF00), width: 4.w)
                  : null,
            ),
            child: Center(
              child: Image.asset(
                image,
                height: height,
                width: width,
              ),
            ),
          ),
          SizedBox(height: 8.h),
          SizedBox(
            width: textWidth ?? 68.87.w,
            child: workSansText(
              text: text,
              fontWeight: FontWeight.w400,
              textAlign: TextAlign.center,
              maxLines: 2,
              fontSize: 10.sp,
              color: const Color(0Xff1E1E1E),
            ),
          ),
        ],
      ),
    );
  }
}
