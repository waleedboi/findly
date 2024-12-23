import 'dart:async';

import 'package:findly/Constant/assets_constant.dart';
import 'package:findly/Constant/text_constant.dart';
import 'package:findly/Core/Custom/custom_drop_down.dart';
import 'package:findly/UI/Auth/Widgets/custom_auth_appbar.dart';
import 'package:findly/UI/MainBottomNavigationBar/Views/CampusFriendSection/View/CampusFriendProfile/campusfriend_profile_screen.dart';
import 'package:findly/UI/MainBottomNavigationBar/Views/CampusFriendSection/View/CampusFriendfilter/campusfriend_filter_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../../../Constant/colors.dart';
import '../../../../../../Core/Custom/container_widget.dart';
import '../../../AccommoadtionSection/View/AccommodationHome/widgets/filter_button.dart';
import 'Widgets/category.dart';

class CampusfriendHomeScreen extends StatefulWidget {
  const CampusfriendHomeScreen({super.key});

  @override
  State<CampusfriendHomeScreen> createState() => _CampusfriendHomeScreenState();
}

class _CampusfriendHomeScreenState extends State<CampusfriendHomeScreen> {
  double _imageHeight = 0.0;

  final String friend = 'assets/images/friend.png';
  @override
  void initState() {
    super.initState();
    _calculateImageHeight();
  }

  Future<void> _calculateImageHeight() async {
    final image = AssetImage(friend);
    const config = ImageConfiguration();
    final completer = Completer<void>();
    final stream = image.resolve(config);
    stream.addListener(
      ImageStreamListener((ImageInfo info, bool synchronousCall) {
        final myImage = info.image;
        final aspectRatio = myImage.width / myImage.height;
        setState(() {
          _imageHeight =
              1.sw / aspectRatio; // Calculate height based on screen width
        });
        completer.complete();
      }),
    );
    await completer.future;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: CampusFriendContainer(
      child: Stack(
        children: [
          CampusFriendHomeAppBar(
            text: "Campus Friend",
            profile: profile2,
            onTap: () {
              Get.to(() => const CampusfriendProfileScreen());
            },
          ),
          WhiteContainer(
            topPadding: 140.h,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(height: 56.h),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 28.w),
                  child: workSans16Text(text: "Faculties"),
                ),
                SizedBox(height: 20.h),
                const Divider(color: Color(0xFFECECEC), thickness: 1),
                SizedBox(height: 20.h),
                SizedBox(
                  height: 34.h,
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      padding: EdgeInsets.only(left: 28.w),
                      itemCount: campusFriendCategory.length,
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        CampusFrienCategory data = campusFriendCategory[index];
                        return CampusFriendCategory(data: data);
                      }),
                ),
                SizedBox(height: 16.h),
                Flexible(
                  fit: FlexFit.loose,
                  child: SizedBox(
                    height: 0.87.sh,
                    child: ListView.builder(
                        itemCount: 2,
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          return Column(
                            children: [
                              PostImageContainer(
                                  imageHeight: _imageHeight, image: friend),
                              SizedBox(height: 10.h),
                              Padding(
                                padding:
                                    EdgeInsets.only(left: 11.w, right: 47.82.w),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    workSans16Text(
                                        text: "James Catter",
                                        fontSize: 19.3.sp,
                                        fontWeight: FontWeight.w500,
                                        color: textColor),
                                    workSans16Text(
                                      text: "Age: 25",
                                      fontSize: 12.87.sp,
                                      fontWeight: FontWeight.w500,
                                      color: const Color(0xFF363030),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(height: 5.h),
                              PostDetailWidget(
                                icon: faculty,
                                text: "Faculty: Law",
                              ),
                              PostDetailWidget(
                                icon: academicyear,
                                text: "Academic Year: 3rd",
                              ),
                              PostDetailWidget(
                                icon: locationIcon,
                                text: "UJ APK",
                                iconColor: const Color(0xFFFF6600),
                              ),
                              SizedBox(height: 20.h),
                            ],
                          );
                        }),
                  ),
                ),
              ],
            ),
          ),
          Positioned(
              top: 115.h,
              child: SizedBox(
                width: 1.sw,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 27.w),
                  child: Row(
                    children: [
                      Expanded(
                          flex: 5,
                          child: CampusFriendHomeDropDown(
                            hinttext: "UJ APK",
                            onChanged: (val) {},
                          )),
                      SizedBox(width: 9.w),
                      Expanded(
                        child: FilterButton(onTap: () {
                          Get.to(() => const CampusfriendFilterScreen());
                        }),
                      ),
                    ],
                  ),
                ),
              )),
        ],
      ),
    ));
  }
}

class PostDetailWidget extends StatelessWidget {
  const PostDetailWidget({
    super.key,
    required this.icon,
    required this.text,
    this.iconColor,
  });
  final String icon;
  final String text;
  final Color? iconColor;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 11.w),
      child: Row(
        children: [
          Image.asset(
            icon,
            height: 16.h,
            width: 12.27.w,
            color: iconColor,
          ),
          SizedBox(width: 5.w),
          workSansText(
              text: text,
              fontSize: 15.sp,
              fontWeight: FontWeight.normal,
              color: textColor.withOpacity(0.6)),
        ],
      ),
    );
  }
}

class PostImageContainer extends StatelessWidget {
  const PostImageContainer(
      {super.key, required this.imageHeight, required this.image});
  final double imageHeight;
  final String image;
  @override
  Widget build(BuildContext context) {
    return imageHeight > 0
        ? Stack(
            children: [
              Container(
                height: imageHeight,
                width: 1.sw,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(friend),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              Container(
                width: 215.w,
                height: 50.h,
                margin: EdgeInsets.only(top: 50.h),
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.3),
                  borderRadius: BorderRadius.all(Radius.circular(15.r)),
                ),
                child: Center(
                  child: workSansText(
                    text: "Open Profile",
                    fontSize: 27.sp,
                    color: whiteColor,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          )
        : const CircularProgressIndicator();
  }
}
