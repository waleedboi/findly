import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../../Constant/colors.dart';
import '../../../../../../../Core/Custom/custom_textfield.dart';

class AccomodationSearchField extends StatelessWidget {
  const AccomodationSearchField({
    super.key,
    required this.searchController,
    this.hintText,
    this.onChanged,
  });

  final TextEditingController searchController;
  final String? hintText;
  final void Function(String)? onChanged;

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: 48.h,
      // width: 1.sw,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: blackColor.withOpacity(0.12),
            spreadRadius: 0,
            blurRadius: 48,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: SearchTextField(
        hintSize: 10.sp,
        hintText: hintText ?? "Search by Campus Area or Location",
        onChanged: onChanged,
        controller: searchController,
        hintColor: const Color(0xFFA0A0A0),
        isShowSuffixIcon: true,
        isShowPrefixIcon: true,
        prefixicon: Icons.location_on_sharp,
        suffixIcon: Icons.search,
        prefixIconColor: const Color(0xFFFF6600),
        prefixiconPadding: EdgeInsets.only(left: 0.sp, right: 0.sp),
        suffixiconPadding: EdgeInsets.only(right: 0.sp),
      ),
    );
  }
}
