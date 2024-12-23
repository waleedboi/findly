import 'package:findly/UI/MainBottomNavigationBar/Views/AccommoadtionSection/View/AccommoadtionFilter/widget/distance_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../../Constant/colors.dart';
import '../../../../../../../Constant/text_constant.dart';
import 'custom_checkbox.dart';
import 'custom_range_slider.dart';

//************ Price Slider Container 1 *************/

class PriceSliderContainer extends StatelessWidget {
  const PriceSliderContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return FilterContainer(
      leftpadding: 0,
      rightpadding: 0,
      width: 283.w,
      // height: 93.h,
      topPadding: 10.h,
      bottomPadding: 10.h,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: workSansText(
                text: "Price",
                fontSize: 16.sp,
                fontWeight: FontWeight.w500,
                color: textColor),
          ),
          SizedBox(height: 4.h),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 5.w),
            child: SizedBox(
                height: 44.h, width: 250.w, child: const CustomRangeSlider()),
          ),
          SizedBox(height: 4.h),
        ],
      ),
    );
  }
}

//************ Distance Slider Container 2 *************/

class DistanceSliderContainer extends StatelessWidget {
  const DistanceSliderContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return FilterContainer(
        // height: 93.h,
        width: 283.w,
        leftpadding: 0,
        rightpadding: 0,
        topPadding: 10.h,
        bottomPadding: 5,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: workSansText(
                  text: "Distance",
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w500,
                  color: textColor),
            ),
            SizedBox(height: 8.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 7.w),
              child: SizedBox(
                  height: 44.h, width: 250.w, child: const DistanceSlider()),
            )
          ],
        ));
  }
}

// class CategoryFilterSelectionContainer extends StatelessWidget {
//   const CategoryFilterSelectionContainer({
//     super.key,
//     required this.values,
//     required this.labels,
//     required this.title,
//     required this.onChanged,
//     this.height,
//     this.width,
//     this.bottomPadding = 15,
//   });
//   final List<bool> values;
//   final List<String> labels;
//   final String title;
//   final void Function(int index, bool value) onChanged;
//   final double? height;
//   final double? width;
//   final double bottomPadding;
//   @override
//   Widget build(BuildContext context) {
//     return Consumer<AccommodationFilterViewmodel>(
//         builder: (context, model, child) {
//       return Padding(
//         padding: EdgeInsets.only(left: 12.w, bottom: bottomPadding.h),
//         child: FilterContainer(
//             height: height,
//             width: width,
//             topPadding: 12.h,
//             bottomPadding: 0,
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 workSansText(
//                     text: title,
//                     fontSize: 16.sp,
//                     fontWeight: FontWeight.w500,
//                     color: textColor),
//                 SizedBox(height: 13.h),
//                 ...List.generate(values.length, (index) {
//                   return Padding(
//                     padding: EdgeInsets.only(bottom: 10.h),
//                     child: FilterCustomCheckbox(
//                       value: values[index],
//                       text: labels[index],
//                       onChanged: (value) => onChanged(index, value!),
//                     ),
//                   );
//                 }),
//               ],
//             )),
//       );
//     });
//   }
// }
