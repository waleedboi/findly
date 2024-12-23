import 'package:findly/Constant/text_constant.dart';
import 'package:findly/Core/Custom/container_widget.dart';
import 'package:findly/Core/Custom/custom_drop_down.dart';
import 'package:findly/UI/Auth/Widgets/custom_auth_appbar.dart';
import 'package:findly/UI/MainBottomNavigationBar/Views/CampusFriendSection/View/CampusFriendHome/campusfriend_home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../../../Constant/colors.dart';
import '../../../../../../Core/Custom/app_button.dart';
import '../../../../../../Core/Custom/custom_textfield.dart';
import '../../../../../Auth/Widgets/custom_dotted_border.dart';

class CampusfriendCreateProfileScreen extends StatelessWidget {
  CampusfriendCreateProfileScreen({super.key});
  final TextEditingController nameController = TextEditingController();
  final TextEditingController ageController = TextEditingController();
  final TextEditingController bioController = TextEditingController();
  final TextEditingController facebookController = TextEditingController();
  final TextEditingController instagramController = TextEditingController();
  final TextEditingController twitterController = TextEditingController();
  final TextEditingController tiktokController = TextEditingController();

  final TextEditingController youtubeController = TextEditingController();
  final TextEditingController linkedinController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CampusFriendContainer(
        child: Stack(
          children: [
            CustomAuthAppBar2(
              text: "Create Profile",
              width: 74.42.w,
            ),
            WhiteContainer(
              topPadding: 117.h,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 34.w),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 34.h),
                      workSansText(
                          text: "Name",
                          color: const Color(0xFF1E1E1E),
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w500),
                      SizedBox(height: 10.h),
                      CustomTextField2(
                        hintText: "Enter Name",
                        controller: nameController,
                      ),
                      SizedBox(height: 18.h),
                      workSansText(
                          text: "Age",
                          color: const Color(0xFF1E1E1E),
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w500),
                      SizedBox(height: 10.h),
                      CustomTextField2(
                        hintText: "Enter Age",
                        controller: ageController,
                      ),
                      SizedBox(height: 18.h),
                      workSansText(
                          text: "Gender",
                          color: const Color(0xFF1E1E1E),
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w500),
                      SizedBox(height: 10.h),
                      CustomDropDown(hinttext: "Select", onChanged: (val) {}),
                      SizedBox(height: 18.h),
                      workSansText(
                          text: "Campus",
                          color: const Color(0xFF1E1E1E),
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w500),
                      SizedBox(height: 10.h),
                      CustomDropDown(hinttext: "Select", onChanged: (val) {}),
                      SizedBox(height: 18.h),
                      workSansText(
                          text: "Faculty",
                          color: const Color(0xFF1E1E1E),
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w500),
                      SizedBox(height: 10.h),
                      CustomDropDown(hinttext: "Select", onChanged: (val) {}),
                      SizedBox(height: 18.h),
                      workSansText(
                          text: "Academic Year",
                          color: const Color(0xFF1E1E1E),
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w500),
                      SizedBox(height: 10.h),
                      CustomDropDown(hinttext: "Select", onChanged: (val) {}),
                      SizedBox(height: 18.h),
                      workSansText(
                          text: "Gallery",
                          color: const Color(0xFF1E1E1E),
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w500),
                      SizedBox(height: 12.h),
                      CustomDottedBorder(
                        borderColor: const Color(0xFF214478).withOpacity(0.5),
                        containercolor:
                            const Color(0xFF214478).withOpacity(0.1),
                        buttonColor: const Color(0xFF214478),
                        text: "Add Photos",
                        textColor: const Color(0XFF214478),
                        onTap: () {},
                      ),
                      SizedBox(height: 18.h),
                      workSansText(
                          text: "Bio",
                          color: const Color(0xFF1E1E1E),
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w500),
                      SizedBox(height: 10.h),
                      CustomTextField2(
                          maxLines: 5,
                          hintText: biothint,
                          controller: bioController),
                      SizedBox(height: 30.h),
                      workSansText(
                          text: "Social Media Account",
                          color: const Color(0xFF1E1E1E),
                          fontSize: 18.sp,
                          fontWeight: FontWeight.w500),
                      SizedBox(height: 18.h),
                      workSansText(
                          text: "Facebook",
                          color: const Color(0xFF1E1E1E),
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w500),
                      SizedBox(height: 10.h),
                      CustomTextField2(
                        hintText: "Enter",
                        controller: facebookController,
                      ),
                      SizedBox(height: 18.h),
                      workSansText(
                          text: "Instagram",
                          color: const Color(0xFF1E1E1E),
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w500),
                      SizedBox(height: 10.h),
                      CustomTextField2(
                        hintText: "Enter",
                        controller: instagramController,
                      ),
                      SizedBox(height: 18.h),
                      workSansText(
                          text: "Twitter(X)",
                          color: const Color(0xFF1E1E1E),
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w500),
                      SizedBox(height: 10.h),
                      CustomTextField2(
                        hintText: "Enter",
                        controller: twitterController,
                      ),
                      SizedBox(height: 18.h),
                      workSansText(
                          text: "Tiktok",
                          color: const Color(0xFF1E1E1E),
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w500),
                      SizedBox(height: 10.h),
                      CustomTextField2(
                        hintText: "Enter",
                        controller: tiktokController,
                      ),
                      SizedBox(height: 18.h),
                      workSansText(
                          text: "Youtube",
                          color: const Color(0xFF1E1E1E),
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w500),
                      SizedBox(height: 10.h),
                      CustomTextField2(
                        hintText: "Enter",
                        controller: youtubeController,
                      ),
                      SizedBox(height: 18.h),
                      workSansText(
                          text: "Linkedin",
                          color: const Color(0xFF1E1E1E),
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w500),
                      SizedBox(height: 10.h),
                      CustomTextField2(
                        hintText: "Enter",
                        controller: linkedinController,
                      ),
                      SizedBox(height: 70.h),
                      AppButton(
                        onTap: () {
                          Get.to(() => const CampusfriendHomeScreen());
                        },
                        text: "Create",
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w600,
                        textColor: whiteColor,
                        buttonColor: const Color(0xFFFF2A2A),
                      ),
                      SizedBox(height: 46.h),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

String biothint =
    "Lorem ipsum dolor sit am onse ctetur adipiscing el Donec et elit vitae leo sollicit citudin facilisis. Vestibulum ante ipsum pr imis in faucibus orci luctus et ultrices pos uere cubilia curae; Phasellus placerat.";
