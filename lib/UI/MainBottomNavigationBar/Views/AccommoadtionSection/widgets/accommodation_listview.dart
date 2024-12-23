import 'package:findly/Constant/assets_constant.dart';
import 'package:findly/UI/Auth/Widgets/custom_auth_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../../../../../Constant/colors.dart';
import '../../../../../Constant/text_constant.dart';
import '../../Home/home_screen_viewmodel.dart';

class AccomondationListview extends StatelessWidget {
  const AccomondationListview({
    super.key,
    required this.image,
    required this.location,
    required this.price,
    required this.rating,
    required this.status,
    this.onBookMarkTap,
    required this.isBookmarked,
  });

  final String image;
  final String location;
  final String price;
  final String rating;
  final String status;
  final VoidCallback? onBookMarkTap;
  final bool isBookmarked;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 16.w),
      child: Container(
        height: 185.h,
        width: 158.w,
        // padding: EdgeInsets.only(top: 0.h, left: 11.w, right: 11.w),
        decoration: BoxDecoration(
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(12.r),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Container(
                  height: 185.h,
                  width: 158.w,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(9.38.r),
                      border: const Border(
                        right: BorderSide(
                          color: Color(0xFFE9E9E9),
                        ),
                        left: BorderSide(
                          color: Color(0xFFE9E9E9),
                        ),
                        bottom: BorderSide(
                          color: Color(0xFFE9E9E9),
                        ),
                      )),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 5.h),
                      Padding(
                        padding: EdgeInsets.only(left: 6.w),
                        child: Row(
                          children: [
                            Image.asset(
                              locationIcon,
                              height: 12.91.h,
                              width: 10.94.w,
                              // color: secondaryColor,
                            ),
                            SizedBox(width: 4.w),
                            SizedBox(
                              width: 130.w,
                              child: workSansText(
                                text: location,
                                fontWeight: FontWeight.w600,
                                fontSize: 11.sp,
                                color: textColor,
                              ),
                            )
                          ],
                        ),
                      ),
                      SizedBox(height: 5.h),
                      Padding(
                        padding: EdgeInsets.only(left: 6.w),
                        child: Row(
                          children: [
                            Image.asset(
                              pricetag,
                              height: 12.91.h,
                              width: 10.94.w,
                              // color: secondaryColor,
                            ),
                            SizedBox(width: 4.w),
                            RichText(
                                text: TextSpan(
                              children: [
                                TextSpan(
                                  text: "From ",
                                  style: GoogleFonts.workSans(
                                    color: const Color(0xFF333333),
                                    fontSize: 8.sp,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                TextSpan(
                                  text: price,
                                  style: GoogleFonts.workSans(
                                    color: textColor,
                                    fontSize: 11.sp,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                TextSpan(
                                  text: " /month",
                                  style: GoogleFonts.workSans(
                                    color: const Color(0xFF333333),
                                    fontSize: 8.sp,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ],
                            )),
                          ],
                        ),
                      ),
                      SizedBox(height: 5.h),
                      Padding(
                        padding: EdgeInsets.only(left: 6.w),
                        child: Row(
                          children: [
                            status == "Available"
                                ? const AvailabeIcon()
                                : const UnAvailableIcon(),
                            SizedBox(width: 4.w),
                            workSansText(
                              text: status,
                              fontWeight: FontWeight.w500,
                              fontSize: 8.sp,
                              color: status == "Available"
                                  ? const Color(0XFF12B347)
                                  : secondaryColor,
                            ),
                            // const Spacer(),
                            // Icon(Icons.star, color: yelloColor, size: 12.sp),
                            // workSansText(
                            //   text: rating,
                            //   fontWeight: FontWeight.w500,
                            //   fontSize: 8.sp,
                            //   color: textColor,
                            // ),
                          ],
                        ),
                      ),
                      SizedBox(height: 8.w)
                    ],
                  ),
                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(9.38.r),
                  child: Stack(
                    alignment: Alignment.topRight,
                    children: [
                      Image.network(
                        image,
                        height: 114.h,
                        width: double.maxFinite,
                        fit: BoxFit.cover,
                        // width: 135.w,
                      ),
                      Consumer<HomeScreenViewmodel>(
                          builder: (context, model, child) {
                        return Padding(
                          padding: const EdgeInsets.all(6.0),
                          child: GestureDetector(
                              onTap: onBookMarkTap,
                              child: Icon(
                                isBookmarked == false
                                    ? Icons.favorite_border
                                    : Icons.favorite,
                                color: isBookmarked == false
                                    ? whiteColor
                                    : redColor,
                                size: 20.sp,
                              )),
                        );
                      }),
                    ],
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

class UnAvailableIcon extends StatelessWidget {
  const UnAvailableIcon({
    super.key,
    this.height,
    this.width,
    this.iconSize,
  });

  final double? height;
  final double? width;
  final double? iconSize;

  @override
  Widget build(BuildContext context) {
    return CircleContainer(
      height: height ?? 12.5.h,
      width: width ?? 12.5.w,
      color: secondaryColor,
      child: Icon(
        Icons.close,
        color: whiteColor,
        size: iconSize ?? 11.sp,
      ),
    );
  }
}

class AvailabeIcon extends StatelessWidget {
  const AvailabeIcon({
    super.key,
    this.height,
    this.width,
    this.iconSize,
  });

  final double? height;
  final double? width;
  final double? iconSize;

  @override
  Widget build(BuildContext context) {
    return CircleContainer(
      height: height ?? 12.5.h,
      width: width ?? 12.5.w,
      color: const Color(0XFF00D455),
      child: Icon(
        Icons.check,
        color: whiteColor,
        size: iconSize ?? 8.sp,
      ),
    );
  }
}
