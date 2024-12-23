import 'package:findly/Core/Custom/container_widget.dart';
import 'package:findly/UI/Auth/Widgets/custom_auth_appbar.dart';
import 'package:findly/UI/MainBottomNavigationBar/Views/CampusFriendSection/View/CampusFriendfilter/campusfriend_filter_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:stepper_list_view/stepper_list_view.dart';

import '../../../../../../Constant/colors.dart';
import '../../../../../../Core/Custom/app_button.dart';
import '../../../AccommoadtionSection/View/AccommoadtionFilter/widget/selection_container.dart';
import 'Widget/custom_ageslider_container.dart';

class CampusfriendFilterScreen extends StatelessWidget {
  const CampusfriendFilterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CampusFriendContainer(
        child: Stack(
          children: [
            // Add your widgets here
            CustomAuthAppBar2(
              text: "Filters",
              width: 117.w,
            ),
            WhiteContainer(
              topPadding: 117.h,
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 26.w, vertical: 18.h),
                padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 18.h),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20.r),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.2),
                      spreadRadius: 5,
                      blurRadius: 10,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
                child: Consumer<CampusfriendFilterViewmodel>(
                    builder: (context, model, child) {
                  return SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        StepperListView(
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          // stepSize: const Size(40, 42),
                          // avatarRadius: 50,
                          stepAvatar: (_, data) {
                            return PreferredSize(
                              preferredSize: const Size.fromRadius(5),
                              child: Column(
                                children: [
                                  SizedBox(height: 4.h),
                                  const CircleAvatar(
                                    radius: 5,
                                    backgroundColor: secondaryColor,
                                  ),
                                ],
                              ),
                            );
                          },
                          stepperData: [
                            StepperItemData(content: 1),
                            StepperItemData(content: 2),
                            StepperItemData(content: 3),
                          ],
                          stepContentWidget: (_, data) {
                            switch (data.content) {
                              case 1:
                                return CategoryFilterSelectionContainer(
                                  // height: 190.h,
                                  width: 283.w,
                                  values: model.facultyValues,
                                  labels: model.facultyLabels,
                                  title: "Faculty",
                                  onChanged: (index, value) {
                                    model.onFacultyChanged(index, value);
                                  },
                                );
                              case 2:
                                return Padding(
                                  padding:
                                      EdgeInsets.only(left: 12.w, bottom: 15.h),
                                  child: const AgeRangeSliderContainer(),
                                );
                              case 3:
                                return CategoryFilterSelectionContainer(
                                  // height: 190.h,
                                  width: 283.w,
                                  values: model.gender,
                                  labels: model.genderLabels,
                                  title: "Categories",
                                  onChanged: (index, value) {
                                    model.onFacultyChanged(index, value);
                                  },
                                );

                              default:
                                return const Text("Unknown Step");
                            }
                          },
                        ),
                        SizedBox(height: 27.h),
                        AppButton(
                          width: 300.w,
                          onTap: () {},
                          text: "Apply",
                          buttonColor: const Color(0XFFFF2A2A),
                        ),
                        SizedBox(height: 27.h),
                      ],
                    ),
                  );
                }),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
