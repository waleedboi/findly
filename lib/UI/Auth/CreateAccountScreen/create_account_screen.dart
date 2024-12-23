import 'package:findly/Core/Custom/container_widget.dart';
import 'package:findly/Core/app_routes.dart';
import 'package:findly/UI/Auth/auth_provider.dart';
import 'package:findly/UI/MainBottomNavigationBar/Views/PrivacyAndTerms/privacy_and_terms.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/route_manager.dart';
import 'package:provider/provider.dart';

import '../../../Constant/colors.dart';
import '../../../Constant/text_constant.dart';
import '../../../Core/Custom/app_button.dart';
import '../../../Core/Custom/custom_textfield.dart';
import '../Widgets/auth_logo_widget.dart';

class CreateAccountScreen extends StatelessWidget {
  CreateAccountScreen({super.key});
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlueContainer(
          child: WhiteContainer(
              height: 1.sh,
              topPadding: 78.h,
              child: Consumer<AuthProvider>(builder: (context, model, child) {
                return Form(
                  key: formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Center(child: TopNotchContainer()),
                      SizedBox(height: 13.h),
                      const AuthLogoWidget(),
                      SizedBox(height: 10.h),
                      Center(
                        child: workSansText(
                            text: "Create Account",
                            fontSize: 23.sp,
                            color: blackColor,
                            fontWeight: FontWeight.w600),
                      ),
                      Expanded(
                        child: SingleChildScrollView(
                          physics: const AlwaysScrollableScrollPhysics(),
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 38.w) +
                                EdgeInsets.only(top: 31.h),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                workSansText(
                                  text: "First Name",
                                  color: blackColor,
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w500,
                                ),
                                SizedBox(height: 10.h),
                                CustomTextField(
                                  controller: model.firsNameController,
                                  hintText: "Enter First Name",
                                ),
                                SizedBox(height: 15.h),
                                workSansText(
                                  text: "Last Name",
                                  color: blackColor,
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w500,
                                ),
                                SizedBox(height: 10.h),
                                CustomTextField(
                                  controller: model.lastNameController,
                                  hintText: "Enter Last Name",
                                ),
                                SizedBox(height: 15.h),
                                workSansText(
                                  text: "Email",
                                  color: blackColor,
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w500,
                                ),
                                SizedBox(height: 10.h),
                                CustomTextField(
                                  controller: model.emailController,
                                  hintText: "Enter Your Email",
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return "Email is required";
                                    } else if (!value.contains("@")) {
                                      return "Invalid Email";
                                    }
                                    return null;
                                  },
                                ),
                                SizedBox(height: 15.h),
                                workSansText(
                                  text: "Password",
                                  color: blackColor,
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w500,
                                ),
                                SizedBox(height: 10.h),
                                PasswordField(
                                  hintText: "Enter Your Password",
                                  controller: model.passwordController,
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return "Password is required";
                                    } else if (value.length < 8) {
                                      return "Password must be at least 8 characters";
                                    } else if (!model.validatePassword(value)) {
                                      return "Password must contain at least one uppercase letter, one lowercase letter, and one digit";
                                    }
                                    return null;
                                  },
                                ),
                                SizedBox(height: 15.h),
                                workSansText(
                                  text: "Confirm Password",
                                  color: blackColor,
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w500,
                                ),
                                SizedBox(height: 10.h),
                                PasswordField(
                                  hintText: "Confirm Your Password",
                                  controller: model.confirmPasswordController,
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return "Password is required";
                                    } else if (value !=
                                        model.passwordController.text) {
                                      return "Password does not match";
                                    }
                                    return null;
                                  },
                                ),
                                SizedBox(height: 8.h),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    workSansText(
                                      text: "By signing up, you agree to our ",
                                      color: blackColor,
                                      fontSize: 12.sp,
                                      fontWeight: FontWeight.w500,
                                    ),
                                    SizedBox(width: 5.w),
                                    GestureDetector(
                                      onTap: () {
                                        Get.to(() => const PrivacyAndTerms());
                                      },
                                      child: workSansText(
                                        text: "Privacy and Terms",
                                        color: const Color(0xFFFE6404),
                                        fontSize: 12.sp,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 28.h),
                                AppButton(
                                  text: "Create Account",
                                  onTap: () {
                                    if (formKey.currentState!.validate()) {
                                      Navigator.pushNamed(
                                          context, AppRoutes.chooseRole);
                                    }
                                  },
                                ),
                                SizedBox(height: 10.h),
                                Center(
                                  child: GestureDetector(
                                    onTap: () {
                                      Navigator.pop(context);
                                    },
                                    child: workSansText(
                                      text: "Login to your account",
                                      color: const Color(0xFFFE6404),
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                                SizedBox(height: 20.h),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              }))),
    );
  }
}
