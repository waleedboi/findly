import 'package:findly/Core/Custom/container_widget.dart';
import 'package:findly/UI/Auth/Widgets/custom_auth_appbar.dart';
import 'package:findly/UI/MainBottomNavigationBar/Views/GraduationPhtographySection/PhotoGraphyReviewScreen/Widget/allreview_listview.dart';
import 'package:findly/UI/MainBottomNavigationBar/Views/MarketPlaceSection/MarketPlaceSubmitListing/marketplace_submitlisting.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/route_manager.dart';
import 'package:provider/provider.dart';

import '../../../../../Constant/assets_constant.dart';
import '../PhotoGrapherDetails/photographer_details.dart';
import 'Widget/add_review_button.dart';
import 'Widget/heading_rating_row.dart';
import 'Widget/review_widget.dart';
import 'photography_reviewscreen_viewmodel.dart';

class PhotographyReviewscreen extends StatelessWidget {
  const PhotographyReviewscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PhotoGraphyContainer(
          child: Stack(
        children: [
          CustomAuthAppBar2(text: "Reviews", topPadding: 62.h, width: 100.w),
          Consumer<PhotographyReviewscreenViewmodel>(
              builder: (context, model, child) {
            return WhiteContainer(
                topPadding: 117.h,
                child: Padding(
                  padding: EdgeInsets.only(top: 25.h),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const HeadingAndRatingRow(),
                      SizedBox(height: 24.w),
                      const Divider(color: Color(0xFFEFEFEF)),
                      SizedBox(height: 12.h),
                      AddReviewButton(
                        onTap: () {
                          Get.dialog(
                            AddReviewWidget(),
                          );
                        },
                      ),
                      SizedBox(height: 35.h),
                      Flexible(
                        fit: FlexFit.loose,
                        child: ListView.builder(
                            shrinkWrap: true,
                            padding: EdgeInsets.only(
                                left: 32.w, right: 31.w, bottom: 27.h),
                            itemCount: reviewsList.length,
                            itemBuilder: (context, index) {
                              PhotoGraphyReviewModel data = reviewsList[index];

                              return AllreviewListview(
                                isExpanded: data.isExpanded,
                                data: data,
                                islastItem: index == reviewsList.length - 1,
                                onExpandedTap: () {
                                  model.toggleExpanded(index);
                                },
                              );
                            }),
                      )
                    ],
                  ),
                ));
          })
        ],
      )),
    );
  }
}

final review1 = PhotoGraphyReviewModel(
  name: "Jhon Smith",
  review: txt,
  time: "2 weeks",
  profile: profile1,
  rating: "4.9",
  isExpanded: false,
);

final review2 = PhotoGraphyReviewModel(
  name: "Charles",
  review: "This Photographer arrived late",
  time: "2 weeks",
  profile: profile2,
  rating: "2.0",
  isExpanded: false,
);

final review3 = PhotoGraphyReviewModel(
  name: "Chris Hampton",
  review: txt,
  time: "2 weeks",
  profile: profile3,
  rating: "4.9",
  isExpanded: false,
);

final review4 = PhotoGraphyReviewModel(
  name: "Chris Hampton",
  review: "Excellent, you are the best Photographer I have ever met",
  time: "2 weeks",
  profile: profile4,
  rating: "5.0",
  isExpanded: false,
);

final review5 = PhotoGraphyReviewModel(
  name: "Jhon Smith",
  review: "Excellent Photographer and very professional in his work",
  time: "2 weeks",
  profile: profile1,
  rating: "4.9",
  isExpanded: false,
);

final review6 = PhotoGraphyReviewModel(
  name: "Charles",
  review: txt,
  time: "2 weeks",
  profile: profile2,
  rating: "2.0",
  isExpanded: false,
);

final review7 = PhotoGraphyReviewModel(
  name: "Chris Hampton",
  review: "Excellent Photographer",
  time: "2 weeks",
  profile: profile3,
  rating: "4.9",
  isExpanded: false,
);

final review8 = PhotoGraphyReviewModel(
  name: "Chris Hampton",
  review: "Excellent, you are the best",
  time: "2 weeks",
  profile: profile4,
  rating: "5.0",
  isExpanded: false,
);

// Add the instances to the reviewsList
List<PhotoGraphyReviewModel> reviewsList = [
  review1,
  review2,
  review3,
  review4,
  review5,
  review6,
  review7,
  review8,
];
