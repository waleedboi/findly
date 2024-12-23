import 'dart:async';

import 'package:findly/Constant/colors.dart';
import 'package:findly/Constant/text_constant.dart';
import 'package:findly/Core/Custom/app_button.dart';
import 'package:findly/Core/Custom/container_widget.dart';
import 'package:findly/UI/MainBottomNavigationBar/Views/GraduationPhtographySection/GraduationPhotoGraphyHome/getGig_model.dart';
import 'package:findly/UI/MainBottomNavigationBar/Views/GraduationPhtographySection/PhotoGrapherDetails/widgets/topimage_container.dart';
import 'package:findly/UI/MainBottomNavigationBar/Views/GraduationPhtographySection/PhotoGraphyReviewScreen/photography_reviewscreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/route_manager.dart';
import 'package:provider/provider.dart';

import '../../GraduationPhotoGraphyHome/photography_homeviewmodel.dart';
import '../../PhotoGrapherDetails/photographer_details.dart';
import '../../PhotoGrapherDetails/widgets/region_widgets.dart';
import '../../PhotoGrapherDetails/widgets/review_lastview.dart';
import '../../PhotoGrapherDetails/widgets/rows_and_container.dart';

class PhotographerResultDetails extends StatefulWidget {
  const PhotographerResultDetails(
      {super.key, required this.isBookMarked, required this.index});
  final bool isBookMarked;
  final int index;

  @override
  State<PhotographerResultDetails> createState() =>
      _PhotographerResultDetailsState();
}

class _PhotographerResultDetailsState extends State<PhotographerResultDetails> {
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
              images: [photography3],
              isBookmarked: model.isBookmarkedResultList[widget.index],
              onBookMarkTap: () {
                model.toggleResultBookmark(widget.index);
                // model.toggleBookMark(widget.index);
              },
            );
          }),
          WhiteContainer(
              topPadding: 218.h,
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 13.h, horizontal: 25.w),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      RatingAndHeadingNameRow(),
                      SizedBox(height: 20.h),
                      const ShareAndPriceRow(),
                      SizedBox(height: 12.h),
                      workSansText(
                        text: "Business Number: P228",
                        fontSize: 14.sp,
                        color: const Color(0xFF0A0909),
                      ),
                      SizedBox(height: 14.h),
                      workSansText(
                          text: "About",
                          fontSize: 14.sp,
                          color: const Color(0xFF0A0909),
                          fontWeight: FontWeight.w500),
                      SizedBox(height: 13.53.h),
                      const PhotoGraphyDescriptionContainer(),
                      SizedBox(height: 12.53.h),
                      workSansText(
                          text: "Regions",
                          fontSize: 14.sp,
                          color: const Color(0xFF0A0909),
                          fontWeight: FontWeight.w500),
                      SizedBox(height: 14.17.h),
                      const RegionNames(),
                      SizedBox(height: 21.17.h),
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
                      SizedBox(height: 25.h),
                      AppButton(onTap: () {}, text: "Send Message"),
                      SizedBox(height: 14.h),
                      AppButton(
                          onTap: () {},
                          text: "Report this Gig",
                          buttonColor: secondaryColor),
                    ],
                  ),
                ),
              ))
        ],
      )),
    );
  }
}
