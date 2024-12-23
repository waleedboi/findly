import 'dart:developer';
import 'dart:io';

import 'package:findly/UI/MainBottomNavigationBar/Views/Profile/profileviewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../../../../Constant/colors.dart';
import '../../../../Auth/Widgets/custom_auth_appbar.dart';

class ProfileScreenImageWidget extends StatelessWidget {
  const ProfileScreenImageWidget({
    super.key,
    this.image,
  });
  final String? image;
  @override
  Widget build(BuildContext context) {
    return Consumer<ProfileViewmodel>(builder: (context, model, child) {
      return Positioned(
        top: 102.h,
        child: Stack(
          alignment: Alignment.bottomRight,
          children: [
            Container(
              height: 109.h,
              width: 109.w,
              padding: EdgeInsets.all(5.w),
              decoration: BoxDecoration(
                color: whiteColor,
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: const Color(0XFF000000).withOpacity(0.4),
                    blurRadius: 5,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Container(
                height: 109.h,
                width: 109.w,
                decoration: BoxDecoration(
                  color: const Color(0XFF166FF6),
                  shape: BoxShape.circle,
                  image: model.myProfilePic != null
                      ? DecorationImage(
                          onError: (exception, stackTrace) {
                            log("Error: $exception");
                          },
                          image: FileImage(File(model.myProfilePic!)),
                          fit: BoxFit.cover)
                      : image != null
                          ? DecorationImage(
                              onError: (exception, stackTrace) {
                                log("Error: $exception");
                              },
                              image: FileImage(File(image!)),
                              fit: BoxFit.cover)
                          : null,
                ),
              ),
            ),
            Positioned(
              right: 7.w,
              bottom: 5.h,
              child: GestureDetector(
                onTap: () {
                  log("Edit Profile Pic");
                  model.setMyProfilePic();
                },
                child: CircleContainer(
                  color: primaryColor,
                  height: 27.h,
                  width: 27.w,
                  child: Icon(
                    Icons.edit_square,
                    color: whiteColor,
                    size: 15.sp,
                  ),
                ),
              ),
            )
          ],
        ),
      );
    });
  }
}
