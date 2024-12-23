import 'package:findly/Constant/assets_constant.dart';
import 'package:findly/Constant/colors.dart';
import 'package:findly/Constant/text_constant.dart';
import 'package:findly/Core/Custom/app_button.dart';
import 'package:findly/Core/Custom/container_widget.dart';
import 'package:findly/UI/Auth/Widgets/custom_auth_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/route_manager.dart';

import '../CampusFriendCreateProfile/campusfriend_createprofile_screen.dart';

class CampusfirendWelcomeScreen extends StatelessWidget {
  const CampusfirendWelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CampusFriendContainer(
          child: Stack(
        children: [
          const CustomAuthAppBar2(text: "Welcome"),
          WhiteContainer(
              topPadding: 117.h,
              child: Column(
                children: [
                  SizedBox(height: 84.h),
                  Image.asset(campuswelcome, height: 363.h, width: 363.w),
                  SizedBox(height: 84.h),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 35.w),
                    child: workSansText2(
                        text:
                            "Welcome to campus friends, create a profile and start discovering people from your campus.",
                        fontSize: 14.sp,
                        textAlign: TextAlign.center,
                        fontWeight: FontWeight.normal,
                        color: const Color(0xFF112022)),
                  ),
                  SizedBox(height: 42.h),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 35.w),
                    child: AppButton(
                      onTap: () {
                        Get.to(() => CampusfriendCreateProfileScreen());
                      },
                      text: "Let's Get Started",
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w600,
                      textColor: whiteColor,
                      buttonColor: const Color(0xFFFF2A2A),
                    ),
                  ),
                ],
              ))
        ],
      )),
    );
  }
}
