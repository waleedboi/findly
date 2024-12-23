import 'package:findly/Constant/colors.dart';
import 'package:findly/Core/Custom/circular_progress.dart';
import 'package:findly/Core/Custom/container_widget.dart';
import 'package:findly/Core/Custom/custom_drop_down.dart';
import 'package:findly/Core/Custom/custom_textfield.dart';
import 'package:findly/UI/Auth/StudentScreen/widgets/back_next_button.dart';
import 'package:findly/UI/Auth/Widgets/custom_dotted_border.dart';
import 'package:findly/UI/Auth/auth_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../../Constant/text_constant.dart';
import '../Widgets/custom_auth_appbar.dart';

class StudentScreen extends StatefulWidget {
  const StudentScreen({super.key, this.isSocialLogin = false});
  final bool isSocialLogin;

  @override
  State<StudentScreen> createState() => _StudentScreenState();
}

class _StudentScreenState extends State<StudentScreen> {
  final TextEditingController studentNumberController = TextEditingController();

  final TextEditingController studentNameController = TextEditingController();

  final TextEditingController studentCampusController = TextEditingController();

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  String selectedCampus = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlueContainer(
          child: Stack(
        // mainAxisAlignment: MainAxisAlignment.end,
        // mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: EdgeInsets.only(top: 62.h),
            child: const CustomAuthAppBar(
              text: "Student",
            ),
          ),
          WhiteContainer(
              topPadding: 117.h,
              height: 1.sh,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 34.w),
                child: SingleChildScrollView(
                  padding: EdgeInsets.zero,
                  child:
                      Consumer<AuthProvider>(builder: (context, model, child) {
                    return Form(
                      key: formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        // mainAxisSize: MainAxisSize.min,
                        children: [
                          SizedBox(height: 34.h),
                          workSansText(
                              text: "Username",
                              color: const Color(0xFF1E1E1E),
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w500),
                          SizedBox(height: 10.h),
                          CustomTextField2(
                            hintText: "Enter Name",
                            controller: studentNameController,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "Please enter username";
                              }
                              return null;
                            },
                          ),
                          SizedBox(height: 18.h),
                          workSansText(
                              text: "Choose Your Campus",
                              color: const Color(0xFF1E1E1E),
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w500),
                          SizedBox(height: 10.h),
                          CustomDropDown2(
                            items: const [
                              "Campus1",
                              "Campus2",
                              "Campus3",
                            ],
                            itemBuilder: (String value) {
                              return workSansText2(
                                  text: value,
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.normal,
                                  color: textColor);
                            },
                            onChanged: (val) {
                              selectedCampus = val!;
                              setState(() {});
                            },
                            hinttext: "Select Campus",
                          ),
                          // CustomTextField2(
                          //   hintText: "Choose Your Campus",
                          //   controller: studentNumberController,
                          //   isShowSuffixIcon: true,
                          // ),
                          SizedBox(height: 18.h),
                          // workSansText(
                          //     text: "Student Number",
                          //     color: const Color(0xFF1E1E1E),
                          //     fontSize: 14.sp,
                          //     fontWeight: FontWeight.w500),
                          // SizedBox(height: 10.h),
                          // CustomTextField2(
                          //   hintText: "Enter Student Number",
                          //   controller: studentCampusController,
                          // ),
                          // SizedBox(height: 18.h),
                          // workSansText(
                          //   text: "Upload Student Card",
                          //   fontSize: 14.sp,
                          //   fontWeight: FontWeight.w500,
                          //   color: const Color(0xFF112022),
                          // ),
                          // SizedBox(height: 12.h),
                          // CustomDottedBorder(
                          //   borderColor: primaryColor,
                          //   containercolor: primaryColor.withOpacity(0.18),
                          //   buttonColor: primaryColor,
                          //   text: "Upload Student Card",
                          //   textColor: primaryColor,
                          //   onTap: () {},
                          // ),
                          // SizedBox(height: 18.h),
                          workSansText(
                            text: "Upload Profile Photo",
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w500,
                            color: const Color(0xFF112022),
                          ),
                          SizedBox(height: 12.h),
                          CustomDottedBorder(
                            borderColor: secondaryColor,
                            containercolor: secondaryColor.withOpacity(0.18),
                            buttonColor: secondaryColor,
                            text: "Upload Profile Photo",
                            textColor: secondaryColor,
                            imagePath: model.studentProfile,
                            onTap: () {
                              model.setStudentProfile();
                            },
                          ),
                          SizedBox(height: 37.w),
                          model.studentSignUpLoading == true
                              ? const KCircularProgress()
                              : BackNextButton(
                                  onNextTap: () async {
                                    // Get.offAll(() => const MainBottomNavigationbar());
                                    if (formKey.currentState!.validate()) {
                                      // print(" campus: $selectedCampus");
                                      await model.createStudentAccount(
                                          username: studentNameController.text,
                                          isSocial: widget.isSocialLogin,
                                          studentCampus: selectedCampus,
                                          studentNumber: "1234");
                                    }
                                  },
                                ),
                          SizedBox(height: 72.h),
                        ],
                      ),
                    );
                  }),
                ),
              ))
        ],
      )),
    );
  }
}
