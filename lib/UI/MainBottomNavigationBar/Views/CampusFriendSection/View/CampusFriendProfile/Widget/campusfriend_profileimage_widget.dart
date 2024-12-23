import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../../Constant/assets_constant.dart';
import '../../../../../../../Constant/colors.dart';
import '../../../../../../Auth/Widgets/custom_auth_appbar.dart';

class CampusfriendProfileImageWidget extends StatelessWidget {
  const CampusfriendProfileImageWidget({
    super.key,
    required this.onBookMarkTap,
    required this.onNextTap,
    required this.image,
    required this.onPreviousTap,
  });

  final VoidCallback onBookMarkTap;
  final VoidCallback onNextTap;
  final String image;
  final VoidCallback onPreviousTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 392.h,
      width: 1.sw,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(image),
          fit: BoxFit.cover,
        ),
      ),
      child: Padding(
        padding:
            EdgeInsets.only(top: 62.h) + EdgeInsets.symmetric(horizontal: 25.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: const Icon(Icons.arrow_back, color: whiteColor)),
                GestureDetector(
                  onTap: onBookMarkTap,
                  child: Image.asset(
                    save,
                    height: 18.44.h,
                    width: 14.16.w,
                    color: whiteColor,
                  ),
                ),
              ],
            ),
            SizedBox(height: 94.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: onPreviousTap,
                  child: CircleContainer(
                    height: 32.78.h,
                    width: 32.78.w,
                    padding: EdgeInsets.only(left: 4.w),
                    color: const Color(0xFFFFFFFF).withOpacity(0.3),
                    child: Center(
                        child: Icon(
                      Icons.arrow_back_ios,
                      color: blackColor,
                      size: 18.sp,
                    )),
                  ),
                ),
                GestureDetector(
                  onTap: onNextTap,
                  child: CircleContainer(
                    height: 32.78.h,
                    width: 32.78.w,
                    color: const Color(0xFFFFFFFF).withOpacity(0.1),
                    child: Center(
                        child: Icon(
                      Icons.arrow_forward_ios,
                      color: blackColor,
                      size: 18.sp,
                    )),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
