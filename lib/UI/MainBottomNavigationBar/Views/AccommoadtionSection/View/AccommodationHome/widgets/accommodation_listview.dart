import 'package:cached_network_image/cached_network_image.dart'; // Import the package
import 'package:findly/Constant/assets_constant.dart';
import 'package:findly/UI/MainBottomNavigationBar/Views/AccommoadtionSection/widgets/accommodation_listview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../../Constant/colors.dart';
import '../../../../../../../Constant/text_constant.dart';

class AccommodationListing extends StatelessWidget {
  const AccommodationListing({
    super.key,
    required this.image,
    required this.location,
    required this.price,
    required this.rating,
    required this.status,
    required this.isMale,
    required this.isFemale,
    required this.isUnix,
    required this.onTap,
    required this.isBookmarked,
    required this.onBookMarkTap,
    this.isRated = false,
  });

  final String image;
  final String location;
  final String price;
  final String rating;
  final String status;
  final bool isMale;
  final bool isFemale;
  final bool isUnix;
  final VoidCallback onTap;
  final bool isBookmarked;
  final bool isRated;
  final VoidCallback onBookMarkTap;

  @override
  Widget build(BuildContext context) {
    bool isValidImage = image.isNotEmpty;
    bool isAvailable = status.toLowerCase() == "available";

    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 330.h,
        decoration: BoxDecoration(
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(14.r),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Container(
                  height: 330.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(9.38.r),
                    border: const Border(
                      right: BorderSide(color: Color(0xFFE9E9E9)),
                      left: BorderSide(color: Color(0xFFE9E9E9)),
                      bottom: BorderSide(color: Color(0xFFE9E9E9)),
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: 12.w, right: 14.w),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Image.asset(
                              locationIcon,
                              height: 17.81.h,
                              width: 15.11.w,
                              color: const Color(0xFFFF6600),
                            ),
                            SizedBox(width: 4.w),
                            workSansText(
                              text: location,
                              fontWeight: FontWeight.w600,
                              fontSize: 15.sp,
                              color: textColor,
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 5.h),
                      Padding(
                        padding: EdgeInsets.only(left: 12.w),
                        child: Row(
                          children: [
                            Image.asset(
                              pricetag,
                              height: 17.81.h,
                              width: 15.11.w,
                            ),
                            SizedBox(width: 4.w),
                            workSansText(
                              text: "From ",
                              fontWeight: FontWeight.w500,
                              fontSize: 14.sp,
                              color: textColor,
                            ),
                            workSansText(
                              text: "R$price",
                              fontWeight: FontWeight.w600,
                              fontSize: 18.sp,
                              color: textColor,
                            ),
                            workSansText(
                              text: " /month",
                              fontWeight: FontWeight.w500,
                              fontSize: 14.sp,
                              color: textColor,
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 5.h),
                      Padding(
                        padding: EdgeInsets.only(left: 12.w, right: 14.w),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                isAvailable
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
                                SizedBox(width: 3.w),
                                workSansText(
                                  text:
                                      isAvailable ? "Available" : "Unavailable",
                                  fontWeight: FontWeight.w500,
                                  fontSize: 14.sp,
                                  color: isAvailable
                                      ? const Color(0xFF12B347)
                                      : secondaryColor,
                                ),
                              ],
                            ),
                            Container(
                              padding: EdgeInsets.all(8.sp),
                              decoration: BoxDecoration(
                                color: isMale
                                    ? const Color(0xFF0055D4).withOpacity(0.08)
                                    : isFemale
                                        ? secondaryColor.withOpacity(0.08)
                                        : primaryColor.withOpacity(0.08),
                                borderRadius: BorderRadius.circular(4.r),
                              ),
                              child: Center(
                                child: workSansText(
                                  text: isMale
                                      ? "Male only"
                                      : isFemale
                                          ? "Female only"
                                          : "Unisex",
                                  fontWeight: FontWeight.w500,
                                  fontSize: 12.sp,
                                  color: isMale
                                      ? const Color(0xFF0055D4)
                                      : isFemale
                                          ? secondaryColor
                                          : primaryColor,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 15.h),
                    ],
                  ),
                ),
                Container(
                  height: 200.h,
                  width: 1.sw,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(14.r),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(14.r),
                    child: CachedNetworkImage(
                      imageUrl:
                          isValidImage ? image : 'assets/images/friend.png',
                      fit: BoxFit.cover,
                      placeholder: (context, url) => Container(
                        height: 200.h,
                        color: Colors.grey[200], // Placeholder color
                      ),
                      errorWidget: (context, url, error) => Icon(
                        Icons.error,
                        size: 25.sp,
                        color: Colors.red,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: 12.h,
                  right: 21.w,
                  child: GestureDetector(
                    onTap: onBookMarkTap,
                    child: Icon(
                      isBookmarked == false
                          ? Icons.favorite_border_outlined
                          : Icons.favorite,
                      size: 25.sp,
                      color: isBookmarked == false ? whiteColor : redColor,
                    ),
                  ),
                ),
                Positioned(
                  bottom: 10.h,
                  left: 13.w,
                  child: Container(
                    height: 5.9.h,
                    width: 109.w,
                    color:
                        isAvailable ? const Color(0xFF12B347) : secondaryColor,
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
