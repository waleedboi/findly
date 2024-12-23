import 'package:findly/UI/MainBottomNavigationBar/Views/GraduationPhtographySection/GraduationPhotoGraphyHome/getGig_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:share_plus/share_plus.dart';

import '../../../../../../Constant/assets_constant.dart';
import '../../../../../../Constant/colors.dart';
import '../../../../../../Constant/text_constant.dart';
import '../../../../../Auth/Widgets/custom_auth_appbar.dart';

class PhotoGraphyDescriptionContainer extends StatelessWidget {
  const PhotoGraphyDescriptionContainer({
    super.key,
    this.gig,
  });
  final Gig? gig;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100.94.h,
       decoration: BoxDecoration(
        color: const Color(0xFFCFCFCF).withOpacity(0.15),
        borderRadius: BorderRadius.circular(8.48.r),
      ),
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 8.h),
      child: workSansText2(
          maxLines: 5,
          text: gig!.description.toString() +'fmnasfnasnldfaksnfd kdnfmklasdnfkalsmdfalkmdfklmasdlflasdf lkmflamsdlfmaslmd mlmdfmalsdmflamsdf',
          fontSize: 12.72.sp,
          fontWeight: FontWeight.normal,
          color: blackColor.withOpacity(0.4)),
    );
  }
}

class RatingAndHeadingNameRow extends StatelessWidget {
  RatingAndHeadingNameRow({
    super.key,
    this.gig,
  });
  final Gig? gig;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        workSans16Text(text: gig!.name.toString(), fontWeight: FontWeight.w600),
        // const Spacer(),
        // Image.asset(
        //   starfilled,
        //   width: 15.23.w,
        //   height: 14.06.h,
        // ),
        // SizedBox(width: 4.68.w),
        // workSansText(
        //     text: "4.9",
        //     fontSize: 14.06.sp,
        //     color: const Color(0xFF363030),
        //     fontWeight: FontWeight.w500)
      ],
    );
  }
}

class ShareAndPriceRow extends StatelessWidget {
  const ShareAndPriceRow({
    super.key,
    this.gig,
  });
  final Gig? gig;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        RichText(
          text: TextSpan(
            text: "From ",
            style: workSansTextStyle(
                color: textColor,
                fontSize: 12.sp,
                fontWeight: FontWeight.w400),
            children: [
              TextSpan(
                text: 'R${gig?.price}',
                style: workSansTextStyle(
                    color: textColor,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w700),
              ),
              TextSpan(
                text: '/session',
                style: workSansTextStyle(
                    color: textColor,
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w400),
              ),
            ],
          ),
        ),
        const Spacer(),
        GestureDetector(
          onTap: () {
            Share.share("Check out this photographer on the TDE app");
          },
          child: Image.asset(
            share,
            height: 20.h,
            width: 18.w,
            color: blueColor,
          ),
        )
      ],
    );
  }
}

String desc =
    "Lorem ipsum dolor sit am onse ctetur adipiscing el Donec et elit vitae leo sollicit facilisis. Vestibulum ante ipsum primis in faucibus orci luctus eultrices pos uere cubilia curae; Phasellus placerat.";
