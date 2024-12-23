import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../../Constant/colors.dart';
import '../../../../../../../Constant/text_constant.dart';

class CampusFriendCategory extends StatelessWidget {
  const CampusFriendCategory({
    super.key,
    required this.data,
  });

  final CampusFrienCategory data;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(right: 10.w),
        child: Container(
          height: 31.h,
          padding: EdgeInsets.symmetric(horizontal: data.width!.w),
          decoration: BoxDecoration(
            color: data.isSelected
                ? const Color(0xFFFF2A2A)
                : const Color(0xFFECECEC),
            borderRadius: BorderRadius.all(Radius.circular(20.r)),
          ),
          child: Center(
            child: workSansText(
              text: data.name!,
              fontSize: 12.sp,
              color: data.isSelected ? whiteColor : textColor,
            ),
          ),
        ));
  }
}

class CampusFrienCategory {
  final String? name;
  final VoidCallback? onTap;
  final bool isSelected;
  final double? width;

  CampusFrienCategory(
      {this.name, this.onTap, this.isSelected = false, this.width});
}

List<CampusFrienCategory> campusFriendCategory = [
  CampusFrienCategory(
    name: "All",
    width: 18,
    isSelected: true,
  ),
  CampusFrienCategory(
    name: "Law",
    width: 18,
    isSelected: false,
  ),
  CampusFrienCategory(
    name: "Accounting",
    isSelected: false,
    width: 10,
  ),
  CampusFrienCategory(
    name: "Engineering",
    isSelected: false,
    width: 10,
  ),
  CampusFrienCategory(
    name: "Engineering",
    isSelected: false,
    width: 10,
  ),
];
