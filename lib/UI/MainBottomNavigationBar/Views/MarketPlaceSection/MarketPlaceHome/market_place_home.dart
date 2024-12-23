import 'package:findly/Constant/assets_constant.dart';
import 'package:findly/Constant/colors.dart';
import 'package:findly/Constant/text_constant.dart';
import 'package:findly/Core/Custom/app_button.dart';
import 'package:findly/Core/Custom/container_widget.dart';
import 'package:findly/Core/Custom/custom_drop_down.dart';
import 'package:findly/UI/Auth/Widgets/custom_auth_appbar.dart';
import 'package:findly/UI/Auth/logInScreen/log_in_screen.dart';
import 'package:findly/UI/MainBottomNavigationBar/Views/Home/widgets/home_search_field.dart';
import 'package:findly/UI/MainBottomNavigationBar/Views/MarketPlaceSection/MarketPlaceHome/Widgets/marketplace_categories.dart';
import 'package:findly/UI/MainBottomNavigationBar/Views/MarketPlaceSection/MarketPlaceHome/Widgets/marketplace_topitem_gridview.dart';
import 'package:findly/UI/MainBottomNavigationBar/Views/MarketPlaceSection/MarketPlaceHome/marketplacehome_viewmodel.dart';
import 'package:findly/UI/MainBottomNavigationBar/Views/MarketPlaceSection/MarketPlaceItemDetails/marketplace_itemdetails.dart';
import 'package:findly/UI/MainBottomNavigationBar/Views/MarketPlaceSection/MarketPlaceSearchResult/marketplace_searchresult.dart';
import 'package:findly/UI/MainBottomNavigationBar/Views/MarketPlaceSection/SellItem/marketplace_sellitem.dart';
import 'package:findly/UI/MainBottomNavigationBar/bottomshett_viewmodel.dart';
// ... other imports remain unchanged
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/route_manager.dart';
import 'package:provider/provider.dart';

class MarketPlaceHome extends StatefulWidget {
  const MarketPlaceHome({super.key});

  @override
  _MarketPlaceHomeState createState() => _MarketPlaceHomeState();
}

