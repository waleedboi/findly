import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../../../../../../Constant/colors.dart';
import '../../../../../../../Constant/text_constant.dart';
import '../accommodation_filter_viewmodel.dart';
import 'custom_checkbox.dart';

class CategoryFilterSelectionContainer extends StatelessWidget {
  const CategoryFilterSelectionContainer({
    super.key,
    required this.values,
    required this.labels,
    required this.title,
    required this.onChanged,
    this.height,
    this.width,
    this.bottomPadding = 15,
  });
  final List<bool> values;
  final List<String> labels;
  final String title;
  final void Function(int index, bool value) onChanged;
  final double? height;
  final double? width;
  final double bottomPadding;
  @override
  Widget build(BuildContext context) {
    return Consumer<AccommodationFilterViewmodel>(
        builder: (context, model, child) {
      return Padding(
        padding: EdgeInsets.only(left: 12.w, bottom: bottomPadding.h),
        child: FilterContainer(
            height: height,
            width: width ?? 283,
            topPadding: 12.h,
            bottomPadding: 0,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                workSansText(
                    text: title,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w500,
                    color: textColor),
                SizedBox(height: 13.h),
                ...List.generate(values.length, (index) {
                  return Padding(
                    padding: EdgeInsets.only(bottom: 10.h),
                    child: FilterCustomCheckbox(
                      value: values[index],
                      text: labels[index],
                      onChanged: (value) => onChanged(index, value!),
                    ),
                  );
                }),
              ],
            )),
      );
    });
  }
}
