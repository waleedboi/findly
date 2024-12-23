import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:share_plus/share_plus.dart';

import '../../../../../../../Constant/assets_constant.dart';
import '../../../../../../../Constant/colors.dart';
import '../../../../../../../Constant/text_constant.dart';
import '../../../../../../../Models/AccommodationModels/accommodation_model.dart';

class LocationWidget extends StatelessWidget {
  const LocationWidget({
    super.key,
    required this.accommodationModel,
  });

  final AccommodationModel accommodationModel;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 25.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Image.asset(
            locationIcon,
            height: 14.h,
            width: 10.27.w,
            fit: BoxFit.cover,
            color: const Color(0xFF80B3FF),
          ),
          SizedBox(width: 4.w),
          workSansText(
            text: accommodationModel.location!,
            fontWeight: FontWeight.normal,
            fontSize: 14.sp,
            color: textColor,
          ),
        ],
      ),
    );
  }
}

class ShareWidget extends StatelessWidget {
  const ShareWidget({
    super.key,
    this.accommodationModel,
  });

  final AccommodationModel? accommodationModel;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 25.w, right: 28.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: workSansText(
                text:accommodationModel!.title.toString(),
                fontSize: 18.sp,
                fontWeight: FontWeight.w500,
                color: blackColor),
          ),
          SizedBox(width: 12.w,),
          GestureDetector(
            onTap: () {
              Share.share("Accommodation");
            },
            child: Image.asset(
              share,
              height: 24.h,
              width: 24.w,
            ),
          ),
        ],
      ),
    );
  }
}

class HeaderWidget extends StatelessWidget {
  const HeaderWidget({
    super.key,
    required this.accommodationModel,
  });

  final AccommodationModel accommodationModel;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 25.w, top: 18.h, right: 18.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SvgPicture.asset(
            (accommodationModel.isAvailable ?? false)
                ? availableSvgIcon
                : unavailableSvgIcon,
            height: 20,
            width: 20,
          ),
          const Spacer(),
          workSansText(
              text: accommodationModel.reference ?? '',
              fontSize: 14.sp,
              fontWeight: FontWeight.w500,
              color: blackColor.withOpacity(0.5)),
        ],
      ),
    );
  }
}
