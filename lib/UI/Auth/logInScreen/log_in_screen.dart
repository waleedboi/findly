import 'package:findly/Constant/assets_constant.dart';
import 'package:findly/Constant/colors.dart';
import 'package:findly/Constant/text_constant.dart';
import 'package:findly/Core/Custom/app_button.dart';
import 'package:findly/Core/Custom/circular_progress.dart';
import 'package:findly/Core/Custom/custom_textfield.dart';
import 'package:findly/Core/app_routes.dart';
import 'package:findly/UI/Auth/auth_provider.dart';
import 'package:findly/UI/Auth/logInScreen/login_viewmodel.dart';
import 'package:findly/UI/Auth/logInScreen/reset_password_popup.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import '../../../Core/Custom/container_widget.dart';
import '../Widgets/auth_logo_widget.dart';
import '../Widgets/social_button.dart';

class LogInScreen extends StatelessWidget {
  LogInScreen({super.key, required this.isFrombottomSheet});

  final TextEditingController usernamecontroller = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final bool isFrombottomSheet;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlueContainer(
          child: WhiteContainer(
        topPadding: 78.h,
        height: 1.sh,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Center(child: TopNotchContainer()),
            SizedBox(height: 13.h),
            AuthLogoWidget(
              isFrombottomSheet: isFrombottomSheet,
            ),
            SizedBox(height: 10.h),
            Center(
              child: workSansText(
                  text: "Sign In",
                  fontSize: 23.sp,
                  color: blackColor,
                  fontWeight: FontWeight.w600),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 38.w) +
                      EdgeInsets.only(top: 31.h),
                  child: Consumer<LoginViewmodel>(
                      builder: (context, model, child) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        workSansText(
                          text: "Username",
                          color: blackColor,
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w500,
                        ),
                        SizedBox(height: 10.h),
                        CustomTextField(
                            hintText: "Enter Username",
                            controller: usernamecontroller),
                        SizedBox(height: 28.h),
                        workSansText(
                          text: "Password",
                          color: blackColor,
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w500,
                        ),
                        SizedBox(height: 10.h),
                        PasswordField(
                          hintText: "........",
                          controller: passwordController,
                        ),
                        SizedBox(height: 10.h),
                        Align(
                          alignment: Alignment.centerRight,
                          child: GestureDetector(
                            onTap: () {
                              Get.dialog(ResetPasswordPopup());
                            },
                            child: workSansText(
                              text: "Reset Password",
                              color: const Color(0xFFFE6404),
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        SizedBox(height: 43.h),
                        model.loading
                            ? const KCircularProgress(color: secondaryColor)
                            : AppButton(
                                buttonColor: secondaryColor,
                                textColor: whiteColor,
                                onTap: () async {
                                  await model.login(
                                    email: usernamecontroller.text.trim(),
                                    password: passwordController.text.trim(),
                                  );
                                },
                                text: "Sign in"),
                        SizedBox(height: 17.h),
                        AppButton(
                            onTap: () {
                              Navigator.pushNamedAndRemoveUntil(
                                  context,
                                  AppRoutes.mainBottomNavigationbar,
                                  (route) => false);
                            },
                            text: "Continue as Guest"),
                        SizedBox(height: 26.h),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              width: 108.w,
                              child: const Divider(
                                color: Color(0xFFEBE9E9),
                                thickness: 1.39,
                              ),
                            ),
                            SizedBox(width: 10.w),
                            workSansText(
                              text: "OR",
                              color: blackColor.withOpacity(0.5),
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w500,
                            ),
                            SizedBox(width: 10.w),
                            SizedBox(
                              width: 108.w,
                              child: const Divider(
                                color: Color(0xFFEBE9E9),
                                thickness: 1.39,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 30.h),
                        Consumer<AuthProvider>(builder: (context, auth, child) {
                          return auth.isGoogleSignInLoading
                              ? const KCircularProgress()
                              : Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    SocialButton(
                                      onTap: () async {
                                        await auth.googleLogin();
                                      },
                                      image: google,
                                    ),
                                    SizedBox(width: 12.w),
                                    SocialButton(
                                      onTap: () async {
                                        await auth.signInWithFacebook();
                                      },
                                      image: facebook,
                                    ),
                                  ],
                                );
                        }),
                        SizedBox(height: 30.h),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            workSansText(
                              text: "Don't have an account?",
                              color: blackColor,
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w500,
                            ),
                            SizedBox(width: 5.w),
                            GestureDetector(
                              onTap: () {
                                Navigator.pushNamed(
                                    context, AppRoutes.createAccount);
                              },
                              child: workSansText(
                                text: "Sign Up",
                                color: const Color(0xFFFE6404),
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 40.h),
                      ],
                    );
                  }),
                ),
              ),
            )
          ],
        ),
      )),
    );
  }
}
