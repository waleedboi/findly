import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../../../Constant/assets_constant.dart';
import '../../../../../../../Constant/colors.dart';
import '../../../../../../../Constant/text_constant.dart';

class FooterWidget extends StatelessWidget {
  const FooterWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          heart,
          color: blackColor,
          height: 15.h,
          width: 15.w,
        ),
        SizedBox(width: 5.w),
        workSansText(
          text: "35 people bookmark this place",
          fontWeight: FontWeight.normal,
          fontSize: 14.sp,
          color: textColor,
        ),
      ],
    );
  }
}

class AmmenitiesWidget extends StatelessWidget {
  const AmmenitiesWidget({
    super.key,
    required this.image,
    required this.imageHeight,
    required this.imageWidth,
    required this.text,
    this.onSeeAllTap,
    this.isSeeAll = false,
    required this.seeAllText,
  });
  final double imageHeight;
  final double imageWidth;
  final String image;
  final String text;
  final VoidCallback? onSeeAllTap;
  final bool? isSeeAll;
  final String seeAllText;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 25.w, right: 25.w),
      child: Row(
        children: [
          SvgPicture.asset(
            image,
            height: imageHeight,
            width: imageWidth,
           ),
          SizedBox(width: 5.w),
          workSansText(
              text: text,
              fontSize: 14.sp,
              fontWeight: FontWeight.normal,
              color: textColor.withOpacity(0.8)),
          isSeeAll == true ? const Spacer() : const SizedBox.shrink(),
          isSeeAll == true
              ? GestureDetector(
                  onTap: onSeeAllTap,
                  child: workSansText(
                      text: seeAllText,
                      fontSize: 14.sp,
                      fontWeight: FontWeight.normal,
                      color: secondaryColor),
                )
              : const SizedBox.shrink(),
        ],
      ),
    );
  }
}
