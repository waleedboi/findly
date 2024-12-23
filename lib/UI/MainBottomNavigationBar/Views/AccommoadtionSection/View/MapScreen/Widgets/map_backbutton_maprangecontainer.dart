import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../../Constant/colors.dart';

class MapBackButton extends StatelessWidget {
  const MapBackButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: () {
          Navigator.pop(context);
        },
        child: Container(
          height: 48.h,
          width: 50.w,
          padding: EdgeInsets.all(10.r),
          decoration: BoxDecoration(
            color: whiteColor,
            borderRadius: BorderRadius.circular(10.r),
            boxShadow: [
              BoxShadow(
                color: blackColor.withOpacity(0.2),
                spreadRadius: 0,
                blurRadius: 30,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: const Icon(
            Icons.arrow_back,
            color: blackColor,
          ),
        ),
      ),
    );
  }
}

class MapRangeContainer extends StatelessWidget {
  const MapRangeContainer({
    super.key,
    required this.height,
    required this.width,
    required this.child,
  });
  final double height;
  final double width;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6.r),
          color: primaryColor.withOpacity(0.15),
        ),
        child: Center(child: child));
  }
}
