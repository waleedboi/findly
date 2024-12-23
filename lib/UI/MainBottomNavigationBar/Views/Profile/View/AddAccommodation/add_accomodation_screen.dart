import 'package:findly/Constant/enum.dart';
import 'package:findly/Core/Custom/validate_drop_down.dart';
import 'package:findly/UI/MainBottomNavigationBar/Views/Profile/View/AddAccommodation/add_accommodation_viewmodel.dart';
import 'package:findly/UI/utils/loader_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import '../../../../../../Constant/colors.dart';
import '../../../../../../Constant/text_constant.dart';
import '../../../../../../Core/Custom/app_button.dart';
import '../../../../../../Core/Custom/container_widget.dart';
import '../../../../../../Core/Custom/custom_drop_down.dart';
import '../../../../../../Core/Custom/custom_textfield.dart';
import '../../../../../Auth/Widgets/custom_auth_appbar.dart';
import '../../../../../Auth/Widgets/custom_dotted_border.dart';
import '../../../MarketPlaceSection/MarketPlaceSubmitListing/marketplace_submitlisting.dart';

class AddAccomodationScreen extends StatelessWidget {
  AddAccomodationScreen({super.key});

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  late AddaccommodationViewmodel viewmodel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PopScope(
        onPopInvokedWithResult: (__, ___) {
          viewmodel.clearAllData();
        },
        child: BlueContainer(
            child: Stack(
          fit: StackFit.loose,
          children: [
            Positioned(
                top: 62.h,
                child: SizedBox(
                    width: 1.sw,
                    child: CustomAuthAppBar(
                      text: "Add Accommodation",
                      onBackPress: () {
                        viewmodel.clearAllData();
                      },
                    ))),
            Consumer<AddaccommodationViewmodel>(
                builder: (context, model, child) {
              viewmodel = model;
              return WhiteContainer(
                  topPadding: 117.h,
                  child: SizedBox(
                    width: 1.sw,
                    child: SingleChildScrollView(
                      child: Form(
                        key: formKey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 34.w),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(height: 30.h),
                                  workSansText2(
                                      text: "Title",
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.w500,
                                      color: textColor),
                                  SizedBox(height: 10.h),
                                  CustomTextField2(
                                    hintText: "W Accomed",
                                    controller: model.titleController,
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return "Please enter title";
                                      }
                                      return null;
                                    },
                                  ),
                                  SizedBox(height: 18.h),
                                  workSansText2(
                                      text: "Reference",
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.w500,
                                      color: textColor),
                                  SizedBox(height: 10.h),
                                  CustomTextField2(
                                    hintText: "WE 0001",
                                    controller: model.refController,
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return "Please enter reference";
                                      }
                                      return null;
                                    },
                                  ),
                                  SizedBox(height: 18.h),
                                  workSansText2(
                                      text: "Category",
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.w500,
                                      color: textColor),
                                  SizedBox(height: 10.h),
                                  CustomDropDown2(
                                    items: const [
                                      "NSFAS",
                                      "Communes",
                                      "Apartments",
                                      "Flats"
                                    ],

                                    // value: "Available",
                                    itemBuilder: (String value) {
                                      return workSansText2(
                                          text: value,
                                          fontSize: 14.sp,
                                          fontWeight: FontWeight.normal,
                                          color: textColor);
                                    },
                                    onChanged: (val) {
                                      model.setCategory(val!);
                                    },
                                    validator: validateDropdown,
                                    hinttext: "select",
                                  ),
                                  SizedBox(height: 18.h),
                                  workSansText2(
                                      text: "Location",
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.w500,
                                      color: textColor),
                                  SizedBox(height: 10.h),
                                  AccommodationLocationCustomDropDown(
                                    hintText: 'Select location',
                                    value:
                                        model.locationController.text.isNotEmpty
                                            ? model.locationController.text
                                            : null,
                                    fromAddAccommodationPage: true,
                                    onChanged: (String? value) {
                                      model.locationController.text =
                                          value ?? '';
                                    },
                                  ),

                                  SizedBox(height: 18.h),
                                  workSansText2(
                                      text: "Tenant Type",
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.w500,
                                      color: textColor),
                                  SizedBox(height: 10.h),
                                  CustomDropDown2(
                                    items: const [
                                      "Unisex",
                                      "Female only",
                                      "Male only",
                                    ],
                                    // value: "Available",
                                    itemBuilder: (String value) {
                                      return workSansText2(
                                          text: value,
                                          fontSize: 14.sp,
                                          fontWeight: FontWeight.normal,
                                          color: textColor);
                                    },
                                    onChanged: (val) {
                                      model.setTenantType(val!);
                                    },
                                    hinttext: "select",
                                    validator: validateDropdown,
                                  ),
                                  SizedBox(height: 18.h),
                                  workSansText2(
                                      text: "Description",
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.w500,
                                      color: textColor),
                                  SizedBox(height: 10.h),
                                  CustomTextField2(
                                    maxLines: 5,
                                    controller: model.aboutController,
                                    hintText: "Description",
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return "Please enter description";
                                      }
                                      return null;
                                    },
                                  ),
                                  SizedBox(height: 20.h),
                                  workSansText2(
                                      text: "Amenities",
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.w500,
                                      color: textColor),
                                  SizedBox(height: 16.h),

                                  ...List.generate(model.amenitiesLabels.length,
                                      (index) {
                                    return Padding(
                                      padding: EdgeInsets.only(bottom: 11.h),
                                      child: CustomCheckBox(
                                        height: 13.h,
                                        width: 13.w,
                                        text: model.amenitiesLabels[index],
                                        value: model.amenitiesValues[index],
                                        onChanged: (val) {
                                          model.onAmenitiesChanged(index, val);
                                        },
                                      ),
                                    );
                                  }),
                                  // CustomCheckBox(
                                  //   height: 13.h,
                                  //   width: 13.w,
                                  //   text: "Wifi",
                                  //   value: model.isWifiChecked,
                                  //   onChanged: (val) {
                                  //     model.toggleWifiChecked();
                                  //   },
                                  // ),
                                  // SizedBox(height: 11.h),
                                  // CustomCheckBox(
                                  //   height: 13.h,
                                  //   width: 13.w,
                                  //   text: "Transport",
                                  //   value: model.isTranportChecked,
                                  //   onChanged: (val) {
                                  //     model.toggleTransportChecked();
                                  //   },
                                  // ),
                                  SizedBox(height: 23.h),
                                  workSansText2(
                                      text:
                                          "Gallery ${model.addAccommodationPhotos.isEmpty ? 0 : model.addAccommodationPhotos.length}/10",
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.w500,
                                      color: textColor),
                                  SizedBox(height: 12.h),
                                ],
                              ),
                            ),
                            model.addAccommodationPhotos.isEmpty
                                ? Padding(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 34.w),
                                    child: CustomDottedBorder2(
                                      height: 158.74.w,
                                      borderColor: primaryColor,
                                      containercolor:
                                          primaryColor.withOpacity(0.18),
                                      buttonColor: primaryColor,
                                      text: "Add Photos",
                                      textColor: primaryColor,
                                      onTap: () {
                                        model.setAddAccommodationPhotos();
                                      },
                                    ),
                                  )
                                : Flexible(
                                    fit: FlexFit.loose,
                                    child: SizedBox(
                                      height: 158.74.w,
                                      child: ListView.builder(
                                          shrinkWrap: true,
                                          itemCount: model
                                              .addAccommodationPhotos.length,
                                          scrollDirection: Axis.horizontal,
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 34.w),
                                          itemBuilder: (context, index) {
                                            return Padding(
                                              padding:
                                                  EdgeInsets.only(right: 8.w),
                                              child: CustomDottedBorder2(
                                                height: 158.74.w,
                                                borderColor: primaryColor,
                                                containercolor: primaryColor
                                                    .withOpacity(0.18),
                                                buttonColor: primaryColor,
                                                text: "Add Photos",
                                                textColor: primaryColor,
                                                imagePath: model
                                                        .addAccommodationPhotos[
                                                    index],
                                                onEdit: () {
                                                  model.editImage(index);
                                                },
                                                onRemove: () {
                                                  model.removeImage(index);
                                                },
                                              ),
                                            );
                                          }),
                                    ),
                                  ),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 34.w),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(height: 18.h),
                                  workSansText2(
                                      text: "Roomtypes",
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.w500,
                                      color: textColor),
                                  SizedBox(height: 10.h),
                                  CustomDropDown2(
                                    items: const [
                                      "Single",
                                      "Sharing",
                                      "Cottage",
                                      "Bachelor",
                                      "Ensuite",
                                      "Studio",
                                    ],
                                    // value: "Single",
                                    itemBuilder: (String value) {
                                      return workSansText2(
                                          text: value,
                                          fontSize: 14.sp,
                                          fontWeight: FontWeight.normal,
                                          color: textColor);
                                    },
                                    onChanged: (val) {
                                      model.setRoomType(val!);
                                    },
                                    hinttext: "Single",
                                    validator: validateDropdown,
                                  ),
                                  SizedBox(height: 18.h),
                                  workSansText2(
                                      text: "Price",
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.w500,
                                      color: textColor),
                                  SizedBox(height: 10.h),
                                  CustomTextField2(
                                    hintText: "from R3000/Month",
                                    controller: model.priceController,
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return "Please enter price";
                                      }
                                      return null;
                                    },
                                  ),
                                  SizedBox(height: 18.h),
                                  workSansText2(
                                      text: "Availability",
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.w500,
                                      color: textColor),
                                  SizedBox(height: 10.h),
                                  CustomDropDown2(
                                    items: const [
                                      "Available",
                                      "Unavailable",
                                    ],
                                    // value: "Available",
                                    itemBuilder: (String value) {
                                      return workSansText2(
                                          text: value,
                                          fontSize: 14.sp,
                                          fontWeight: FontWeight.normal,
                                          color: textColor);
                                    },
                                    onChanged: (val) {
                                      model.setAvailability(val!);
                                    },
                                    hinttext: "Availability",
                                    validator: validateDropdown,
                                  ),
                                  SizedBox(height: 70.h),
                                  AppButton(
                                    onTap: () async {
                                      if (formKey.currentState!.validate()) {
                                        if (model.amenitiesLabels.isEmpty) {
                                          Get.snackbar("Error",
                                              "Please select amenities");
                                        } else if (model
                                            .addAccommodationPhotos.isEmpty) {
                                          Get.snackbar(
                                              "Error", "Please add photos");
                                        } else {
                                          LoadingIndicatorDialog().show(context,
                                              text: 'Publishing');
                                          await model.addAccommodation();
                                          LoadingIndicatorDialog().dismiss();
                                          if (!model.failedNetworkRequest) {
                                            Get.to(
                                              () =>
                                                  const MarketplaceSubmitListing(
                                                type: ServiceType.accommodation,
                                              ),
                                            );
                                          }
                                        }
                                      }
                                    },
                                    text: "Publish",
                                  ),
                                  SizedBox(height: 60.h),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ));
            })
          ],
        )),
      ),
    );
  }
}

class CustomCheckBox extends StatelessWidget {
  const CustomCheckBox({
    super.key,
    required this.value,
    required this.text,
    required this.onChanged,
    this.height,
    this.width,
  });

  final bool value;
  final String text;
  final void Function(bool?)? onChanged;
  final double? height;
  final double? width;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 2),
      child: Row(
        // crossAxisAlignment: CrossAxisAlignment.start,
        // mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            height: height ?? 5.h,
            width: width ?? 5.w,
            child: Checkbox(
                side: const BorderSide(width: 2, color: Color(0xFF7B7B7D)),
                activeColor: primaryColor,
                materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                value: value,
                onChanged: onChanged),
          ),
          SizedBox(width: 10.w),
          workSansText2(
              text: text,
              fontSize: 12.sp,
              fontWeight: FontWeight.normal,
              color: const Color(0xFF7B7B7D)),
        ],
      ),
    );
  }
}
