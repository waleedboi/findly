// ignore_for_file: must_be_immutable

import 'package:findly/Constant/colors.dart';
import 'package:findly/Constant/text_constant.dart';
import 'package:findly/Core/Custom/app_button.dart';
import 'package:findly/Core/Custom/container_widget.dart';
import 'package:findly/UI/Auth/Widgets/custom_auth_appbar.dart';
import 'package:findly/UI/MainBottomNavigationBar/Views/Profile/View/PersonalInformation/personal_informaation_viewmodel.dart';
import 'package:findly/UI/MainBottomNavigationBar/bottomshett_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../../../../../Core/Custom/custom_textfield.dart';

class PersonalInformationScreen extends StatelessWidget {
  PersonalInformationScreen({super.key});

  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController currentPasswordController =
      TextEditingController();
  final TextEditingController newPasswordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  final TextEditingController aboutController = TextEditingController();

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlueContainer(
          child: Stack(
        fit: StackFit.loose,
        children: [
          Positioned(
              top: 62.h,
              child: SizedBox(
                  width: 1.sw,
                  child: const CustomAuthAppBar(text: "Personal Information"))),
          Consumer2<PersonalInformaationViewmodel, BottomshettViewmodel>(
              builder: (context, model, pro, child) {
            return WhiteContainer(
                topPadding: 117.h,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 34.w),
                  child: SizedBox(
                    width: 1.sw,
                    child: SingleChildScrollView(
                      child: Form(
                        key: formKey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: 30.h),
                            workSansText2(
                                text: "First Name",
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w500,
                                color: textColor),
                            SizedBox(height: 10.h),
                            CustomTextField2(
                              hintText: pro.user.firstName ?? "",
                              controller: firstNameController,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return "First Name is required";
                                }
                                return null;
                              },
                            ),
                            SizedBox(height: 18.h),
                            workSansText2(
                                text: "Last Name",
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w500,
                                color: textColor),
                            SizedBox(height: 10.h),
                            CustomTextField2(
                              hintText: pro.user.lastName ?? "",
                              controller: lastNameController,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return "Last Name is required";
                                }
                                return null;
                              },
                            ),
                            SizedBox(height: 18.h),
                            workSansText2(
                                text: "Email",
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w500,
                                color: textColor),
                            SizedBox(height: 10.h),
                            CustomTextField2(
                              hintText: pro.user.email ?? "",
                              controller: emailController,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return "Email is required";
                                } else if (!value.contains("@")) {
                                  return "Invalid Email";
                                }
                                return null;
                              },
                            ),
                            SizedBox(height: 18.h),
                            workSansText2(
                                text: "Username",
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w500,
                                color: textColor),
                            SizedBox(height: 10.h),
                            CustomTextField2(
                              hintText: pro.user.username ?? "",
                              controller: usernameController,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return "Username is required";
                                }
                                return null;
                              },
                            ),
                            SizedBox(height: 18.h),
                            workSansText2(
                                text: "Current Password",
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w500,
                                color: textColor),
                            SizedBox(height: 10.h),
                            CustomTextField2(
                              hintText: "Enter Current Password",
                              controller: currentPasswordController,
                              isShowSuffixIcon: true,
                              suffixIcon: !model.isCurrentPasswordVisible
                                  ? Icons.visibility_off
                                  : Icons.visibility,
                              isObscureText: !model.isCurrentPasswordVisible,
                              onSuffixIconTap: () {
                                model.toggleCurrentPasswordVisibility();
                              },
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return "Current Password is required";
                                }
                                return null;
                              },
                            ),
                            SizedBox(height: 18.h),
                            workSansText2(
                                text: "New Password",
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w500,
                                color: textColor),
                            SizedBox(height: 10.h),
                            CustomTextField2(
                              hintText: "Enter New Password",
                              controller: newPasswordController,
                              isShowSuffixIcon: true,
                              suffixIcon: !model.isPasswordVisible
                                  ? Icons.visibility_off
                                  : Icons.visibility,
                              isObscureText: !model.isPasswordVisible,
                              onSuffixIconTap: () {
                                model.togglePasswordVisibility();
                              },
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return "Password is required";
                                } else if (value.length < 8) {
                                  return "Password must be at least 8 characters";
                                } else if (!validatePassword(value)) {
                                  return "Password must contain at least one uppercase letter, one lowercase letter, and one digit";
                                }
                                return null;
                              },
                            ),
                            SizedBox(height: 18.h),
                            workSansText2(
                                text: "Confirm Password",
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w500,
                                color: textColor),
                            SizedBox(height: 10.h),
                            CustomTextField2(
                              hintText: "Enter Confirm Password",
                              controller: confirmPasswordController,
                              isShowSuffixIcon: true,
                              suffixIcon: !model.isConfirmPasswordVisible
                                  ? Icons.visibility_off
                                  : Icons.visibility,
                              isObscureText: !model.isConfirmPasswordVisible,
                              onSuffixIconTap: () {
                                model.toggleConfirmPasswordVisibility();
                              },
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return "Confirm Password is required";
                                } else if (value !=
                                    newPasswordController.text) {
                                  return "Password does not match";
                                }
                                return null;
                              },
                            ),
                            SizedBox(height: 18.h),
                            workSansText2(
                                text: "About",
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w500,
                                color: textColor),
                            SizedBox(height: 10.h),
                            CustomTextField2(
                              maxLines: 5,
                              controller: aboutController,
                              hintText: "Enter About",
                            ),
                            SizedBox(height: 57.h),
                            AppButton(
                              onTap: () {
                                if (formKey.currentState!.validate()) {
                                  model.updateUser(
                                      firstName: firstNameController.text,
                                      lastName: lastNameController.text,
                                      email: emailController.text,
                                      username: usernameController.text,
                                      about: aboutController.text,
                                      currentPassword:
                                          currentPasswordController.text,
                                      newPassword: newPasswordController.text,
                                      confirmPassword:
                                          confirmPasswordController.text);
                                }
                              },
                              text: "Save Changes",
                            ),
                            SizedBox(height: 55.h),
                          ],
                        ),
                      ),
                    ),
                  ),
                ));
          })
        ],
      )),
    );
  }

  bool validatePassword(String password) {
    const String passwordPattern =
        r'^(?=.*[A-Z])(?=.*[a-z])(?=.*\d)[A-Za-z\d@$!%*?&]{8,}$';
    final RegExp regex = RegExp(passwordPattern);
    return regex.hasMatch(password);
  }
}
