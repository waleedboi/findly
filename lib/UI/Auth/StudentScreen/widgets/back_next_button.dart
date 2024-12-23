import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../Constant/colors.dart';
import '../../../../Core/Custom/app_button.dart';

class BackNextButton extends StatelessWidget {
  const BackNextButton({
    super.key,
    required this.onNextTap,
  });
  final VoidCallback onNextTap;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: AppButton(
            onTap: () {
              Navigator.pop(context);
            },
            text: "Back",
            buttonColor: secondaryColor,
            borderRadius: 8.r,
          ),
        ),
        SizedBox(width: 12.w),
        Expanded(
          child: AppButton(
            onTap: onNextTap,
            text: "Next",
            buttonColor: primaryColor,
            borderRadius: 8.r,
          ),
        ),
      ],
    );
  }
}
