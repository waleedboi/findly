import 'package:findly/Core/Custom/container_widget.dart';
import 'package:findly/UI/MainBottomNavigationBar/Views/AccommoadtionSection/View/AccommoadtionFilter/widget/filter_all_containers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/route_manager.dart';
import 'package:provider/provider.dart';
import 'package:stepper_list_view/stepper_list_view.dart';

import '../../../../../../Constant/colors.dart';
import '../../../../../../Core/Custom/app_button.dart';
import '../../../../../Auth/Widgets/custom_auth_appbar.dart';
import 'accommodation_filter_viewmodel.dart';
import 'widget/selection_container.dart';

class AccommodationFilterScreen extends StatefulWidget {
  const AccommodationFilterScreen({super.key});

  @override
  State<AccommodationFilterScreen> createState() =>
      _AccommodationFilterScreenState();
}

class _AccommodationFilterScreenState extends State<AccommodationFilterScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DeepBlueContainer(
          child: Stack(
        children: [
          CustomAuthAppBar2(
            topPadding: 62.h,
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
              child: Consumer<AccommodationFilterViewmodel>(
                  builder: (context, model, child) {
                return SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      StepperListView(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
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
                          StepperItemData(content: 4),
                          StepperItemData(content: 5),
                          StepperItemData(content: 6),
                          StepperItemData(content: 7),
                        ],
                        stepContentWidget: (_, data) {
                          switch (data.content) {
                            case 1:
                              return Padding(
                                padding:
                                    EdgeInsets.only(left: 12.w, bottom: 15.h),
                                child: const PriceSliderContainer(),
                              );
                            case 2:
                              return Padding(
                                padding:
                                    EdgeInsets.only(left: 12.w, bottom: 15.h),
                                child: const DistanceSliderContainer(),
                              );
                            case 3:
                              return CategoryFilterSelectionContainer(
                                width: 283.w,
                                values: model.catagoryValues,
                                labels: model.catagoryLabels,
                                title: "Categories",
                                onChanged: (index, value) {
                                  model.onCategoryChanged(index, value);
                                },
                              );
                            case 4:
                              return CategoryFilterSelectionContainer(
                                width: 283.w,
                                values: model.roomtypesvalues,
                                labels: model.roomtypeLabels,
                                title: "Room Type",
                                onChanged: (index, value) {
                                  model.onRoomTypeChanged(index, value);
                                },
                              );
                            case 5:
                              return CategoryFilterSelectionContainer(
                                width: 283.w,
                                values: model.anenitiesValues,
                                labels: model.anenitiesLabels,
                                title: "Amenities",
                                onChanged: (index, value) {
                                  model.onAmenitiesChanged(index, value);
                                },
                              );
                            case 6:
                              return CategoryFilterSelectionContainer(
                                width: 283.w,
                                values: model.availabilityValues,
                                labels: model.availabilityLabels,
                                title: "Availability",
                                onChanged: (index, value) {
                                  model.onAvailabilityChanged(index, value);
                                },
                              );
                            case 7:
                              return CategoryFilterSelectionContainer(
                                bottomPadding: 0,
                                width: 283.w,
                                values: model.tenantTypeValues,
                                labels: model.tenantTypeLabels,
                                title: "Tenant Type",
                                onChanged: (index, value) {
                                  model.onTenantTypeChanged(index, value);
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
                        onTap: () {
                          Get.back();
                        },
                        text: "Apply",
                        buttonColor: secondaryColor,
                      ),
                      SizedBox(height: 27.h),
                    ],
                  ),
                );
              }),
            ),
          ),
        ],
      )),
    );
  }
}
