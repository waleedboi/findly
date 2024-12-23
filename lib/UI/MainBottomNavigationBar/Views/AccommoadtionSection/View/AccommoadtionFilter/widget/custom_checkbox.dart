import 'package:findly/Constant/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../../Constant/text_constant.dart';

class FilterCustomCheckbox extends StatefulWidget {
  final bool value;
  final String text;
  final void Function(bool?)? onChanged;
  final double? height;
  final double? width;

  const FilterCustomCheckbox({
    super.key,
    required this.value,
    required this.text,
    this.onChanged,
    this.height,
    this.width,
  });

  @override
  State<FilterCustomCheckbox> createState() => _FilterCustomCheckboxState();
}

class _FilterCustomCheckboxState extends State<FilterCustomCheckbox> {
  void _toggleCheckbox() {
    if (widget.onChanged != null) {
      widget.onChanged!(!widget.value);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 2),
      child: Row(
        children: [
          GestureDetector(
            onTap: _toggleCheckbox,
            child: widget.value
                ? Icon(
                    Icons.check_box,
                    color: secondaryColor,
                    size: 22.sp,
                  )
                : Icon(
                    Icons.check_box_outline_blank,
                    size: 22.sp,
                    color: const Color(0xFF7B7B7D),
                  ),
          ),
          SizedBox(width: 9.w),
          workSansText2(
            text: widget.text,
            fontSize: 12.sp,
            fontWeight: FontWeight.normal,
            color: const Color(0xFF7B7B7D),
          ),
        ],
      ),
    );
  }
}

class FilterContainer extends StatelessWidget {
  const FilterContainer(
      {super.key,
      this.height,
      this.width = 283,
      this.topPadding = 10,
      this.bottomPadding = 10,
      this.leftpadding = 10,
      this.rightpadding = 10,
      required this.child});

  final double? height;
  final double width;
  final double topPadding;
  final double bottomPadding;
  final double leftpadding;
  final double rightpadding;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width.w,
      padding: EdgeInsets.only(
        top: topPadding.h,
        bottom: bottomPadding.h,
        left: leftpadding.w,
        right: rightpadding.w,
      ),
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 249, 249, 249),
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: child,
    );
  }
}
