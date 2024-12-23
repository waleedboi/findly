import 'package:findly/UI/Auth/logInScreen/log_in_screen.dart';
import 'package:findly/UI/MainBottomNavigationBar/bottomshett_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/route_manager.dart';

import '../../../../../Constant/assets_constant.dart';
import '../../../../../Constant/colors.dart';
import '../../../../../Constant/text_constant.dart';
import '../../Notificatons/notifications.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({
    super.key,
    required this.model,
  });
  final BottomshettViewmodel model;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 25.w),
      child: Center(
        child: Image.asset(
          logo,
          height: 59.h,
          width: 59.w,
        ),
      ),
    );
  }
}
