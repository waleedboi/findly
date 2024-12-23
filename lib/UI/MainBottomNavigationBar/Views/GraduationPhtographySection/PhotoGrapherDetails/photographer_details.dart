import 'dart:async';

import 'package:findly/Constant/assets_constant.dart';
import 'package:findly/Constant/enum.dart';
import 'package:findly/Constant/text_constant.dart';
import 'package:findly/Core/Custom/app_button.dart';
import 'package:findly/Core/Custom/container_widget.dart';
import 'package:findly/UI/MainBottomNavigationBar/Views/Chats/chat_screen.dart';
import 'package:findly/UI/MainBottomNavigationBar/Views/GraduationPhtographySection/GraduationPhotoGraphyHome/getGig_model.dart';
import 'package:findly/UI/MainBottomNavigationBar/Views/GraduationPhtographySection/PhotoGrapherDetails/widgets/topimage_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/route_manager.dart';
import 'package:provider/provider.dart';

import '../GraduationPhotoGraphyHome/photography_homeviewmodel.dart';
import 'widgets/region_widgets.dart';
import 'widgets/rows_and_container.dart';

class PhotographerDetails extends StatefulWidget {
  const PhotographerDetails(
      {super.key, required this.isBookMarked, required this.index, this.gig});

  final bool isBookMarked;
  final int index;
  final Gig? gig;

  @override
  State<PhotographerDetails> createState() => _PhotographerDetailsState();
}

class _PhotographerDetailsState extends State<PhotographerDetails> {
  double _imageHeight = 0.0;

  final String photography3 = 'assets/images/photography3.png';

  @override
  void initState() {
    super.initState();
    _calculateImageHeight();
  }

  Future<void> _calculateImageHeight() async {
    final image = AssetImage(photography3);
    const config = ImageConfiguration();
    final completer = Completer<void>();
    final stream = image.resolve(config);
    stream.addListener(
      ImageStreamListener((ImageInfo info, bool synchronousCall) {
        final myImage = info.image;
        final aspectRatio = myImage.width / myImage.height;
        setState(() {
          _imageHeight =
              1.sw / aspectRatio; // Calculate height based on screen width
        });
        completer.complete();
      }),
    );
    await completer.future;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PhotoGraphyContainer(
          child: Stack(
        children: [
          Consumer<PhotographyViewmodel>(builder: (context, model, child) {
            return PhotoGraphyTopImageContainer(
              imageHeight: _imageHeight,
              images: widget.gig!.portfolio!,
              isBookmarked: model.isBookmarkedList[0],
              onBookMarkTap: () {
                model.toggleBookmark(0);
              },
            );
          }),
          WhiteContainer(
              topPadding: 218.h,
              height: double.maxFinite,
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 13.h, horizontal: 25.w),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      RatingAndHeadingNameRow(
                        gig: widget.gig!,
                      ),
                      SizedBox(height: 6.h),
                      ShareAndPriceRow(
                        gig: widget.gig!,
                      ),
                      SizedBox(height: 12.h),
                      // workSansText(
                      //   text: "Business Number: P228",
                      //   fontSize: 14.sp,
                      //   color: const Color(0xFF0A0909),
                      // ),
                      // SizedBox(height: 14.h),

                      workSansText(
                          text: "Regions",
                          fontSize: 14.sp,
                          color: const Color(0xFF0A0909),
                          fontWeight: FontWeight.w500),
                      SizedBox(height: 14.17.h),
                      RegionNames(gig: widget.gig),
                      SizedBox(height: 12.53.h),
                      workSansText(
                          text: "About",
                          fontSize: 14.sp,
                          color: const Color(0xFF0A0909),
                          fontWeight: FontWeight.w500),
                      SizedBox(height: 13.53.h),
                      PhotoGraphyDescriptionContainer(gig: widget.gig!),
                      SizedBox(height: 21.17.h),

                      /*
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          workSansText(
                              text: "Reviews: (47)",
                              fontSize: 14.sp,
                              color: textColor,
                              fontWeight: FontWeight.w500),
                          GestureDetector(
                            onTap: () {
                              Get.to(() => const PhotographyReviewscreen());
                            },
                            child: workSansText(
                                text: "See All",
                                fontSize: 12.sp,
                                color: secondaryColor,
                                fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                     ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: photoGraphyReview.length,
                        itemBuilder: (context, index) {
                          return DetailScreenReviewListView(
                              data: photoGraphyReview[index],
                              islastItem:
                                  index == photoGraphyReview.length - 1);
                        },
                      ),
                      SizedBox(height: 25.h),*/
                      AppButton(
                        onTap: () {
                          Get.to(() =>
                              ChatScreen(serviceType: ServiceType.photography));
                        },
                        linearGradient: const LinearGradient(
                          colors: [
                            Color(0xFFFF512F),
                            Color(0xFFFF8C00)
                          ], // Gradient colors
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight,
                        ),
                        text: "Send Message",
                      ),
                      SizedBox(height: 15.h),
                      const Divider(color: Color(0XFFE9E8E8)),
                      // SizedBox(height: 14.h),
                      // AppButton(
                      //     onTap: () {
                      //       Get.dialog(ReportListingPopup(
                      //         onSubmit: () {
                      //           Get.back();
                      //         },
                      //       ));
                      //     },
                      //     text: "Report this Gig",
                      //     buttonColor: secondaryColor),
                    ],
                  ),
                ),
              ))
        ],
      )),
    );
  }
}

class PhotoGraphyReviewModel {
  final String? name;
  final String? review;
  final String? time;
  final String? profile;
  final String? rating;
  bool isExpanded;

  PhotoGraphyReviewModel({
    this.name,
    this.review,
    this.time,
    this.profile,
    this.rating,
    this.isExpanded = false,
  });
}

List<PhotoGraphyReviewModel> photoGraphyReview = [
  PhotoGraphyReviewModel(
      name: "Jhon Smith",
      review: "Excellent Photographer and very professional in his work",
      time: "2 weeks",
      profile: profile1,
      rating: "4.9"),
  PhotoGraphyReviewModel(
      name: "Charles",
      review: "This Photographer arrived late...",
      time: "2 weeks",
      profile: profile2,
      rating: "2.0"),
  PhotoGraphyReviewModel(
      name: "Chris Hampton",
      review: "Excellent Photographer...",
      time: "2 weeks",
      profile: profile3,
      rating: "4.9"),
  // PhotoGraphyReviewModel(
  //     name: "Chris Hampton",
  //     review: "Excellent, you are the best...",
  //     time: "2 weeks",
  //     profile: profile4,
  //     rating: "5.0"),
];
