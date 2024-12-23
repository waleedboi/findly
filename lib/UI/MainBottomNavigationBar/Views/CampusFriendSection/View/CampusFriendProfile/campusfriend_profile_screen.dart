import 'package:findly/Constant/text_constant.dart';
import 'package:findly/Core/Custom/container_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../Constant/assets_constant.dart';
import '../../../../../../Constant/colors.dart';
import 'Widget/campusfriend_profileimage_widget.dart';

class CampusfriendProfileScreen extends StatelessWidget {
  const CampusfriendProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        CampusfriendProfileImageWidget(
          image: friend2,
          onBookMarkTap: () {},
          onNextTap: () {},
          onPreviousTap: () {},
        ),
        SizedBox(
          height: 1.sh,
          child: WhiteContainer(
              topPadding: 359.h,
              child: SingleChildScrollView(
                child: Container(
                  margin:
                      EdgeInsets.symmetric(horizontal: 24.w, vertical: 28.h),
                  padding:
                      EdgeInsets.symmetric(horizontal: 16.w, vertical: 18.h),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20.r),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.2),
                        spreadRadius: 5,
                        blurRadius: 10,
                        offset: const Offset(0, 3),
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CampusFriendProfileDetailContainer(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            workSans16Text(text: "James Carter"),
                            SizedBox(height: 10.h),
                            const Divider(color: Color(0xFFE9E9E9)),
                            SizedBox(height: 15.h),
                            workSansText(
                                text: "Gender: Male",
                                color: textColor.withOpacity(0.7)),
                            SizedBox(height: 10.h),
                            const Divider(color: Color(0xFFE9E9E9)),
                            SizedBox(height: 10.h),
                            Row(
                              children: [
                                Image.asset(
                                  locationIcon,
                                  color: const Color(0xFFF52D56),
                                  height: 14.h,
                                  width: 10.27.w,
                                ),
                                SizedBox(width: 5.w),
                                workSansText(
                                    text: "UJ APK",
                                    color: textColor.withOpacity(0.7)),
                                SizedBox(height: 10.h),
                              ],
                            ),
                            SizedBox(height: 10.h),
                            const Divider(color: Color(0xFFE9E9E9)),
                            SizedBox(height: 15.h),
                            workSansText(
                                text: "Faculty: Law",
                                color: textColor.withOpacity(0.7)),
                            SizedBox(height: 10.h),
                            const Divider(color: Color(0xFFE9E9E9)),
                            SizedBox(height: 15.h),
                            workSansText(
                                text: "Academic year: 3rd",
                                color: textColor.withOpacity(0.7)),
                            SizedBox(height: 5.h),
                          ],
                        ),
                      ),
                      SizedBox(height: 18.h),
                      workSans16Text(text: "About"),
                      SizedBox(height: 8.69.h),
                      workSansText2(
                          text: profileAbout,
                          fontSize: 12.sp,
                          color: blackColor.withOpacity(0.3)),
                      SizedBox(height: 23.h),
                      workSans16Text(text: "Connect with James"),
                      SizedBox(height: 12.h),
                      CampusFriendProfileDetailContainer(
                        child: Column(
                          children: [
                            SocialRow(
                              icon: instagram,
                              text: "@James_Carter5",
                            ),
                            SizedBox(height: 5.h),
                            const Divider(color: Color(0xFFE9E9E9)),
                            SizedBox(height: 8.h),
                            SocialRow(
                              icon: facebook,
                              text: "James Carter5",
                            ),
                            SizedBox(height: 5.h),
                            const Divider(color: Color(0xFFE9E9E9)),
                            SizedBox(height: 8.h),
                            SocialRow(
                              icon: twitter,
                              text: "@KingJames5",
                            ),
                            SizedBox(height: 5.h),
                            const Divider(color: Color(0xFFE9E9E9)),
                            SizedBox(height: 8.h),
                            SocialRow(
                              icon: tiktok,
                              text: "@james_king",
                            ),
                            SizedBox(height: 5.h),
                            const Divider(color: Color(0xFFE9E9E9)),
                            SizedBox(height: 8.h),
                            SocialRow(
                              icon: youtube,
                              text: "James Blog",
                            ),
                            SizedBox(height: 5.h),
                            const Divider(color: Color(0xFFE9E9E9)),
                            SizedBox(height: 8.h),
                            SocialRow(
                              icon: linkedin,
                              text: "James Carter",
                            ),
                            SizedBox(height: 5.h),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              )),
        )
      ],
    ));
  }
}

class SocialRow extends StatelessWidget {
  const SocialRow({
    super.key,
    required this.icon,
    required this.text,
  });
  final String icon;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.asset(
          icon,
          height: 16.h,
          width: 16.w,
        ),
        SizedBox(width: 9.w),
        workSansText(text: text, color: textColor.withOpacity(0.7))
      ],
    );
  }
}

class CampusFriendProfileDetailContainer extends StatelessWidget {
  const CampusFriendProfileDetailContainer({
    super.key,
    required this.child,
  });
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 1.sw,
      padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 13.h),
      decoration: BoxDecoration(
        color: const Color(0XFF214478).withOpacity(0.05),
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: child,
    );
  }
}

String profileAbout =
    "Lorem ipsum dolor sit am onse ctetur adipiscing el Donec et elit vitae leo sollicit facilisis. Vestibulum ante ipsum primis in faucibus orci luctus eultrices pos uere cubilia curae; Phasellusplacer.";
