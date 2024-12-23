import 'package:findly/Constant/assets_constant.dart';
import 'package:findly/Constant/colors.dart';
import 'package:findly/Constant/text_constant.dart';
import 'package:findly/Core/Custom/app_button.dart';
import 'package:findly/UI/MainBottomNavigationBar/Views/BookMarks/bookmark_viewmodel.dart';
import 'package:findly/UI/MainBottomNavigationBar/Views/GraduationPhtographySection/PhotoGrapherDetails/photographer_details.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class BookmarkPhotographyWidget extends StatelessWidget {
  const BookmarkPhotographyWidget({
    super.key,
    required this.index,
    required this.model,
  });
  final int index;
  final BookmarkViewmodel model;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.to(() => const PhotographerDetails(
              isBookMarked: true,
              index: 0,
            ));
      },
      child: Container(
        height: 115.h,
        decoration: BoxDecoration(
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(12.r),
          border: Border.all(
            color: const Color(0xFFC6C5C5),
          ),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              // height: 110.h,
              width: 90.w,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(14.r),
                  bottomLeft: Radius.circular(14.r),
                ),
                image: DecorationImage(
                  image: AssetImage(image5),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 12.w),
                  child: SizedBox(
                    width: 200.w,
                    child: workSansText(
                      text: "TDE Photography",
                      fontWeight: FontWeight.w600,
                      fontSize: 14.sp,
                      color: textColor,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 12.w, top: 5.h),
                  child: Row(
                    children: [
                      Image.asset(locationIcon, height: 14.h, width: 13.w),
                      SizedBox(width: 4.w),
                      SizedBox(
                        width: 155.w,
                        child: workSansText(
                          text: "Johannesburg",
                          fontWeight: FontWeight.w500,
                          fontSize: 12.sp,
                          color: blackColor,
                        ),
                      ),
                      // const Spacer(),
                    ],
                  ),
                ),
                SizedBox(height: 5.h),
                SizedBox(
                  width: 216.w,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(left: 10.w),
                            child: Row(
                              children: [
                                Image.asset(star2, height: 13.h, width: 15.w),
                                SizedBox(width: 3.w),
                                RichText(
                                    text: TextSpan(
                                  text: "4.5",
                                  style: workSansTextStyle(
                                      color: textColor,
                                      fontSize: 12.sp,
                                      fontWeight: FontWeight.w500),
                                  children: [
                                    TextSpan(
                                      text: " (67)",
                                      style: workSansTextStyle(
                                          color: textColor,
                                          fontSize: 11.sp,
                                          fontWeight: FontWeight.w300),
                                    )
                                  ],
                                ))
                                // const Spacer(),
                              ],
                            ),
                          ),
                          SizedBox(height: 5.h),
                          Padding(
                            padding: EdgeInsets.only(left: 14.w),
                            child: RichText(
                                text: TextSpan(
                              text: "From ",
                              style: workSansTextStyle(
                                  color: textColor,
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.w400),
                              children: [
                                TextSpan(
                                  text: "R500",
                                  style: workSansTextStyle(
                                      color: textColor,
                                      fontSize: 16.sp,
                                      fontWeight: FontWeight.w600),
                                )
                              ],
                            )),
                          ),
                        ],
                      ),
                      AppButton(
                        width: 68.w,
                        height: 32.h,
                        onTap: () {
                          model.removeItem(index);
                        },
                        text: "Remove",
                        buttonColor: secondaryColor,
                        textColor: whiteColor,
                        fontSize: 10.sp,
                        borderRadius: 6.34,
                      ),
                    ],
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
