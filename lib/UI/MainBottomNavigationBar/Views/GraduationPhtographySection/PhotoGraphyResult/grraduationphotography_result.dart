import 'dart:developer';

import 'package:findly/Models/toprated_photographer_model.dart';
import 'package:findly/UI/MainBottomNavigationBar/Views/GraduationPhtographySection/GraduationPhotoGraphyHome/getGig_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/route_manager.dart';
import 'package:provider/provider.dart';

import '../../../../../Constant/text_constant.dart';
import '../../../../../Core/Custom/container_widget.dart';
import '../../../../../Core/Custom/custom_drop_down.dart';
import '../../../../Auth/Widgets/custom_auth_appbar.dart';
import '../GraduationPhotoGraphyHome/graduationphotography_home.dart';
import '../GraduationPhotoGraphyHome/photography_homeviewmodel.dart';
import 'widget/photographer_resultdetail.dart';

class GraduationPhotographyResult extends StatelessWidget {
  const GraduationPhotographyResult({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
          Consumer<PhotographyViewmodel>(builder: (context, model, child) {
        return PhotoGraphyContainer(
          child: Stack(
            children: [
              PhotoGraphyAppBar(
                  onTap: () {
                    model.clearSearch();
                    Get.back();
                  },
                  text: "Graduation Photographers",
                  topPadding: 49.h,
                  width: 42.42.w),
              WhiteContainer(
                topPadding: 160.h,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 27.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 50.h),
                      workSans16Text(
                        text: "35 Results",
                        color: const Color(0xFF1E1E1E),
                      ),
                      // SizedBox(height: 20.h),
                      Flexible(
                        fit: FlexFit.loose,
                        child: ListView.builder(
                            padding: EdgeInsets.symmetric(vertical: 20.h),
                            shrinkWrap: true,
                            itemCount: topRatedPhotographerresult.length,
                            itemBuilder: (context, index) {
                              return GestureDetector(
                                onTap: () {
                                  Get.to(() => PhotographerResultDetails(
                                        index: index,
                                        isBookMarked:
                                            model.isBookmarkedResultList[index],
                                      ));
                                },
                                child: TopRatedPhotoGraphy(
                                    onBookMarkTap: () {
                                      model.toggleResultBookmark(index);
                                    },
                                    isBookMarked:
                                        model.isBookmarkedResultList[index],
                                    model: Gig()),
                              );
                            }),
                      )
                    ],
                  ),
                ),
              ),
              Positioned(
                  top: 129.h,
                  child: SizedBox(
                    width: 1.sw,
                    child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 27.w),
                        child: GraduationphotographyHomeCustomDropDown(
                            hintTextColor: model.search.isNotEmpty
                                ? const Color(0XFF1A1A1A)
                                : const Color(0xFFA0A0A0),
                            hinttext: model.search.isNotEmpty
                                ? model.search
                                : "select",
                            onChanged: (val) {
                              log("value is $val");
                              model.setSearch(val!);
                            })),
                  )),
            ],
          ),
        );
      }),
    );
  }
}
