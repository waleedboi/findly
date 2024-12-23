import 'package:findly/Constant/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

Text workSansText(
    {required String text,
    Color? color,
    double? fontSize,
    FontWeight? fontWeight,
    TextAlign? textAlign,
    TextDecoration? textDecoration,
    TextOverflow? overflow,
    double? height,
    int? maxLines}) {
  return Text(
    text,
    maxLines: maxLines,
    textAlign: textAlign ?? TextAlign.start,
    overflow: overflow ?? TextOverflow.ellipsis,
    style: GoogleFonts.workSans(
      height: height,
      color: color ?? whiteColor,
      fontSize: fontSize ?? 14.sp,
      fontWeight: fontWeight ?? FontWeight.normal,
      decoration: textDecoration ?? TextDecoration.none,
    ),
  );
}

Text workSans16Text(
    {required String text,
    Color? color,
    double? fontSize,
    FontWeight? fontWeight,
    TextAlign? textAlign,
    TextDecoration? textDecoration,
    TextOverflow? overflow,
    double? height,
    int? maxLines}) {
  return Text(
    text,
    maxLines: maxLines,
    textAlign: textAlign ?? TextAlign.start,
    overflow: overflow ?? TextOverflow.ellipsis,
    style: GoogleFonts.workSans(
      height: height,
      color: color ?? textColor,
      fontSize: fontSize ?? 16.sp,
      fontWeight: fontWeight ?? FontWeight.w500,
      decoration: textDecoration ?? TextDecoration.none,
    ),
  );
}

Text workSansText2(
    {required String text,
    Color? color,
    double? fontSize,
    FontWeight? fontWeight,
    TextAlign? textAlign,
    TextDecoration? textDecoration,
    double? height,
    int? maxLines}) {
  return Text(
    text,
    maxLines: maxLines,
    textAlign: textAlign ?? TextAlign.start,
    overflow: TextOverflow.ellipsis,
    style: GoogleFonts.workSans(
      height: height,
      color: color ?? blackColor,
      fontSize: fontSize ?? 14.sp,
      fontWeight: fontWeight ?? FontWeight.normal,
      decoration: textDecoration ?? TextDecoration.none,
    ),
  );
}

TextStyle workSansTextStyle({
  Color? color,
  double? fontSize,
  FontWeight? fontWeight,
}) {
  return GoogleFonts.workSans(
    color: color ?? blackColor,
    fontSize: fontSize ?? 14.sp,
    fontWeight: fontWeight ?? FontWeight.normal,
  );
}
