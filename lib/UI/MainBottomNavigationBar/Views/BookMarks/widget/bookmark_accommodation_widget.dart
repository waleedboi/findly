import 'package:findly/Constant/assets_constant.dart';
import 'package:findly/Core/Custom/app_button.dart';
import 'package:findly/Models/AccommodationModels/accommodation_model.dart';
import 'package:findly/Models/bookmark_model.dart';
import 'package:findly/UI/MainBottomNavigationBar/Views/AccommoadtionSection/View/OpenAccomodationListing/open_accommodation_listing_screen.dart';
import 'package:findly/UI/MainBottomNavigationBar/Views/AccommoadtionSection/widgets/accommodation_listview.dart';
import 'package:findly/UI/MainBottomNavigationBar/Views/BookMarks/bookmark_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../../Constant/colors.dart';
import '../../../../../Constant/text_constant.dart';

class BookmarkAccommodationWidget extends StatelessWidget {
  const BookmarkAccommodationWidget({
    super.key,
    required this.index,
    required this.model,
    required this.data,
  });
  final int index;
  final BookmarkViewmodel model;
  final BookMarkModel data;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.to(() => OpenAccommodationListingScreen(
              isBookmarked: true,
              accommodationModel: bookMarkList[0],
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
                  child: workSansText(
                    text: "GP Accommodation",
                    fontWeight: FontWeight.w600,
                    fontSize: 14.sp,
                    color: textColor,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 12.w, top: 2.h),
                  child: Row(
                    children: [
                      Image.asset(locationIcon, height: 14.h, width: 13.w),
                      SizedBox(width: 4.w),
                      SizedBox(
                        width: 155.w,
                        child: workSansText(
                          text: "Brixton, Johannesburg",
                          fontWeight: FontWeight.w500,
                          fontSize: 12.sp,
                          color: blackColor,
                        ),
                      ),
                      // const Spacer(),
                    ],
                  ),
                ),
                SizedBox(
                  width: 216.w,
                  child: Padding(
                    padding: EdgeInsets.only(top: 2.h, left: 16.w),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            RichText(
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
                                ),
                                TextSpan(
                                  text: " pm",
                                  style: workSansTextStyle(
                                      color: textColor,
                                      fontSize: 12.sp,
                                      fontWeight: FontWeight.w400),
                                )
                              ],
                            )),
                            SizedBox(height: 5.h),
                            Row(
                              children: [
                                data.status == "Available"
                                    ? AvailabeIcon(
                                        height: 17.h,
                                        width: 17.w,
                                        iconSize: 14.sp,
                                      )
                                    : UnAvailableIcon(
                                        height: 17.h,
                                        width: 17.w,
                                        iconSize: 14.sp,
                                      ),
                                SizedBox(width: 4.w),
                                data.status == "Available"
                                    ? workSansText(
                                        text: "Available",
                                        color: const Color(0xFF12B347),
                                        fontWeight: FontWeight.w500,
                                        fontSize: 12.sp)
                                    : workSansText(
                                        text: "Unavailable",
                                        color: secondaryColor,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 12.sp),
                              ],
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
                        )
                      ],
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
