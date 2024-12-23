// ignore_for_file: must_be_immutable

import 'dart:async';

import 'package:findly/Constant/assets_constant.dart';
import 'package:findly/Constant/enum.dart';
import 'package:findly/Constant/text_constant.dart';
import 'package:findly/Core/Custom/container_widget.dart';
import 'package:findly/Models/marketplace_item_model.dart';
import 'package:findly/UI/Auth/Widgets/custom_auth_appbar.dart';
import 'package:findly/UI/MainBottomNavigationBar/Views/AccommoadtionSection/View/OpenAccomodationListing/Widgets/description_widgets.dart';
import 'package:findly/UI/MainBottomNavigationBar/Views/Chats/chat_screen.dart';
import 'package:findly/UI/MainBottomNavigationBar/Views/MarketPlaceSection/MarketPlaceItemDetails/widgets/itemdetail_imagecontainer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/route_manager.dart';
import 'package:provider/provider.dart';

import '../../../../../Constant/colors.dart';
import '../../../../../Core/Custom/app_button.dart';
import '../MarketPlaceHome/marketplacehome_viewmodel.dart';

class MarketplaceItemdetails extends StatefulWidget {
  final ProductListingModel? product; // Make product nullable
  MarketplaceItemdetails(
      {super.key,
      required this.isBookMarked,
      required this.index,
      this.product}); // product can be null
  final bool isBookMarked;
  int index = 0;

  @override
  State<MarketplaceItemdetails> createState() => _MarketplaceItemdetailsState();
}

class _MarketplaceItemdetailsState extends State<MarketplaceItemdetails> {
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
              if (widget.product?.images != null &&
                  widget.product!.images!
                      .isNotEmpty) // Check if product and images are not null
                ItemdetailImagecontainer(
                  imageHeight: _imageHeight,
                  image: widget.product!.images![0], // Use null-safe operator
                  showViewGalleryButton: false,
                ),
              Positioned(
                top: 40,
                right: 20,
                child: GestureDetector(
                  onTap: () {
                    model.toggleBookmark(0);
                  },
                  child: CircleContainer(
                    height: 32.h,
                    width: 32.w,
                    color: const Color(0xFFFFFFFF),
                    child: Center(
                        child: !false //model.isBookmarkedList[0]
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
                                Expanded(
                                  child: workSans16Text(
                                      text: widget.product?.title ?? "No Title",
                                      fontSize: 22.sp,
                                      fontWeight: FontWeight.w600),
                                ),
                                SizedBox(width: 5.w),
                                workSansText(
                                    text: "\R${widget.product?.price ?? 'N/A'}",
                                    fontSize: 22.sp,
                                    color: textColor,
                                    fontWeight: FontWeight.w600),
                              ],
                            ),
                          ),
                          SizedBox(height: 10.h),
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
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        Image.asset(
                                          locationIcon,
                                          width: 10.27.w,
                                          height: 14.h,
                                          color: Colors.black,
                                        ),
                                        SizedBox(width: 5.w),
                                        workSansText(
                                            text: widget.product?.place ??
                                                'No Location', // Default value
                                            fontWeight: FontWeight.w500,
                                            color: textColor),
                                      ],
                                    ),
                                    Container(
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 12.0,
                                        vertical: 6.0,
                                      ),
                                      decoration: BoxDecoration(
                                        color: lightGreyColor.withOpacity(0.3),
                                        borderRadius:
                                            BorderRadius.circular(30.r),
                                      ),
                                      child: workSansText(
                                          text: widget.product?.condition ??
                                              'No Condition', // Default value
                                          color: textColor.withOpacity(0.7)),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 14.h),
                                DescriptionContainer(
                                  title: "Description",
                                  description:
                                      widget.product?.description ?? '',
                                ),
                                SizedBox(height: 20.53.h),
                              ],
                            ),
                          ),
                          SizedBox(height: 100.53.h),
                          const Divider(
                            color: Color(0xFFE9E9E9),
                          ),
                          SizedBox(height: 15.53.h),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 40.w),
                            child: AppButton(
                              onTap: () {
                                Get.to(ChatScreen(
                                  serviceType: ServiceType.marketplace,
                                ));
                              },
                              text: "Message Seller",
                              linearGradient: const LinearGradient(
                                colors: [
                                  Color(0xFFFF512F),
                                  Color(0xFFFF8C00)
                                ], // Gradient colors
                                begin: Alignment.centerLeft,
                                end: Alignment.centerRight,
                              ),
                            ),
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
