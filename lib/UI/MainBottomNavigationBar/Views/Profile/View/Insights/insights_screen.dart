import 'package:findly/Constant/colors.dart';
import 'package:findly/Constant/text_constant.dart';
import 'package:findly/Core/Custom/container_widget.dart';
import 'package:findly/UI/Auth/Widgets/custom_auth_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class InsightsScreen extends StatelessWidget {
  const InsightsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlueContainer(
          child: Stack(
        children: [
          CustomAuthAppBar2(text: "Insights", topPadding: 62.h, width: 95.w),
          WhiteContainer(
            topPadding: 117.h,
            height: 1.sh,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding:
                        EdgeInsets.only(top: 20.h, bottom: 13.h, left: 24.w),
                    child: workSansText(
                        text: "Hello Tumi !",
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w500,
                        color: textColor),
                  ),
                  const CustomInsightImageContainer(
                    image: "assets/images/insight1.png",
                    color: Color(0XFF4EBC37),
                    text1: "27",
                    text2: "Active Listing",
                  ),
                  SizedBox(height: 18.h),
                  const CustomInsightImageContainer(
                    image: "assets/images/insight2.png",
                    color: Color(0XFF935DFF),
                    text1: "1591",
                    text2: "Total Views",
                  ),
                  SizedBox(height: 18.h),
                  const CustomInsightImageContainer(
                    image: "assets/images/insight4.png",
                    color: Color(0XFFFF0085),
                    text1: "21",
                    text2: "Times",
                    text3: "Bookmarked",
                  ),
                ],
              ),
            ),
          ),
        ],
      )),
    );
  }
}

class CustomInsightImageContainer extends StatelessWidget {
  const CustomInsightImageContainer({
    super.key,
    required this.image,
    required this.color,
    required this.text1,
    required this.text2,
    this.text3,
  });
  final String image;
  final Color color;
  final String text1;
  final String text2;
  final String? text3;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 24.w),
      height: 199.48.h,
      width: 342.w,
      padding: const EdgeInsets.all(3),
      decoration: BoxDecoration(
        color: whiteColor,
        boxShadow: [
          BoxShadow(
            color: const Color(0XFF000000).withOpacity(0.1),
            spreadRadius: 0,
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
        borderRadius: const BorderRadius.all(Radius.circular(17)),
      ),
      child: Container(
        padding: EdgeInsets.only(right: 8.w),
        decoration: BoxDecoration(
          color: color,
          borderRadius: const BorderRadius.all(
            Radius.circular(17),
          ),
        ),
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(image),
              scale: 4.2,
              alignment: Alignment.bottomRight,
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Align(
                alignment: Alignment.topRight,
                child: Padding(
                  padding: EdgeInsets.only(top: 10.h, right: 5.w),
                  child: GestureDetector(
                    onTap: () {},
                    child: CircleContainer(
                      height: 25.17.h,
                      width: 25.17.w,
                      color: whiteColor.withOpacity(0.35),
                      child: Center(
                          child: Icon(
                        Icons.more_vert,
                        color: whiteColor,
                        size: 20.sp,
                      )),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 23.w),
                child: workSansText(
                    text: text1,
                    fontSize: 28.sp,
                    fontWeight: FontWeight.bold,
                    color: whiteColor),
              ),
              Padding(
                padding: EdgeInsets.only(left: 23.w),
                child: workSansText(
                    text: text2,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w500,
                    color: whiteColor),
              ),
              text3 == null
                  ? const SizedBox.shrink()
                  : Padding(
                      padding: EdgeInsets.only(left: 23.w),
                      child: workSansText(
                          text: text3!,
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w500,
                          color: whiteColor),
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
