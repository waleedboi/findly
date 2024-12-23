// ignore_for_file: must_be_immutable

import 'dart:async';

import 'package:findly/UI/MainBottomNavigationBar/Views/AccommoadtionSection/View/OpenAccomodationListing/Widgets/description_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../../../../../Constant/assets_constant.dart';
import '../../../../../../Constant/colors.dart';
import '../../../../../../Constant/text_constant.dart';
import '../../../../../../Core/Custom/app_button.dart';
import '../../../../../../Core/Custom/container_widget.dart';
import '../../../../../Auth/Widgets/custom_auth_appbar.dart';
import '../../MarketPlaceHome/marketplacehome_viewmodel.dart';
import '../../MarketPlaceItemDetails/marketplace_itemdetails.dart';
import '../../MarketPlaceItemDetails/widgets/itemdetail_imagecontainer.dart';

class MarketplaceResultitemdetails extends StatefulWidget {
  MarketplaceResultitemdetails(
      {super.key, required this.isBookMarked, required this.index});
  final bool isBookMarked;
  int index = 0;

  @override
  State<MarketplaceResultitemdetails> createState() =>
      _MarketplaceResultitemdetailsState();
}

class _MarketplaceResultitemdetailsState
    extends State<MarketplaceResultitemdetails> {
  double _imageHeight = 0.0;

  final String friend = 'assets/images/accountingtextbook.png';
  @override
  void initState() {
    super.initState();
    _calculateImageHeight();
  }

  Future<void> _calculateImageHeight() async {
    final image = AssetImage(friend);
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
      body:
          Consumer<MarketplacehomeViewmodel>(builder: (context, model, child) {
        return MarketPlaceContainer(
          child: Stack(
            children: [
              ItemdetailImagecontainer(
                imageHeight: _imageHeight,
                image: accountingtextbook,
              ),
              WhiteContainer(
                  topPadding: 225.h,
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 12.h),
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 25.w),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                workSans16Text(text: "Accounting A Textbook"),
                                CircleContainer(
                                  height: 32.h,
                                  width: 32.w,
                                  color:
                                      const Color(0xFF999999).withOpacity(0.15),
                                  child: GestureDetector(
                                    onTap: () {
                                      model.toggleTopItemResultBookmark(
                                          widget.index);
                                    },
                                    child: Center(
                                        child: !model.isResultBookmarkedList[
                                                widget.index]
                                            ? Image.asset(
                                                width: 15.73.w,
                                                height: 13.h,
                                                color: const Color(0xFFFF0066),
                                                heart,
                                              )
                                            : Icon(
                                                Icons.favorite_rounded,
                                                color: Colors.red,
                                                size: 15.sp,
                                              )),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 15.h),
                          Divider(
                            color: const Color(0xFFE9E9E9),
                            height: 0.h,
                          ),
                          SizedBox(height: 12.h),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 25.w),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(right: 5.w),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      workSansText(
                                          text: "R 200",
                                          fontSize: 18.sp,
                                          color: textColor,
                                          fontWeight: FontWeight.w600),
                                      Image.asset(
                                        share2,
                                        width: 18.w,
                                        height: 20.h,
                                        color: const Color(0xFF7137C8),
                                      )
                                    ],
                                  ),
                                ),
                                SizedBox(height: 11.h),
                                Row(
                                  children: [
                                    Image.asset(
                                      locationoutlined,
                                      width: 10.27.w,
                                      height: 14.h,
                                    ),
                                    SizedBox(width: 5.w),
                                    workSansText(
                                        text: "UJ APK",
                                        color: textColor.withOpacity(0.7)),
                                  ],
                                ),
                                SizedBox(height: 14.h),
                                workSansText(
                                    text: "Condition: Used",
                                    color: textColor.withOpacity(0.7)),
                                SizedBox(height: 20.h),
                                workSansText(
                                    text: "Description",
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w500,
                                    color: textColor),
                                SizedBox(height: 13.53.h),
                                DescriptionContainer(
                                  title:  "Description",
                                  description: text,),
                                SizedBox(height: 20.53.h),
                              ],
                            ),
                          ),
                          const Divider(
                            color: Color(0xFFE9E9E9),
                          ),
                          SizedBox(height: 15.53.h),
                          Align(
                            alignment: Alignment.center,
                            child: workSansText(
                                text: "Sold by: Stephen Curry",
                                fontSize: 18.sp,
                                fontWeight: FontWeight.w600,
                                color: textColor),
                          ),
                          SizedBox(height: 20.h),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 40.w),
                            child: AppButton(
                              onTap: () {},
                              text: "Message Seller",
                              buttonColor: const Color(0xFF3771C8),
                            ),
                          ),
                          SizedBox(height: 20.53.h),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 40.w),
                            child: AppButton(
                              onTap: () {},
                              text: "Report Listing",
                              buttonColor: const Color(0xFFFF1371),
                            ),
                          ),
                          SizedBox(height: 20.53.h),
                          const Divider(
                            color: Color(0xFFE9E9E9),
                          ),
                          SizedBox(height: 20.53.h),
                        ],
                      ),
                    ),
                  ))
            ],
          ),
        );
      }),
    );
  }
}

String text =
    "Lorem ipsum dolor sit am onse ctetur adipiscing el Donec et elit vitae leo sollicit facilisis. Vestibulum ante ipsum primis in faucibus orci luctus eultrices pos uere cubilia curae; Phasellus placerat";
