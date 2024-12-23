import 'package:findly/UI/MainBottomNavigationBar/Views/AccommoadtionSection/View/MapScreen/map_screen_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../../../../../../Constant/colors.dart';
import '../../../../../../../Constant/text_constant.dart';
import 'map_backbutton_maprangecontainer.dart';

class DistanceSliderWidget extends StatelessWidget {
  const DistanceSliderWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<MapScreenViewmodel>(builder: (context, model, child) {
      return Expanded(
        flex: 5,
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
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(
                child: SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      thumbColor: const Color(0xFF68C6E7),
                      trackHeight: 2.0,
                      thumbShape:
                          RoundSliderThumbShape(enabledThumbRadius: 7.r),
                      activeTrackColor: const Color(0xFF68C6E7),
                      inactiveTrackColor: const Color(0XFFCEF5FF),
                      // overlayColor: const Color(0XFF7BC9DE).withAlpha(32),
                      showValueIndicator: ShowValueIndicator.always,
                      valueIndicatorTextStyle: workSansTextStyle(
                        fontSize: 10.sp,
                        color: const Color(0XFF9EA0A3),
                      ),
                      overlayShape:
                          const RoundSliderOverlayShape(overlayRadius: 0.0),
                      // valueIndicatorColor: Colors.transparent,
                    ),
                    child: Slider(
                      value: model.sliderValue,
                      min: 0,
                      max: 20,
                      activeColor: const Color(0xFF68C6E7),
                      inactiveColor: Colors.grey,
                      onChanged: (double value) {
                        model.onSliderChanged(value);
                      },
                    )),
              ),
              MapRangeContainer(
                height: 26.h,
                width: 57.w,
                child: workSansText(
                    text: "${model.sliderValue.toStringAsFixed(1)} KM",
                    fontSize: 10.sp,
                    fontWeight: FontWeight.normal,
                    color: textColor.withOpacity(0.5)),
              ),
              SizedBox(width: 5.w),
              MapRangeContainer(
                height: 26.h,
                width: 32.w,
                child: Icon(Icons.my_location_outlined,
                    color: textColor.withOpacity(0.5), size: 20.sp),
              ),
            ],
          ),
        ),
      );
    });
  }
}
