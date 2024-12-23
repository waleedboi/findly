import 'package:findly/Constant/text_constant.dart';
import 'package:findly/Core/Custom/circular_progress.dart';
import 'package:findly/Core/Custom/container_widget.dart';
import 'package:findly/Models/AccommodationModels/get_user_accommodation.dart';
import 'package:findly/UI/Auth/Widgets/custom_auth_appbar.dart';
import 'package:findly/UI/MainBottomNavigationBar/Views/Profile/View/MyListing/EditAccommadtion/edit_accommodation_page.dart';
import 'package:findly/UI/MainBottomNavigationBar/Views/Profile/View/MyListing/my_listing_viewmodel.dart';
import 'package:findly/UI/MainBottomNavigationBar/Views/Profile/View/MyListing/widgets/listing_accommodation_widget.dart';
import 'package:findly/UI/MainBottomNavigationBar/Views/Profile/View/MyListing/widgets/listing_delete_popup.dart';
import 'package:findly/UI/utils/loader_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import '../../../../../../Constant/colors.dart';
import '../../../Home/widgets/home_search_field.dart';

class MyListingScreen extends StatelessWidget {
  const MyListingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Provider.of<MyListingViewmodel>(context, listen: false).init();

    return Scaffold(
      body: Consumer<MyListingViewmodel>(builder: (context, model, child) {
        return BlueContainer(
          child: Stack(
            fit: StackFit.loose,
            children: [
              Positioned(
                top: 62.h,
                child: SizedBox(
                  width: 1.sw,
                  child: const CustomAuthAppBar(text: "My Listings"),
                ),
              ),
              WhiteContainer(
                topPadding: 140.h,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 27.w),
                  child: SizedBox(
                    width: 1.sw,
                    height: 0.87.sh,
                    child: model.loading
                        ? const KCircularProgress()
                        : Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              SizedBox(height: 52.h),
                              workSansText(
                                text: "Active Listings",
                                fontSize: 18.sp,
                                fontWeight: FontWeight.w500,
                                color: textColor,
                              ),
                              SizedBox(height: 15.h),
                              Flexible(
                                fit: FlexFit.loose,
                                child: ListView.builder(
                                  padding:
                                      EdgeInsets.symmetric(vertical: 24.h) +
                                          EdgeInsets.only(bottom: 50.h),
                                  itemCount: model.filteredAccommodation.length,
                                  shrinkWrap: true,
                                  itemBuilder: (context, index) {
                                    GetuserAccommodation data =
                                        model.filteredAccommodation[index];
                                    return Padding(
                                        padding: EdgeInsets.only(bottom: 20.h),
                                        child:
                                            //  data.serviceType ==
                                            //         ServiceType.accommodation
                                            //     ?
                                            ListingAccommodationWidget(
                                          data: data,
                                          index: index,
                                          onDelete: () {
                                            Get.dialog(ListingDeletePopup(
                                              onDelete: () async {
                                                LoadingIndicatorDialog().show(
                                                    context,
                                                    text: 'Deleting...');
                                               await model.deleteAccommodation(
                                                    data.id!, index);
                                                LoadingIndicatorDialog()
                                                    .dismiss();
                                                Get.back();
                                              },
                                            ));
                                          },
                                          onEdit: () {
                                            Get.to(
                                                EditAccommodation(data: data));
                                          },
                                        )
                                        // : data.serviceType ==
                                        //         ServiceType.marketplace
                                        //     ? ListingMarketplaceWidget(
                                        //         index: index,
                                        //         onDelete: () {
                                        //           Get.dialog(
                                        //               ListingDeletePopup(
                                        //             onDelete: () {
                                        //               model.onDelete(index);
                                        //               Get.back();
                                        //             },
                                        //           ));
                                        //         },
                                        //         onEdit: () {
                                        //           Get.to(
                                        //               MarketplaceSellitem());
                                        //         },
                                        //       )
                                        //     : data.serviceType ==
                                        //             ServiceType.photography
                                        //         ? ListingPhotographerWidget(
                                        //             index: index,
                                        //             onDelete: () {
                                        //               Get.dialog(
                                        //                   ListingDeletePopup(
                                        //                 onDelete: () {
                                        //                   model.onDelete(
                                        //                       index);
                                        //                   Get.back();
                                        //                 },
                                        //               ));
                                        //             },
                                        //             onEdit: () {
                                        //               Get.to(
                                        //                   AddPhotgraphygigScreen());
                                        //             },
                                        //           )
                                        //         : const SizedBox(),
                                        );
                                  },
                                ),
                              ),
                            ],
                          ),
                  ),
                ),
              ),
              Positioned(
                  top: 114.h,
                  child: SizedBox(
                    width: 1.sw,
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 27.w),
                      child: HomeSearchField(
                          onChanged: (val) {
                            model.filterAccommodations(val);
                          },
                          hintText: "Search",
                          searchController: model.searchController),
                    ),
                  )),
            ],
          ),
        );
      }),
    );
  }
}

