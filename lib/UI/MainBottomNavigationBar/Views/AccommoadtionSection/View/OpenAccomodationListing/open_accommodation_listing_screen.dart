import 'dart:developer';

import 'package:findly/Constant/colors.dart';
import 'package:findly/Constant/enum.dart';
import 'package:findly/Constant/text_constant.dart';
import 'package:findly/Core/Custom/container_widget.dart';
import 'package:findly/UI/MainBottomNavigationBar/Views/Chats/chat_screen.dart';
import 'package:findly/UI/MainBottomNavigationBar/Views/Chats/chat_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import '../../../../../../Models/AccommodationModels/accommodation_model.dart';
import '../../../../bottomshett_viewmodel.dart';
import '../AccommodationHome/accomodation_viewmodel.dart';
import 'Widgets/ammenities_footer_widget.dart';
import 'Widgets/description_widgets.dart';
import 'Widgets/heading_widgets.dart';
import 'Widgets/image_widget.dart';

class OpenAccommodationListingScreen extends StatelessWidget {
  const OpenAccommodationListingScreen(
      {super.key,
      required this.accommodationModel,
      required this.index,
      required this.isBookmarked});

  final AccommodationModel accommodationModel;
  final bool isBookmarked;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: whiteColor,
        body: Stack(
          children: [
            Consumer<AccommodationViewmodel>(builder: (context, model, child) {
              return ImageContainerWidget(
                  accommodationModel: accommodationModel,
                  onBookMarkTap: () {
                    model.toggleBookmark(index);
                  },
                  onNextTap: () {},
                  isBookMarked: false //model.isBookmarkedList[0],
                  );
            }),
            WhiteContainer(
                topPadding: 218.h,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    HeaderWidget(
                      accommodationModel: accommodationModel,
                    ),
                    SizedBox(height: 15.h),
                    const Divider(color: Color(0XFFE9E8E8)),
                    // SizedBox(height: 22.h),
                    Flexible(
                      child: SingleChildScrollView(
                        padding: EdgeInsets.only(top: 22.h),
                        physics: const AlwaysScrollableScrollPhysics(),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ShareWidget(
                              accommodationModel: accommodationModel,
                            ),
                            SizedBox(height: 10.h),
                            LocationWidget(
                                accommodationModel: accommodationModel),
                            SizedBox(height: 10.h),
                            Padding(
                              padding: EdgeInsets.only(left: 25.w),
                              child: Text.rich(
                                TextSpan(
                                    text: 'From ',
                                    style: workSansTextStyle(),
                                    children: <InlineSpan>[
                                      TextSpan(
                                          text: 'R${accommodationModel.price!}',
                                          style: workSansTextStyle(
                                              fontWeight: FontWeight.bold),
                                          children: [
                                            TextSpan(
                                              text: '/Month',
                                              style: workSansTextStyle(),
                                            ),
                                          ])
                                    ]),
                              ),
                            ),
                            SizedBox(height: 14.h),
                            DescriptionHeadingWidget(
                                accommodationModel: accommodationModel),
                            SizedBox(height: 13.h),
                            Container(
                              margin: EdgeInsets.symmetric(horizontal: 20.w),
                              child: DescriptionContainer(
                                  title: "Description",
                                  description:
                                      accommodationModel.description ?? ''),
                            ),
                            SizedBox(height: 20.h),
                            const Divider(color: Color(0XFFE9E8E8)),
                            SizedBox(height: 13.h),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 25.w),
                              child: workSansText(
                                text: "Categories",
                                fontWeight: FontWeight.w500,
                                fontSize: 14.sp,
                                color: textColor,
                              ),
                            ),
                            SizedBox(height: 13.h),
                            Container(
                              width: 120,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                color: lightGreyColor.withOpacity(0.5),
                              ),
                              padding: const EdgeInsets.all(8),
                              margin: EdgeInsets.symmetric(horizontal: 25.w),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  workSansText(
                                    text: accommodationModel.category ?? '',
                                    fontWeight: FontWeight.w500,
                                    fontSize: 14.sp,
                                    color: textColor,
                                  ),
                                  const Icon(
                                    Icons.check_circle,
                                    color: blackColor,
                                    size: 20,
                                  )
                                ],
                              ),
                            ),
                            SizedBox(height: 13.h),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 25.w),
                              child: workSansText(
                                text: "Roomtypes",
                                fontWeight: FontWeight.w500,
                                fontSize: 14.sp,
                                color: textColor,
                              ),
                            ),
                            SizedBox(height: 13.h),
                            Container(
                              width: 120,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                color: lightGreyColor.withOpacity(0.5),
                              ),
                              padding: const EdgeInsets.all(8),
                              margin: EdgeInsets.symmetric(horizontal: 25.w),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  workSansText(
                                    text: accommodationModel.roomTypes ?? '',
                                    fontWeight: FontWeight.w500,
                                    fontSize: 14.sp,
                                    color: textColor,
                                  ),
                                  const Icon(
                                    Icons.check_circle,
                                    color: blackColor,
                                    size: 20,
                                  )
                                ],
                              ),
                            ),
                            SizedBox(height: 13.h),
                            const Divider(color: Color(0XFFE9E8E8)),
                            SizedBox(height: 12.h),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 25.w),
                              child: workSansText(
                                text: "Amenities",
                                fontWeight: FontWeight.w500,
                                fontSize: 14.sp,
                                color: textColor,
                              ),
                            ),
                            Builder(builder: (context) {
                              return Consumer<AccommodationViewmodel>(
                                  builder: (context, model, child) {
                                model.createAmenitiesList(
                                    accommodationModel.amenities ?? []);
                                return ListView.builder(
                                    shrinkWrap: true,
                                    physics:
                                        const NeverScrollableScrollPhysics(),
                                    itemCount: model.showAllAmmenities
                                        ? accommodationModel.amenities.length
                                        // check to make sure the list
                                        // length is not less than 3
                                        : accommodationModel.amenities.length >
                                                3
                                            ? 3
                                            : accommodationModel
                                                .amenities.length,
                                    padding: EdgeInsets.only(top: 17.h),
                                    itemBuilder: (context, index) {
                                      AmmenitiesWidget currentAmenity =
                                          model.amenitiesList[index];
                                      return Padding(
                                        padding: EdgeInsets.only(bottom: 15.h),
                                        child: AmmenitiesWidget(
                                          image: currentAmenity.image,
                                          imageHeight:
                                              currentAmenity.imageHeight,
                                          imageWidth: currentAmenity.imageWidth,
                                          text: currentAmenity.text,
                                          seeAllText: model
                                              .seeAllAndSeeLessString(index),
                                          isSeeAll:
                                              model.isSellAndSeeLessShow(index),
                                          onSeeAllTap: () {
                                            model.toggleShowAllAmmenities();
                                          },
                                        ),
                                      );
                                    });
                              });
                            }),
                            const Divider(color: Color(0XFFE9E8E8)),
                            SizedBox(height: 12.h),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 25.w),
                              child: GestureDetector(
                                onTap: () {
                                  // sendUserMessage(
                                  //   context
                                  //       .read<BottomshettViewmodel>()
                                  //       .user
                                  //       .id!,
                                  //   accommodationModel.id!,
                                  //   accommodationModel,
                                  // );
                                  log('currentUSer ID : ${context.read<BottomshettViewmodel>().user.id!}');
                                  log('otherUSer ID : ${accommodationModel.user!.id}'); 

                                  context
                                      .read<ChatViewmodel>()
                                      .setChatRequirements(
                                        context
                                            .read<BottomshettViewmodel>()
                                            .user
                                            .id!,
                                        accommodationModel.user!.id,
                                        accommodationModel,
                                      );

                                  Get.to(
                                    ChatScreen(
                                      serviceType: ServiceType.accommodation,
                                    ),
                                  );
                                },
                                child: Container(
                                  height: 53.h,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12),
                                    // Adjust for rounded corners
                                    gradient: const LinearGradient(
                                      colors: [
                                        Color(0xFFFF512F),
                                        Color(0xFFFF8C00)
                                      ], // Gradient colors
                                      begin: Alignment.centerLeft,
                                      end: Alignment.centerRight,
                                    ),
                                  ),
                                  child: const Center(
                                    child: Text(
                                      'Send Message', //`}',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(height: 25.h),
                          ],
                        ),
                      ),
                    )
                  ],
                ))
          ],
        ));
  }
}
