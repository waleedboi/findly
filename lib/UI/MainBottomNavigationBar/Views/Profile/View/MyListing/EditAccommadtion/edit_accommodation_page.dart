import 'package:findly/Constant/colors.dart';
import 'package:findly/Constant/enum.dart';
import 'package:findly/Constant/text_constant.dart';
import 'package:findly/Core/Custom/app_button.dart';
import 'package:findly/Core/Custom/container_widget.dart';
import 'package:findly/Core/Custom/custom_drop_down.dart';
import 'package:findly/Core/Custom/custom_textfield.dart';
import 'package:findly/Core/Custom/validate_drop_down.dart';
import 'package:findly/Models/AccommodationModels/get_user_accommodation.dart';
import 'package:findly/UI/Auth/Widgets/custom_auth_appbar.dart';
import 'package:findly/UI/Auth/Widgets/custom_dotted_border.dart';
import 'package:findly/UI/MainBottomNavigationBar/Views/Profile/View/AddAccommodation/add_accomodation_screen.dart';
import 'package:findly/UI/MainBottomNavigationBar/Views/Profile/View/MyListing/EditAccommadtion/edit_accommodation_viewmodel.dart';
import 'package:findly/UI/MainBottomNavigationBar/Views/Profile/View/MyListing/EditAccommadtion/edit_submit_Listing.dart';
import 'package:findly/UI/MainBottomNavigationBar/Views/Profile/View/MyListing/my_listing_viewmodel.dart';
import 'package:findly/UI/utils/loader_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

class EditAccommodation extends StatefulWidget {
  const EditAccommodation({super.key, required this.data});

  final GetuserAccommodation data;

  @override
  State<EditAccommodation> createState() => _EditAccommodationState();
}

class _EditAccommodationState extends State<EditAccommodation> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    // Initialize the ViewModel with data passed to the widget
    Future.microtask(() {
      final viewModel =
          Provider.of<EditAccommodationViewmodel>(context, listen: false);
      viewModel.updateAmenitiesValue(widget.data.amenities!);
      viewModel.updateControllers(widget.data);
    });
  }

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
              child: const CustomAuthAppBar(text: "Edit Accommodation"),
            ),
          ),
          Consumer<EditAccommodationViewmodel>(
              builder: (context, model, child) {
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
                                  value: model.selectedCategory,
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
                                  value: model.locationController.text,
                                  fromAddAccommodationPage: true,
                                  onChanged: (String? value) {
                                    model.locationController.text = value ?? '';
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
                                  value: model.selectedTenantType,
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
                                        itemCount:
                                            model.addAccommodationPhotos.length,
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
                                              imagePath:
                                                  model.addAccommodationPhotos[
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
                                  value: model.selectedRoomType,
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
                                  value: model.selectedAvailability,
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
                                    LoadingIndicatorDialog().show(context);
                                    await model.editAccommodation(
                                        accData: widget.data,
                                        onSuccess: () {
                                          Provider.of<MyListingViewmodel>(context,
                                              listen: false)
                                              .init();
                                        });
                                    LoadingIndicatorDialog().dismiss();
                                    Get.to(
                                      () => EditSubmitListing(
                                        type: ServiceType.accommodation,
                                        data: widget.data,
                                      ),
                                    );
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
    );
  }
}
