import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../../Constant/assets_constant.dart';
import '../../../../../../../Constant/colors.dart';
import '../../../../../../Auth/Widgets/custom_auth_appbar.dart';

class LocationMarkerIcon extends StatelessWidget {
  const LocationMarkerIcon({
    super.key,
    required this.sliderValue,
  });
  final double sliderValue;
  //slider value is from 0 to 20

  @override
  Widget build(BuildContext context) {
    // Base sizes for slider value 10
    const double baseOuterSize = 230.0;

    // Calculate sizes based on slider value
    final double outerSize = baseOuterSize - (10 - sliderValue) * 10;

    return Align(
      alignment: Alignment.center,
      child: CircleContainer(
        height: outerSize.h,
        width: outerSize.w,
        color: const Color(0xFF2C5AA0).withOpacity(0.12),
        child: Center(
          child: CircleContainer(
            height: 57.h,
            width: 57.w,
            color: whiteColor,
            padding: EdgeInsets.all(2.r),
            boxShadow: [
              BoxShadow(
                color: blackColor.withOpacity(0.3),
                spreadRadius: 1,
                blurRadius: 10,
                offset: const Offset(0, 2),
              ),
            ],
            child: CircleContainer(
              height: 43.h,
              width: 43.w,
              color: secondaryColor,
              child: Center(
                  child: Image.asset(pointlocation, height: 26.h, width: 30.w)),
            ),
          ),
        ),
      ),
    );
  }
}
