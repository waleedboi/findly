import 'package:findly/Constant/text_constant.dart';
import 'package:findly/UI/MainBottomNavigationBar/Views/Gallery/gallery.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/route_manager.dart';

import '../../../../../../../Constant/colors.dart';
import '../../../../../../../Models/AccommodationModels/accommodation_model.dart';

class ImageContainerWidget extends StatelessWidget {
  const ImageContainerWidget({
    super.key,
    required this.accommodationModel,
    required this.onBookMarkTap,
    required this.onNextTap,
    required this.isBookMarked,
  });

  final AccommodationModel accommodationModel;
  final VoidCallback onBookMarkTap;
  final VoidCallback onNextTap;
  final bool isBookMarked;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 255.h,
      width: 1.sw,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: NetworkImage(accommodationModel.images!.first),
          fit: BoxFit.cover,
        ),
      ),
      child: Padding(
        padding: EdgeInsets.only(top: 62.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 25.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: const Icon(Icons.arrow_back, color: whiteColor)),
                  GestureDetector(
                    onTap: onBookMarkTap,
                    child: Icon(
                      isBookMarked == false
                          ? Icons.favorite_border_outlined
                          : Icons.favorite,
                      size: 25.sp,
                      color: isBookMarked == false ? whiteColor : redColor,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 58.h),
            // Align(
            //   alignment: Alignment.centerRight,
            //   child: GestureDetector(
            //     onTap: onNextTap,
            //     child: CircleContainer(
            //       height: 27.h,
            //       width: 27.w,
            //       color: const Color(0xFFFFFFFF).withOpacity(0.3),
            //       child: Center(
            //           child: Icon(
            //         Icons.arrow_forward_ios,
            //         color: whiteColor,
            //         size: 15.sp,
            //       )),
            //     ),
            //   ),
            // ),
            GestureDetector(
              onTap: () {
                Get.to(() =>   Gallery(images: accommodationModel.images));
              },
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 6.h, horizontal: 10.w),
                decoration: BoxDecoration(
                  color: whiteColor.withOpacity(0.2),
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(10.r),
                    bottomRight: Radius.circular(10.r),
                  ),
                ),
                child: workSansText(
                    text: "View Gallery",
                    color: whiteColor,
                    fontSize: 17.9.sp,
                    fontWeight: FontWeight.w500),
              ),
            ),
            SizedBox(height: 10.h),
            Container(
              height: 5.9.h,
              width: 109.w,
              margin: EdgeInsets.symmetric(horizontal: 25.w),
              color: accommodationModel.status == "true"
                  ? const Color(0xFF12B347)
                  : secondaryColor,
            ),
          ],
        ),
      ),
    );
  }
}
