import 'package:findly/Constant/assets_constant.dart';
import 'package:findly/Constant/colors.dart';
import 'package:findly/Constant/text_constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppButton extends StatelessWidget {
  const AppButton({
    super.key,
    this.height,
    this.width,
    this.text,
    required this.onTap,
    this.textColor,
    this.fontWeight,
    this.fontSize,
    this.buttonColor,
    this.borderRadius,
    this.linearGradient,
  });
  final Color? buttonColor;
  final double? height;
  final double? width;
  final String? text;
  final VoidCallback onTap;
  final Color? textColor;
  final FontWeight? fontWeight;
  final double? fontSize;
  final double? borderRadius;
  final Gradient? linearGradient;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: height ?? 56.h,
        width: width ?? 1.sw,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(borderRadius ?? 12.r),
          color: buttonColor ?? primaryColor,
          gradient:linearGradient,
        ),
        child: Center(
          child: workSansText(
            text: text ?? "Login",
            color: textColor ?? whiteColor,
            fontSize: fontSize ?? 16.sp,
            fontWeight: fontWeight ?? FontWeight.w600,
          ),
        ),
      ),
    );
  }
}

class HomeButton extends StatelessWidget {
  const HomeButton({
    super.key,
    this.height,
    this.width,
    this.text,
    required this.onTap,
    this.textColor,
    this.fontWeight,
    this.fontSize,
    this.buttonColor,
    this.borderRadius,
    required this.icon,
    this.iconHeight,
    this.iconWidth,
    this.space,
    this.mainAxisAlignment,
    this.startPadding,
    this.iconColor,
  });
  final Color? buttonColor;
  final double? height;
  final double? width;
  final String? text;
  final VoidCallback onTap;
  final Color? textColor;
  final FontWeight? fontWeight;
  final double? fontSize;
  final double? borderRadius;
  final String icon;
  final double? iconHeight;
  final double? iconWidth;
  final double? space;
  final double? startPadding;
  final MainAxisAlignment? mainAxisAlignment;
  final Color? iconColor;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
          height: height ?? 56.h,
          width: width ?? 1.sw,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(borderRadius ?? 12.r),
            color: buttonColor ?? primaryColor,
          ),
          child: Row(
            mainAxisAlignment: mainAxisAlignment ?? MainAxisAlignment.start,
            children: [
              SizedBox(width: startPadding ?? 15.w),
              Image.asset(
                icon,
                height: iconHeight ?? 24.h,
                width: iconWidth ?? 24.w,
                color: iconColor,
              ),
              SizedBox(width: space ?? 10.w),
              workSansText(
                text: text ?? "Login",
                color: textColor ?? whiteColor,
                fontSize: fontSize ?? 16.sp,
                fontWeight: fontWeight ?? FontWeight.w600,
              ),
            ],
          )),
    );
  }
}

class MapButton extends StatelessWidget {
  const MapButton({
    super.key,
    required this.onTap,
    this.height,
    this.width,
    this.radius,
    this.buttonColor,
    this.fontSize,
    this.fontWeight,
    this.iconHeight,
    this.iconWidth,
    this.icon,
    this.text,
    this.fontColor,
  });

  final VoidCallback onTap;
  final double? height;
  final double? width;
  final double? radius;
  final Color? buttonColor;
  final double? fontSize;
  final FontWeight? fontWeight;
  final double? iconHeight;
  final double? iconWidth;
  final String? icon;
  final String? text;
  final Color? fontColor;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
          height: height ?? 43.h,
          width: width ?? 93.w,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(radius ?? 100.r),
            color: buttonColor ?? secondaryColor,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              workSansText(
                text: text ?? "Map",
                color: fontColor ?? whiteColor,
                fontSize: fontSize ?? 16.sp,
                fontWeight: fontWeight ?? FontWeight.w500,
              ),
              SizedBox(width: 7.w),
              Image.asset(
                icon ?? maplocation,
                height: iconHeight ?? 18.h,
                width: iconWidth ?? 20.w,
              ),
            ],
          )),
    );
  }
}
