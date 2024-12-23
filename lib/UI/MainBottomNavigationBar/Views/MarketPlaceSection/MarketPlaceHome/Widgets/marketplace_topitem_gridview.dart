import 'package:cached_network_image/cached_network_image.dart';
import 'package:findly/Constant/colors.dart';
import 'package:findly/Models/marketplace_item_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../../Constant/text_constant.dart';

class MarketPlaceTopItemGridView extends StatelessWidget {
  const MarketPlaceTopItemGridView({
    super.key,
    required this.product,
    required this.onTap,
    required this.isBookmarked,
    required this.onBookMarkTap,
  });

  final ProductListingModel product;
  final VoidCallback onTap;
  final bool isBookmarked;
  final VoidCallback onBookMarkTap;

  @override
  Widget build(BuildContext context) {
    bool isValidImage = product.images != null && product.images!.isNotEmpty;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        constraints:
            BoxConstraints(maxHeight: 1000, maxWidth: 160.w, minHeight: 1000),
        // width: 160.w, // Fixed width for the card
        // height: 300.h, // Fixed height for the card
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(14.r),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.3),
              spreadRadius: 1,
              blurRadius: 6,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Image section
            ClipRRect(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(14.r),
                topRight: Radius.circular(14.r),
              ),
              child: CachedNetworkImage(
                imageUrl: isValidImage
                    ? product.images!.first
                    : 'assets/images/placeholder.png',
                height: 120,
                // Set to a suitable fixed height
                width: double.infinity,
                fit: BoxFit.cover,
                placeholder: (context, url) => Container(
                  height: 12.h,
                  color: Colors.grey[200],
                ),
                errorWidget: (context, url, error) => Icon(
                  Icons.error,
                  size: 25.sp,
                  color: Colors.red,
                ),
              ),
            ),
            SizedBox(height: 2.h),
            // Title
            Container(
              padding: const EdgeInsets.all(10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  workSansText(
                    text: product.title.toString(),
                    fontWeight: FontWeight.w600,
                    fontSize: 14.sp,
                    color: textColor,
                  ),
                  SizedBox(height: 2.h),
                  // Price
                  workSansText(
                    text: "R${product.price ?? 0}",
                    fontWeight: FontWeight.w600,
                    fontSize: 16.sp,
                    color: textColor,
                  ),
                  SizedBox(height: 5.h),

                  // Location
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(Icons.location_pin, color: Colors.black, size: 16.sp),
                      SizedBox(width: 2.w),
                      Expanded(
                        child: workSansText(
                          text: product.place ?? 'Unknown Location',
                          fontWeight: FontWeight.w400,
                          fontSize: 12.sp,
                          color: textColor,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
