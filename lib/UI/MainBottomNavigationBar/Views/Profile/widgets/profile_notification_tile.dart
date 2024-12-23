import 'package:flutter/material.dart';
import 'package:flutter_advanced_switch/flutter_advanced_switch.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../Constant/colors.dart';
import '../../../../../Constant/text_constant.dart';
import '../../../../Auth/Widgets/custom_auth_appbar.dart';

class ProfileNotificationTile extends StatefulWidget {
  const ProfileNotificationTile({
    super.key,
    required this.icon,
    required this.text,
    this.route,
    required this.onTap,
    this.iconheight,
    this.iconwidth,
  });
  final String icon;
  final String text;
  final String? route;
  final VoidCallback onTap;
  final double? iconheight;
  final double? iconwidth;

  @override
  State<ProfileNotificationTile> createState() =>
      _ProfileNotificationTileState();
}

class _ProfileNotificationTileState extends State<ProfileNotificationTile> {
  final _controller00 = ValueNotifier<bool>(false);
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  // final bool _initialValue = false;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: Container(
        height: 56.h,
        padding: EdgeInsets.only(right: 14.w),
        decoration: BoxDecoration(
          color: whiteColor,
          borderRadius: BorderRadius.circular(10.r),
          boxShadow: [
            BoxShadow(
              color: const Color(0XFF000000).withOpacity(0.15),
              blurRadius: 15,
              spreadRadius: 1,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Row(
          children: [
            Container(
              height: 25.h,
              width: 3.w,
              color: primaryColor,
            ),
            SizedBox(width: 10.w),
            CircleContainer(
              height: 32.h,
              width: 32.w,
              color: primaryColor.withOpacity(0.1),
              child: Center(
                child: Image.asset(
                  widget.icon,
                  height: widget.iconheight ?? 13.h,
                  width: widget.iconwidth ?? 13.w,
                  color: primaryColor,
                ),
              ),
            ),
            SizedBox(width: 10.w),
            workSansText(
                text: widget.text,
                fontSize: 15.sp,
                fontWeight: FontWeight.w500,
                color: blackColor),
            const Spacer(),
            AdvancedSwitch(
              width: 50.w,
              height: 25.h,
              controller: _controller00,
              thumb: Container(
                height: 15.h,
                width: 15.w,
                padding: EdgeInsets.all(3.w),
                decoration: const BoxDecoration(
                    color: Color.fromARGB(255, 160, 199, 158),
                    shape: BoxShape.circle),
                child: Container(
                  decoration: const BoxDecoration(
                      color: Color(0xFF5DB075), shape: BoxShape.circle),
                  child: Center(
                    child: Transform.rotate(
                      angle: 90 * 3.1415926535897932 / 180,
                      child: Icon(
                        Icons.menu,
                        color: whiteColor,
                        size: 10.sp,
                      ),
                    ),
                  ),
                ),
              ),
              // borderRadius: 20.r,
              activeColor: const Color.fromARGB(255, 235, 241, 246),
              inactiveColor: const Color(0xFFE5E5E5),
              activeChild: Container(
                alignment: Alignment.center,
                child: workSansText(
                  text: "ON",
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w500,
                  color: primaryColor,
                ),
              ),
              inactiveChild: Container(
                alignment: Alignment.center,
                child: workSansText(
                  text: "OFF",
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w500,
                  color: blackColor,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
