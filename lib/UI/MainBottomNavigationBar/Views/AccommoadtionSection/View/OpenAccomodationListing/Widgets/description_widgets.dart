import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../../Constant/colors.dart';
import '../../../../../../../Constant/text_constant.dart';
import '../../../../../../../Core/Custom/app_button.dart';
import '../../../../../../../Models/AccommodationModels/accommodation_model.dart';

class DescriptionContainer extends StatelessWidget {
  const DescriptionContainer({
    super.key,
    required this.description,
    required this.title,
  });

  final String title;
  final String description;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
         decoration: BoxDecoration(
          border: Border.all(
            color: Colors.grey.shade400,
            width: 1.0,
          ),
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Stack(
          clipBehavior: Clip.none,
          alignment: Alignment.centerLeft,
          children: [
            Positioned(
              top: -10,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 12.0),
                color: whiteColor,
                child: Text(
                  title,
                  style: TextStyle(
                    color: Colors.grey.shade700,
                    fontSize: 14.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: workSans16Text(
                      text: description,
                      color: textColor,
                      fontSize: 14.0,
                      overflow: TextOverflow.clip
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class DescriptionHeadingWidget extends StatelessWidget {
  const DescriptionHeadingWidget({
    super.key,
    required this.accommodationModel,
  });

  final AccommodationModel accommodationModel;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 25.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          workSansText(
            text: "Description",
            fontWeight: FontWeight.w500,
            fontSize: 14.sp,
            color: textColor,
          ),
          AppButton(
            text: accommodationModel.isFemale
                ? "Female only"
                : accommodationModel.isMale
                    ? "Male only"
                    : "Unisex",
            textColor: accommodationModel.isMale
                ? const Color(0xFF0055D4)
                : accommodationModel.isFemale
                    ? secondaryColor
                    : primaryColor,
            buttonColor: accommodationModel.isMale
                ? const Color(0xFF0055D4).withOpacity(0.08)
                : accommodationModel.isFemale
                    ? secondaryColor.withOpacity(0.08)
                    : primaryColor.withOpacity(0.08),
            borderRadius: 4.r,
            height: 30.h,
            width: 80.w,
            fontSize: 10.sp,
            fontWeight: FontWeight.normal,
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
