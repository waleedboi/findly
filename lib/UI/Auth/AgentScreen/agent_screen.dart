import 'package:findly/Core/Custom/circular_progress.dart';
import 'package:findly/Core/Custom/container_widget.dart';
import 'package:findly/UI/Auth/StudentScreen/widgets/back_next_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../../Constant/colors.dart';
import '../../../Constant/text_constant.dart';
import '../../../Core/Custom/custom_textfield.dart';
import '../Widgets/custom_auth_appbar.dart';
import '../Widgets/custom_dotted_border.dart';
import '../auth_provider.dart';

class AgentScreen extends StatelessWidget {
  AgentScreen({super.key, this.isSocialLogin = false});
  final bool isSocialLogin;
  final TextEditingController usernamecontroller = TextEditingController();
  final TextEditingController agentNumberController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlueContainer(
        child: SingleChildScrollView(
          physics: const NeverScrollableScrollPhysics(),
          child: Consumer<AuthProvider>(builder: (context, model, child) {
            return Form(
              key: formKey,
              child: Column(
                // mainAxisAlignment: MainAxisAlignment.end,
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(height: 62.h),
                  const CustomAuthAppBar(
                    text: "Agent",
                  ),
                  WhiteContainer(
                      topPadding: 27.h,
                      height: 1.sh,
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 34.w),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: 30.h),
                            workSansText(
                                text: "Username",
                                color: const Color(0xFF1E1E1E),
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w500),
                            SizedBox(height: 10.h),
                            CustomTextField2(
                              hintText: "Enter Name ",
                              controller: usernamecontroller,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return "Please enter username";
                                }
                                return null;
                              },
                            ),
                            SizedBox(height: 18.h),
                            // Row(
                            //   children: [
                            //     workSansText(
                            //         text: "Agent Number",
                            //         color: const Color(0xFF1E1E1E),
                            //         fontSize: 14.sp,
                            //         fontWeight: FontWeight.w500),
                            //     GestureDetector(
                            //       onTap: () {},
                            //       child: workSansText(
                            //           text: " Request Agent number",
                            //           color: textHighLight,
                            //           fontSize: 14.sp,
                            //           fontWeight: FontWeight.w500),
                            //     ),
                            //   ],
                            // ),
                            // SizedBox(height: 10.h),
                            // CustomTextField2(
                            //   hintText: "Enter Agent Name",
                            //   controller: agentNumberController,
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
                              borderColor: primaryColor,
                              containercolor: primaryColor.withOpacity(0.18),
                              buttonColor: primaryColor,
                              text: "Upload Profile Photo",
                              textColor: primaryColor,
                              imagePath: model.agentProfile,
                              onTap: () {
                                model.setAgentProfile();
                              },
                            ),
                            SizedBox(height: 178.h),
                            model.agentSignUpLoading
                                ? const KCircularProgress()
                                : BackNextButton(
                                    onNextTap: () {
                                      if (formKey.currentState!.validate()) {
                                        model.createAgentAccount(
                                            username: usernamecontroller.text,
                                            isSocial: isSocialLogin,
                                            agentNumber:
                                                agentNumberController.text);
                                      }
                                    },
                                  ),
                          ],
                        ),
                      ))
                ],
              ),
            );
          }),
        ),
      ),
    );
  }
}