// class ListingListview extends StatelessWidget {
//   const ListingListview({
//     super.key,
//     required this.image,
//     required this.location,
//     required this.price,
//     required this.rating,
//     required this.status,
//   });
//   final String image;
//   final String location;
//   final String price;
//   final String rating;
//   final String status;
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       height: 335.h,
//       // width: 158.w,
//       padding: EdgeInsets.only(top: 11.h, left: 11.w, right: 11.w),
//       decoration: BoxDecoration(
//         color: Colors.transparent,
//         borderRadius: BorderRadius.circular(12.r),
//         border: Border.all(
//           color: const Color(0xFFC6C5C5),
//         ),
//       ),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           ClipRRect(
//             borderRadius: BorderRadius.circular(9.38.r),
//             child: Stack(
//               alignment: Alignment.bottomLeft,
//               children: [
//                 Image.asset(
//                   image,
//                   height: 159.h,
//                   fit: BoxFit.cover,
//                   width: 307.w,
//                   // width: 135.w,
//                 ),
//                 Padding(
//                     padding: EdgeInsets.only(left: 13.w, bottom: 13.h),
//                     child: Column(
//                       children: [
//                         Container(
//                           height: 38.h,
//                           width: 123.w,
//                           decoration: BoxDecoration(
//                             color: whiteColor,
//                             borderRadius: BorderRadius.only(
//                               bottomRight: Radius.circular(20.r),
//                               topLeft: Radius.circular(20.r),
//                             ),
//                           ),
//                           child: Center(
//                             child: workSansText(
//                               text: "Unavailable",
//                               fontWeight: FontWeight.w500,
//                               fontSize: 17.9.sp,
//                               color: secondaryColor,
//                             ),
//                           ),
//                         ),
//                         SizedBox(height: 8.65.h),
//                         Container(
//                           height: 5.9.h,
//                           width: 109.w,
//                           color: secondaryColor,
//                         ),
//                       ],
//                     )),
//               ],
//             ),
//           ),
//           SizedBox(height: 15.h),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.start,
//             children: [
//               Icon(
//                 Icons.location_on_outlined,
//                 color: secondaryColor,
//                 size: 20.sp,
//               ),
//               // SizedBox(width: 4.w),
//               workSansText(
//                 text: location,
//                 fontWeight: FontWeight.w500,
//                 fontSize: 15.sp,
//                 color: textColor,
//               ),

//               const Spacer(),
//               Icon(Icons.star, color: yelloColor, size: 14.sp),
//               workSansText(
//                 text: rating,
//                 fontWeight: FontWeight.w500,
//                 fontSize: 12.sp,
//                 color: textColor,
//               ),
//             ],
//           ),
//           SizedBox(height: 5.h),
//           Padding(
//             padding: EdgeInsets.only(left: 5.w),
//             child: workSansText(
//               text: price,
//               fontWeight: FontWeight.w500,
//               fontSize: 14.sp,
//               color: textColor,
//             ),
//           ),
//           SizedBox(height: 5.h),
//           Padding(
//             padding: EdgeInsets.only(left: 5.w),
//             child: workSansText(
//               text: status,
//               fontWeight: FontWeight.w500,
//               fontSize: 14.sp,
//               color: secondaryColor,
//             ),
//           ),
//           SizedBox(height: 17.h),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               Expanded(
//                 flex: 1,
//                 child: HomeButton(
//                   borderRadius: 5.r,
//                   iconHeight: 11.h,
//                   iconWidth: 11.w,
//                   height: 33.h,
//                   fontSize: 12.sp,
//                   startPadding: 0,
//                   space: 6.w,
//                   text: "Edit",
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   fontWeight: FontWeight.w500,
//                   onTap: () {},
//                   icon: edit,
//                 ),
//               ),
//               SizedBox(width: 6.w),
//               Expanded(
//                 flex: 1,
//                 child: HomeButton(
//                   borderRadius: 5.r,
//                   iconHeight: 12.h,
//                   iconWidth: 12.w,
//                   height: 33.h,
//                   fontSize: 12.sp,
//                   startPadding: 0,
//                   space: 5.w,
//                   iconColor: whiteColor,
//                   buttonColor: secondaryColor,
//                   text: "Delete",
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   fontWeight: FontWeight.w500,
//                   onTap: () {},
//                   icon: trash,
//                 ),
//               ),
//               SizedBox(width: 6.w),
//               SizedBox(
//                 width: 115.w,
//                 child: AppButton(
//                   borderRadius: 5.r,
//                   height: 33.h,
//                   fontSize: 12.sp,
//                   text: "Mark as Available",
//                   textColor: secondaryColor,
//                   buttonColor: secondaryColor.withOpacity(0.1),
//                   onTap: () {},
//                 ),
//               ),
//             ],
//           )
//         ],
//       ),
//     );
//   }
// }
