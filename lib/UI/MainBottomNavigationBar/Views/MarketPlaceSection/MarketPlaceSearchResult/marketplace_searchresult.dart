import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import '../../../../../Constant/text_constant.dart';
import '../../../../../Core/Custom/container_widget.dart';
import '../../../../Auth/Widgets/custom_auth_appbar.dart';
import '../MarketPlaceHome/Widgets/marketplace_topitem_gridview.dart';
import '../MarketPlaceHome/marketplacehome_viewmodel.dart';
import 'widget/marketplace_resultitemdetails.dart';

class MarketplaceSearchresult extends StatelessWidget {
  const MarketplaceSearchresult({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
          Consumer<MarketplacehomeViewmodel>(builder: (context, model, child) {
        return MarketPlaceContainer(
            child: Stack(
          children: [
            CustomAuthAppBar2(
              text: "Campus Marketplace",
              width: 30.w,
            ),
            WhiteContainer(
                topPadding: 140.h,
                height: 0.87.sh,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 5.h),
                    Align(
                      alignment: Alignment.center,
                      child: Column(
                        children: [
                          workSansText(
                              text: "showing results for:",
                              fontSize: 12.sp,
                              fontWeight: FontWeight.normal,
                              color: const Color(0XFF999999)),
                          workSans16Text(text: model.search),
                        ],
                      ),
                    ),
                    SizedBox(height: 10.h),
                    Divider(
                      color: const Color(0xFFE9E9E9),
                      height: 0.h,
                    ),

                    //Top item text
                    SizedBox(height: 15.h),
                    Padding(
                      padding: EdgeInsets.only(left: 25.w, right: 25.w),
                      child: workSans16Text(text: "35 Results"),
                    ),
                    SizedBox(height: 15.h),
                    // Flexible(
                    //   fit: FlexFit.loose,
                    //   child: GridView.builder(
                    //       padding: EdgeInsets.only(
                    //           bottom: 25.h, right: 25.w, left: 25.w),
                    //       itemCount: topItemsReult.length,
                    //       shrinkWrap: true,
                    //       gridDelegate:
                    //           const SliverGridDelegateWithFixedCrossAxisCount(
                    //         crossAxisCount: 2,
                    //         crossAxisSpacing: 20,
                    //         mainAxisSpacing: 18.62,
                    //       ),
                    //       itemBuilder: (context, index) {
                    //         return MarketPlaceTopItemGridView(
                    //             onTap: () {
                    //               Get.to(MarketplaceResultitemdetails(
                    //                 index: index,
                    //                 isBookMarked: model.isBookmarkedList[index],
                    //               ));
                    //             },
                    //             isBookmarked:
                    //                 model.isResultBookmarkedList[index],
                    //             onBookMarkTap: () {
                    //               model.toggleTopItemResultBookmark(index);
                    //             },
                    //             model: topItemsReult[index]);
                    //       }),
                    // ),
                  ],
                )),
          ],
        ));
      }),
    );
  }
}
