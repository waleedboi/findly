import 'package:findly/Constant/assets_constant.dart';
import 'package:findly/Constant/colors.dart';
import 'package:findly/Constant/text_constant.dart';
import 'package:findly/Core/Custom/app_button.dart';
import 'package:findly/UI/MainBottomNavigationBar/Views/BookMarks/bookmark_viewmodel.dart';
import 'package:findly/UI/MainBottomNavigationBar/Views/MarketPlaceSection/MarketPlaceItemDetails/marketplace_itemdetails.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class BookmarkMarketplaceWidget extends StatelessWidget {
  const BookmarkMarketplaceWidget({
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
        Get.to(() => MarketplaceItemdetails(
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
            SizedBox(width: 4.h),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 12.w),
                  child: SizedBox(
                    width: 210.w,
                    child: workSansText(
                      text: "Dell Laptop",
                      fontWeight: FontWeight.w600,
                      fontSize: 14.sp,
                      color: textColor,
                    ),
                  ),
                ),
                SizedBox(height: 6.h),
                Padding(
                  padding: EdgeInsets.only(left: 10.w),
                  child: Row(
                    children: [
                      Image.asset(locationIcon, height: 14.h, width: 13.w),
                      SizedBox(width: 4.w),
                      SizedBox(
                        width: 155.w,
                        child: workSansText(
                          text: "Wits University",
                          fontWeight: FontWeight.w500,
                          fontSize: 12.sp,
                          color: textColor,
                        ),
                      ),
                      // const Spacer(),
                    ],
                  ),
                ),
                SizedBox(height: 3.h),
                SizedBox(
                  width: 216.w,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: 13.w),
                        child: Column(
                          children: [
                            workSansText(
                                text: "R5000",
                                fontWeight: FontWeight.w600,
                                fontSize: 16.sp,
                                color: textColor),
                            workSansText(
                                text: "",
                                fontWeight: FontWeight.w600,
                                fontSize: 12.sp,
                                color: textColor),
                          ],
                        ),
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
