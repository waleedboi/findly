import 'package:findly/Constant/assets_constant.dart';
import 'package:findly/Constant/text_constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../Constant/colors.dart';
import '../../UI/Auth/auth_provider.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    required this.hintText,
    required this.controller,
    // this.height,
    // this.width,
    this.padding,
    this.hintColor,
    this.hintWeight,
    this.radius,
    this.prefixicon,
    this.validator,
  });

  final String hintText;
  final TextEditingController controller;
  // final double? height;
  // final double? width;
  final double? padding;
  final Color? hintColor;
  final FontWeight? hintWeight;
  final double? radius;
  final String? prefixicon;
  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: validator,
      controller: controller,
      // textAlign: TextAlign.center,s
      // maxLines: 10 ,
      style: workSansTextStyle(
        color: hintColor ?? textFieldHintColor,
        fontSize: 14.sp,
        fontWeight: hintWeight ?? FontWeight.w500,
      ),
      decoration: InputDecoration(
        prefixIcon: Padding(
          padding: EdgeInsets.all(15.sp),
          child: Image.asset(
            prefixicon ?? person,
            height: 15.h,
            width: 15.w,
          ),
        ),
        hintText: hintText,
        // suffixIcon: const SizedBox(),
        fillColor: whiteColor,
        filled: true,
        // contentPadding: EdgeInsets.symmetric(vertical: 0.h, horizontal: 16.w),
        // isDense: true,

        hintStyle: workSansTextStyle(
          color: hintColor ?? textFieldHintColor,
          fontSize: 14.sp,
          fontWeight: hintWeight ?? FontWeight.w500,
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: primaryColor,
          ),
          borderRadius: BorderRadius.circular(radius ?? 10.r),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: primaryColor,
          ),
          borderRadius: BorderRadius.circular(radius ?? 10.r),
        ),
      ),
    );
  }
}

class CustomTextField2 extends StatelessWidget {
  const CustomTextField2({
    super.key,
    required this.hintText,
    required this.controller,
    this.height,
    this.width,
    this.padding,
    this.hintColor,
    this.hintWeight,
    this.radius,
    this.prefixicon,
    this.isShowSuffixIcon,
    this.suffixIcon,
    this.suffixIconColor,
    this.isObscureText,
    this.onSuffixIconTap,
    this.maxLines,
    this.suffixSize,
    this.validator,
    this.keyboardType,
  });

  final String hintText;
  final TextEditingController controller;
  final double? height;
  final double? width;
  final double? padding;
  final Color? hintColor;
  final FontWeight? hintWeight;
  final double? radius;
  final String? prefixicon;
  final bool? isShowSuffixIcon;
  final IconData? suffixIcon;
  final Color? suffixIconColor;
  final bool? isObscureText;
  final VoidCallback? onSuffixIconTap;
  final int? maxLines;
  final double? suffixSize;
  final String? Function(String?)? validator;
  final TextInputType? keyboardType;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: validator,
      keyboardType: keyboardType,
      // textAlign: TextAlign.center,s
      maxLines: maxLines ?? 1,
      obscureText: isObscureText ?? false,
      style: workSansTextStyle(
        color: hintColor ?? textFieldHintColor,
        fontSize: 14.sp,
        fontWeight: hintWeight ?? FontWeight.w500,
      ),
      decoration: InputDecoration(
        suffixIcon: isShowSuffixIcon ?? false
            ? Padding(
                padding: EdgeInsets.all(15.sp),
                child: GestureDetector(
                    onTap: onSuffixIconTap ?? () {},
                    child: Icon(
                      suffixIcon ?? Icons.keyboard_arrow_down_rounded,
                      color: suffixIconColor ?? const Color(0xFF828284),
                      size: suffixSize,
                    )),
              )
            : null,
        hintText: hintText,
        // suffixIcon: const SizedBox(),
        fillColor: whiteColor,
        filled: true,
        // contentPadding: EdgeInsets.symmetric(vertical: 0.h, horizontal: 16.w),
        // isDense: true,

        hintStyle: workSansTextStyle(
          color: hintColor ?? blackColor.withOpacity(0.2),
          fontSize: 14.sp,
          fontWeight: hintWeight ?? FontWeight.w400,
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Color(0xFFE6E6E6),
          ),
          borderRadius: BorderRadius.circular(radius ?? 10.r),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Color(0xFFE6E6E6),
          ),
          borderRadius: BorderRadius.circular(radius ?? 10.r),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Color(0xFFE6E6E6),
          ),
          borderRadius: BorderRadius.circular(radius ?? 10.r),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Color(0xFFE6E6E6),
          ),
          borderRadius: BorderRadius.circular(radius ?? 10.r),
        ),
      ),
    );
  }
}

