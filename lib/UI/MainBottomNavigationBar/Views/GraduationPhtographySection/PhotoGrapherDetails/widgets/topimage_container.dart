import 'package:findly/Constant/assets_constant.dart';
import 'package:findly/Constant/colors.dart';
import 'package:findly/Constant/text_constant.dart';
import 'package:findly/UI/MainBottomNavigationBar/Views/GraduationPhtographySection/PhotoGrapherPortFolio/photograper_portfolio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/route_manager.dart';

import '../../../../../Auth/Widgets/custom_auth_appbar.dart';

class PhotoGraphyTopImageContainer extends StatelessWidget {
  const PhotoGraphyTopImageContainer(
      {super.key,
      required this.imageHeight,
      required this.images,
      required this.onBookMarkTap,
      required this.isBookmarked});

  final double imageHeight;
  final List<String> images;
  final bool isBookmarked;
  final VoidCallback onBookMarkTap;

  @override
  Widget build(BuildContext context) {
    return imageHeight > 0
        ? Stack(
            children: [
              SizedBox(
                height: 255.h,
                width: 1.sw,
                child: images.first.startsWith('http')
                    ? Image.network(
                        images.first,
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) {
                          // Handle the error if the image cannot be loaded
                          return const Center(child: Icon(Icons.error));
                        },
                      )
                    : Image.asset(
                        images.first,
                        fit: BoxFit.cover,
                      ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 55.h, left: 25.w, right: 28.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: const Icon(Icons.arrow_back_outlined,
                          color: Colors.white),
                    ),
                    GestureDetector(
                      onTap: onBookMarkTap,
                      child: isBookmarked
                          ? Icon(Icons.favorite, color: redColor, size: 22.sp)
                          : Image.asset(
                              whiteheart,
                              width: 22.5.w,
                              height: 18.6.h,
                            ),
                    )
                  ],
                ),
              ),
              Align(
                alignment: Alignment.topCenter,
                child: Padding(
                  padding: EdgeInsets.only(left: 310.w, top: 120.h),
                  child: CircleContainer(
                    height: 27.h,
                    width: 27.w,
                    color: Colors.white.withOpacity(0.4),
                    child: Icon(
                      Icons.arrow_forward_ios_outlined,
                      color: Colors.white,
                      size: 15.sp,
                    ),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  Get.to(() => PhotographerPortfolio(porfolioImages: images));
                },
                child: Container(
                  padding:
                      EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
                  margin: EdgeInsets.only(top: 150.h),
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      colors: [
                        Color(0xFFD111EF),
                        Color(0xFF4613C8)
                      ], // Gradient colors
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                    ),
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(10.r),
                      bottomRight: Radius.circular(10.r),
                    ),
                  ),
                  child: workSansText(
                      text: "View Portfolio",
                      color: whiteColor,
                      fontSize: 17.9.sp,
                      fontWeight: FontWeight.w500),
                ),
              ),
            ],
          )
        : const CircularProgressIndicator();
  }
}
