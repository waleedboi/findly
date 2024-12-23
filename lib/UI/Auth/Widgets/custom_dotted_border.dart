import 'dart:io';

import 'package:dotted_border/dotted_border.dart';
import 'package:findly/UI/Auth/Widgets/custom_auth_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../Constant/colors.dart';
import '../../../Constant/text_constant.dart';

class CustomDottedBorder extends StatelessWidget {
  const CustomDottedBorder({
    super.key,
    required this.containercolor,
    required this.buttonColor,
    required this.text,
    this.height,
    this.width,
    required this.textColor,
    required this.borderColor,
    this.onTap,
    this.imagePath,
  });
  final Color containercolor;
  final Color buttonColor;
  final String text;
  final double? height;
  final double? width;
  final Color textColor;
  final Color borderColor;
  final VoidCallback? onTap;
  final String? imagePath;

  @override
  Widget build(BuildContext context) {
    return DottedBorder(
      borderType: BorderType.RRect,
      padding: EdgeInsets.zero,
      dashPattern: const [8, 4],
      strokeWidth: 1,
      radius: Radius.circular(20.r),
      color: borderColor,
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          height: height ?? 158.h,
          width: width ?? 332.w,
          padding: EdgeInsets.symmetric(
              horizontal: imagePath != null ? 1.w : 0,
              vertical: imagePath != null ? 1.h : 0),
          decoration: BoxDecoration(
            color: containercolor,
            borderRadius: BorderRadius.circular(20.r),
          ),
          child: imagePath != null
              ? ClipRRect(
                  borderRadius: BorderRadius.circular(20.r),
                  child: Image.file(
                    File(imagePath!),
                    fit: BoxFit.cover,
                    height: height ?? 158.h,
                    width: width ?? 332.w,
                  ),
                )
              : Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: 57.h,
                      width: 57.w,
                      decoration: BoxDecoration(
                        color: buttonColor,
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        Icons.add,
                        color: whiteColor,
                        size: 25.sp,
                      ),
                    ),
                    SizedBox(height: 16.h),
                    workSansText(
                        text: text,
                        color: textColor,
                        fontWeight: FontWeight.w500)
                  ],
                ),
        ),
      ),
    );
  }
}

class CustomDottedBorder2 extends StatelessWidget {
  const CustomDottedBorder2({
    super.key,
    required this.containercolor,
    required this.buttonColor,
    required this.text,
    this.height,
    this.width,
    required this.textColor,
    required this.borderColor,
    this.onTap,
    this.imagePath,
    this.onRemove,
    this.onEdit,
  });
  final Color containercolor;
  final Color buttonColor;
  final String text;
  final double? height;
  final double? width;
  final Color textColor;
  final Color borderColor;
  final VoidCallback? onTap;
  final String? imagePath;
  final VoidCallback? onRemove;
  final VoidCallback? onEdit;

  @override
  Widget build(BuildContext context) {
    return DottedBorder(
      borderType: BorderType.RRect,
      padding: EdgeInsets.zero,
      dashPattern: const [8, 4],
      strokeWidth: 1.5,
      radius: Radius.circular(20.r),
      color: borderColor,
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          height: height ?? 158.h,
          width: width ?? 332.w,
          padding: EdgeInsets.symmetric(
              horizontal: imagePath != null ? 1.w : 0,
              vertical: imagePath != null ? 1.h : 0),
          decoration: BoxDecoration(
            color: containercolor,
            borderRadius: BorderRadius.circular(20.r),
          ),
          child: imagePath != null
              ? Stack(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(20.r),
                      child: Image.file(
                        File(imagePath!),
                        fit: BoxFit.cover,
                        height: height ?? 158.h,
                        width: width ?? 332.w,
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsets.only(top: 10.h, left: 10.w, right: 10.w),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          GestureDetector(
                            onTap: onRemove,
                            child: CircleContainer(
                              height: 20.h,
                              width: 20.w,
                              color: blackColor.withOpacity(0.5),
                              child: Icon(
                                Icons.close,
                                color: whiteColor,
                                size: 15.sp,
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: onEdit,
                            child: CircleContainer(
                              height: 20.h,
                              width: 20.w,
                              color: blackColor.withOpacity(0.5),
                              child: Icon(
                                Icons.edit,
                                color: whiteColor,
                                size: 12.sp,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                )
              : Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: 57.h,
                      width: 57.w,
                      decoration: BoxDecoration(
                        color: buttonColor,
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        Icons.add,
                        color: whiteColor,
                        size: 25.sp,
                      ),
                    ),
                    SizedBox(height: 16.h),
                    workSansText(
                        text: text,
                        color: textColor,
                        fontWeight: FontWeight.w500)
                  ],
                ),
        ),
      ),
    );
  }
}

class CustomDottedBorderWithNetworkImage extends StatelessWidget {
  const CustomDottedBorderWithNetworkImage({
    super.key,
    required this.containercolor,
    required this.buttonColor,
    required this.text,
    this.height,
    this.width,
    required this.textColor,
    required this.borderColor,
    this.onTap,
    this.imagePath,
    this.onRemove,
    this.onEdit,
  });
  final Color containercolor;
  final Color buttonColor;
  final String text;
  final double? height;
  final double? width;
  final Color textColor;
  final Color borderColor;
  final VoidCallback? onTap;
  final String? imagePath;
  final VoidCallback? onRemove;
  final VoidCallback? onEdit;

  @override
  Widget build(BuildContext context) {
    return DottedBorder(
      borderType: BorderType.RRect,
      padding: EdgeInsets.zero,
      dashPattern: const [8, 4],
      strokeWidth: 1.5,
      radius: Radius.circular(20.r),
      color: borderColor,
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          height: height ?? 158.h,
          width: width ?? 332.w,
          padding: EdgeInsets.symmetric(
              horizontal: imagePath != null ? 1.w : 0,
              vertical: imagePath != null ? 1.h : 0),
          decoration: BoxDecoration(
            color: containercolor,
            borderRadius: BorderRadius.circular(20.r),
          ),
          child: imagePath != null
              ? Stack(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(20.r),
                      child: Image.network(
                        imagePath!,
                        fit: BoxFit.cover,
                        height: height ?? 158.h,
                        width: width ?? 332.w,
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsets.only(top: 10.h, left: 10.w, right: 10.w),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          GestureDetector(
                            onTap: onRemove,
                            child: CircleContainer(
                              height: 20.h,
                              width: 20.w,
                              color: blackColor.withOpacity(0.5),
                              child: Icon(
                                Icons.close,
                                color: whiteColor,
                                size: 15.sp,
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: onEdit,
                            child: CircleContainer(
                              height: 20.h,
                              width: 20.w,
                              color: blackColor.withOpacity(0.5),
                              child: Icon(
                                Icons.edit,
                                color: whiteColor,
                                size: 12.sp,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                )
              : Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: 57.h,
                      width: 57.w,
                      decoration: BoxDecoration(
                        color: buttonColor,
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        Icons.add,
                        color: whiteColor,
                        size: 25.sp,
                      ),
                    ),
                    SizedBox(height: 16.h),
                    workSansText(
                        text: text,
                        color: textColor,
                        fontWeight: FontWeight.w500)
                  ],
                ),
        ),
      ),
    );
  }
}
