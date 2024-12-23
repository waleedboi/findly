import 'package:findly/Constant/colors.dart';
import 'package:findly/Constant/text_constant.dart';
import 'package:findly/Core/Custom/app_button.dart';
import 'package:findly/Core/Custom/circular_progress.dart';
import 'package:findly/Core/Custom/container_widget.dart';
import 'package:findly/Core/Custom/custom_drop_down.dart';
import 'package:findly/Core/Custom/custom_textfield.dart';
import 'package:findly/Models/GigModels/gig_user_gigs_model.dart';
import 'package:findly/UI/Auth/Widgets/custom_auth_appbar.dart';
import 'package:findly/UI/Auth/Widgets/custom_dotted_border.dart';
import 'package:findly/UI/MainBottomNavigationBar/Views/Profile/View/MyListing/EditGig/edit_gig_screen_viewmodel.dart';
import 'package:findly/UI/MainBottomNavigationBar/Views/Profile/View/MyListing/GigListing/gig_listing_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class EditGigScreen extends StatelessWidget {
  const EditGigScreen({super.key, required this.data});
  final GetUserGigsModel data;

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
              child: const CustomAuthAppBar(text: "Edit Photography Gig"),
            ),
          ),
          Consumer<EditGigScreenViewmodel>(builder: (context, model, child) {
            return WhiteContainer(
                topPadding: 117.h,
                child: SizedBox(
                  width: 1.sw,
                  child: SingleChildScrollView(
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
                                  text: "Photographer/Company Name",
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w500,
                                  color: textColor),
                              SizedBox(height: 10.h),
                              CustomTextField2(
                                hintText: "Enter Name",
                                controller: model.firstNameController,
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
                                controller: model.descriptionController,
                                hintText: "Description",
                              ),
                              SizedBox(height: 18.h),
                              workSansText2(
                                  text:
                                      "Portfolio ${model.addPhotoGrapherPhotos.isEmpty ? 0 : model.addPhotoGrapherPhotos.length}/10",
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w500,
                                  color: textColor),
                              SizedBox(height: 10.h),
                            ],
                          ),
                        ),
                        model.addPhotoGrapherPhotos.isEmpty
                            ? Padding(
                                padding: EdgeInsets.symmetric(horizontal: 34.w),
                                child: CustomDottedBorder2(
                                  height: 158.74.w,
                                  borderColor: primaryColor,
                                  containercolor:
                                      primaryColor.withOpacity(0.18),
                                  buttonColor: primaryColor,
                                  text: "Add Photos",
                                  textColor: primaryColor,
                                  onTap: () {
                                    model.setAddPhotoGrapherPhotos();
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
                                          model.addPhotoGrapherPhotos.length,
                                      scrollDirection: Axis.horizontal,
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 34.w),
                                      itemBuilder: (context, index) {
                                        return Padding(
                                          padding: EdgeInsets.only(right: 8.w),
                                          child: CustomDottedBorder2(
                                            height: 158.74.w,
                                            borderColor: primaryColor,
                                            containercolor:
                                                primaryColor.withOpacity(0.18),
                                            buttonColor: primaryColor,
                                            text: "Add Photos",
                                            textColor: primaryColor,
                                            imagePath: model
                                                .addPhotoGrapherPhotos[index],
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
                                  text: "Price: (Min)",
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w500,
                                  color: textColor),
                              SizedBox(height: 10.h),
                              CustomTextField2(
                                hintText: "From: R",
                                controller: model.priceController,
                                keyboardType: TextInputType.number,
                              ),
                              SizedBox(height: 18.h),
                              workSansText2(
                                  text: "Select your regions",
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w500,
                                  color: textColor),
                              SizedBox(height: 10.h),
                              CustomDropDown2(
                                items: const [
                                  "Johanessburg",
                                  "Pretoria",
                                  "Durban",
                                  "Cape Town",
                                  "Bloemfontein",
                                  "Port Elizabeth",
                                  "Polokwane",
                                  "Nelspruit",
                                  "Kimberley",
                                  "Stellenbosch",
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
                                  model.selectRegion(val!);
                                },
                                hinttext: "Select region",
                              ),
                              // SizedBox(height: 18.h),
                              // Row(
                              //   children: [
                              //     workSansText2(
                              //         text: "Business Number",
                              //         fontSize: 14.sp,
                              //         fontWeight: FontWeight.w500,
                              //         color: textColor),
                              //     GestureDetector(
                              //       onTap: () {},
                              //       child: workSansText2(
                              //           text: " Request Business Number",
                              //           fontSize: 12.sp,
                              //           fontWeight: FontWeight.w500,
                              //           color: textHighLight),
                              //     ),
                              //   ],
                              // ),
                              // SizedBox(height: 10.h),
                              // CustomTextField2(
                              //   hintText: "P228",
                              //   controller: businessController,
                              // ),
                              SizedBox(height: 65.h),
                              model.loading
                                  ? const KCircularProgress()
                                  : AppButton(
                                      onTap: () async {
                                        await model.editGig(
                                            gigData: data,
                                            onSuccess: () {
                                              Provider.of<GigListingViewmodel>(
                                                      context,
                                                      listen: false)
                                                  .init();
                                            });
                                      },
                                      text: "Publish",
                                    ),
                              SizedBox(height: 60.h),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ));
          }),
        ],
      )),
    );
  }
}