class _MarketPlaceHomeState extends State<MarketPlaceHome> {
  final TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    // Call the fetchMarketplaceItems method when the screen is opened
    Future.microtask(() {
      final marketplaceHomeViewmodel =
          Provider.of<MarketplacehomeViewmodel>(context, listen: false);
      marketplaceHomeViewmodel.fetchMarketplaceItems();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer2<MarketplacehomeViewmodel, BottomshettViewmodel>(
          builder: (context, model, bottomModel, child) {
        return MarketPlaceContainer(
          child: Stack(
            children: [
              MarketplaceAppBar(
                leftpadding: 20.w,
                text: "Marketplace",
                width: 20.w,

              ),
              WhiteContainer(
                topPadding: 100.h,
                height: 100.sh,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox(height: 30.h),
                    // Padding(
                    //   padding: EdgeInsets.only(left: 25.w, top: 35.h),
                    //   child: MarketPlaceHomeDropDown(
                    //       hinttext: "Uj Doornfontein", onChanged: (val) {}),
                    // ),
                    SizedBox(height: 40.h),
                    // const Divider(
                    //   color: Color(0xFFE9E8E8),
                    //   thickness: 0.5,
                    //   height: 0,
                    // ),
                    Flexible(
                      fit: FlexFit.loose,
                      child: SingleChildScrollView(
                        padding: EdgeInsets.only(top: 18.h, left: 10.w),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // workSans16Text(text: "Categories"),
                            // SizedBox(height: 12.h),
                            // Padding(
                            //   padding: EdgeInsets.only(right: 25.w),
                            //   child: SingleChildScrollView(
                            //     scrollDirection: Axis.horizontal,
                            //     child: Row(
                            //       children: List.generate(
                            //         marketPlaceCategoryList.length,
                            //         (index) {
                            //           MarketplaceCategoryModel data =
                            //               marketPlaceCategoryList[index];
                            //           return Padding(
                            //             padding: EdgeInsets.only(
                            //                 right: index == 0 ? 15.w : 10.w),
                            //             child: MarketplaceCategories(
                            //               isSelected: data.isSelected!,
                            //               text: data.title!,
                            //               image: data.icon!,
                            //               textWidth: data.textWidth!,
                            //               height: data.height!.h,
                            //               width: data.width!.w,
                            //               onTap: () {
                            //                 model.onCategoryChanged(index);
                            //               },
                            //             ),
                            //           );
                            //         },
                            //       ),
                            //     ),
                            //   ),
                            // ),
                            // SizedBox(height: 25.h),
                            // Padding(
                            //   padding: EdgeInsets.only(right: 25.w),
                            //   child: Row(
                            //     mainAxisAlignment:
                            //         MainAxisAlignment.spaceBetween,
                            //     children: [
                            //       // workSans16Text(text: "Top Items"),
                            //       GestureDetector(
                            //         onTap: () {
                            //           // Navigate to full item list
                            //         },
                            //         child: workSansText(
                            //           text: "See All",
                            //           color: secondaryColor,
                            //           fontSize: 12.sp,
                            //           fontWeight: FontWeight.w500,
                            //         ),
                            //       )
                            //     ],
                            //   ),
                            // ),
                            // SizedBox(height: 15.h),
                            Flexible(
                              fit: FlexFit.loose,
                              child: Consumer<MarketplacehomeViewmodel>(
                                builder: (context, model, child) {
                                  // Show loading indicator when fetching items
                                  if (model.loading) {
                                    return const Center(
                                      child: CircularProgressIndicator(),
                                    );
                                  }

                                  // Show a message if there are no items to display
                                  if (model.marketplaceItems.isEmpty) {
                                    return const Center(
                                      child: Text("No items available"),
                                    );
                                  }

                                  // Use GridView.builder to display the fetched items
                                  return GridView.builder(
                                    physics:
                                        const NeverScrollableScrollPhysics(),
                                    padding: EdgeInsets.only(
                                        bottom: 25.h, right: 10.w),
                                    itemCount: model.marketplaceItems.length,
                                    shrinkWrap: true,
                                    gridDelegate:
                                        const SliverGridDelegateWithFixedCrossAxisCount(
                                            crossAxisCount:
                                                2, // Set to 1 to increase size
                                            crossAxisSpacing:
                                                5, // Space between columns
                                            mainAxisSpacing: 10,
                                            childAspectRatio:
                                                0.80 // Space between rows
                                            ),
                                    itemBuilder: (context, index) {
                                      final product =
                                          model.marketplaceItems[index];

                                      return MarketPlaceTopItemGridView(
                                        onTap: () {
                                          Get.to(MarketplaceItemdetails(
                                            index: index,
                                            isBookMarked: false,
                                                // model.isBookmarkedList[0],
                                            product: product,
                                          ));
                                        },
                                        isBookmarked: false, //model.isBookmarkedList[0], // Fixed here
                                        onBookMarkTap: () {
                                          if (bottomModel.email != null) {
                                            model.toggleBookmark(
                                                index); // Pass index instead of hardcoding
                                          } else {
                                            Get.to(LogInScreen(
                                                isFrombottomSheet: true));
                                          }
                                        },
                                        product:
                                            product, // Pass the product here
                                      );
                                    },
                                  );
                                },
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Positioned(
                top: 114.h,
                child: SizedBox(
                  width: 1.sw,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 0.w),
                    child: HomeSearchField(
                      hintText: "What can we help you find?",
                      searchController: searchController,
                      onChanged: (val) {
                        model.setSearch(val);
                      },
                      onSuffixIconTap: () {
                         model.fetchMarketplaceItems();
                      },
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      }),
      floatingActionButton: MapButton(
        height: 50.h,
        buttonColor: const Color(0xFFFF6600),
        icon: sell,
        text: "Sell",
        onTap: () {
          Get.to(MarketplaceSellitem());
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