class SearchTextField extends StatelessWidget {
  const SearchTextField({
    super.key,
    required this.hintText,
    required this.controller,
    this.height,
    this.width,
    this.padding,
    this.hintColor,
    this.hintWeight,
    this.radius,
    this.prefixicon,
    this.isShowSuffixIcon,
    this.suffixIcon,
    this.isShowPrefixIcon,
    this.hintSize,
    this.suffixIconColor,
    this.onChanged,
    this.onprefixIconTap,
    this.onSuffixIconTap,
    this.prefixIconColor,
    this.prefixiconPadding,
    this.suffixiconPadding,
  });

  final String hintText;
  final double? hintSize;
  final TextEditingController controller;
  final double? height;
  final double? width;
  final double? padding;
  final Color? hintColor;
  final FontWeight? hintWeight;
  final double? radius;
  // final String? prefixicon;
  final bool? isShowSuffixIcon;
  final IconData? suffixIcon;
  final bool? isShowPrefixIcon;
  final IconData? prefixicon;
  final Color? suffixIconColor;
  final void Function(String)? onChanged;
  final VoidCallback? onprefixIconTap;
  final VoidCallback? onSuffixIconTap;
  final Color? prefixIconColor;
  final EdgeInsets? prefixiconPadding;
  final EdgeInsets? suffixiconPadding;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      onChanged: onChanged,
      // textAlign: TextAlign.center,s
      // maxLines: 10 ,
      style: workSansTextStyle(
        color: hintColor ?? textFieldHintColor,
        fontSize: 14.sp,
        fontWeight: hintWeight ?? FontWeight.w500,
      ),
      decoration: InputDecoration(
        prefixIcon: isShowPrefixIcon ?? false
            ? GestureDetector(
                onTap: onprefixIconTap,
                child: Padding(
                  padding: prefixiconPadding ?? EdgeInsets.all(8.sp),
                  child: Icon(
                    prefixicon ?? Icons.keyboard_arrow_down_rounded,
                    color: prefixIconColor,
                  ),
                ),
              )
            : null,
        suffixIcon: isShowSuffixIcon ?? false
            ? GestureDetector(
                onTap: onSuffixIconTap,
                child: Padding(
                  padding: suffixiconPadding ?? EdgeInsets.all(15.sp),
                  child: Icon(suffixIcon ?? Icons.keyboard_arrow_down_rounded,
                      color: suffixIconColor),
                ),
              )
            : null,
        hintText: hintText,
        // suffixIcon: const SizedBox(),
        fillColor: whiteColor,
        filled: true,
        // contentPadding: EdgeInsets.symmetric(vertical: 0.h, horizontal: 16.w),
        // isDense: true,

        hintStyle: workSansTextStyle(
          color: hintColor ?? blackColor.withOpacity(0.2),
          fontSize: hintSize ?? 14.sp,
          fontWeight: hintWeight ?? FontWeight.w400,
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(radius ?? 10.r),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(radius ?? 10.r),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(radius ?? 10.r),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(radius ?? 10.r),
        ),
      ),
    );
  }
}

class PasswordField extends StatelessWidget {
  const PasswordField({
    super.key,
    required this.hintText,
    required this.controller,
    this.height,
    this.width,
    this.padding,
    this.hintColor,
    this.hintWeight,
    this.radius,
    this.validator,
  });

  final String hintText;
  final TextEditingController controller;
  final double? height;
  final double? width;
  final double? padding;
  final Color? hintColor;
  final FontWeight? hintWeight;
  final double? radius;
  final String? Function(String?)? validator;
  @override
  Widget build(BuildContext context) {
    return Consumer<AuthProvider>(builder: (context, model, child) {
      return TextFormField(
        validator: validator,
        controller: controller,
        obscureText: !model.isPasswordVisible,
        style: workSansTextStyle(
          color: hintColor ?? textFieldHintColor,
          fontSize: 14.sp,
          fontWeight: hintWeight ?? FontWeight.w500,
        ),
        decoration: InputDecoration(
          errorMaxLines: 2,
          hintText: hintText,
          fillColor: whiteColor,
          filled: true,
          prefixIcon: Padding(
            padding: EdgeInsets.all(15.sp),
            child: Image.asset(
              lock,
              height: 15.h,
              width: 15.w,
            ),
          ),
          suffixIcon: GestureDetector(
            onTap: () {
              model.togglePasswordVisibility();
            },
            child: Padding(
              padding: EdgeInsets.only(right: 10.h),
              child: Icon(
                model.isPasswordVisible
                    ? Icons.visibility
                    : Icons.visibility_off,
                color: const Color(0xFF828284),
              ),
            ),
          ),
          hintStyle: workSansTextStyle(
            color: hintColor ?? textFieldHintColor,
            fontSize: 14.sp,
            fontWeight: hintWeight ?? FontWeight.w500,
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: primaryColor,
            ),
            borderRadius: BorderRadius.circular(10.r),
          ),
          errorBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: primaryColor,
            ),
            borderRadius: BorderRadius.circular(10.r),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: primaryColor,
            ),
            borderRadius: BorderRadius.circular(10.r),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: primaryColor,
            ),
            borderRadius: BorderRadius.circular(10.r),
          ),
        ),
      );
    });
  }
}
