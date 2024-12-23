import 'package:findly/Constant/colors.dart';
import 'package:findly/Constant/text_constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

void kGetSnakBar({
  required String text,
  Color? colorText,
  SnackPosition? snackPosition,
  int? duration,
  String? title,
  Color? backgroundColor,
}) {
  Get.snackbar(title ?? "", text,
      borderRadius: 8.r,
      colorText: colorText ?? whiteColor,
      messageText: workSansText(
          text: text,
          color: colorText ?? whiteColor,
          fontSize: 14.sp,
          fontWeight: FontWeight.w400),
      backgroundColor: backgroundColor ?? primaryColor,
      snackPosition: snackPosition ?? SnackPosition.TOP,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      duration: Duration(seconds: duration ?? 3));
}
