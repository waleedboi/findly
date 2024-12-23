import 'package:findly/Constant/text_constant.dart';
import 'package:findly/UI/MainBottomNavigationBar/Views/Gallery/gallery.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../../../Constant/colors.dart';

class ItemdetailImagecontainer extends StatelessWidget {
  const ItemdetailImagecontainer({
    super.key,
    required this.imageHeight,
    required this.image,
    this.showViewGalleryButton = true,
  });

  final double imageHeight;
  final String image;
  final bool showViewGalleryButton;

  @override
  Widget build(BuildContext context) {
    return imageHeight > 0
        ? Stack(
            children: [
              SizedBox(
                height: 255.h,
                width: 1.sw,
                child: Image.network(
                  image,
                  fit: BoxFit.cover,
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Padding(
                  padding: EdgeInsets.only(top: 55.h, left: 25.0),
                  child: const Icon(Icons.arrow_back_outlined,
                      color: Colors.white),
                ),
              ),
              if (showViewGalleryButton)
                GestureDetector(
                  onTap: () {
                    Get.to(() => const Gallery(
                          images: [],
                        ));
                  },
                  child: Container(
                    margin: EdgeInsets.only(top: 155.h),
                    padding:
                        EdgeInsets.symmetric(vertical: 6.h, horizontal: 10.w),
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
            ],
          )
        : const CircularProgressIndicator();
  }
}
