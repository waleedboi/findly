import 'dart:convert';

import 'package:findly/Constant/colors.dart';
import 'package:findly/Constant/text_constant.dart';
import 'package:findly/Core/Custom/container_widget.dart';
import 'package:findly/Core/Custom/custom_drop_down.dart';
import 'package:findly/UI/Auth/Widgets/custom_auth_appbar.dart';
import 'package:findly/UI/MainBottomNavigationBar/Views/AccommoadtionSection/View/AccommodationHome/AccomodationModel/accomodation_api_model.dart';
import 'package:findly/UI/MainBottomNavigationBar/Views/AccommoadtionSection/View/AccommodationHome/accomodation_viewmodel.dart';
import 'package:findly/UI/MainBottomNavigationBar/Views/AccommoadtionSection/View/AccommodationHome/widgets/accommodation_listview.dart';
import 'package:findly/UI/MainBottomNavigationBar/Views/AccommoadtionSection/View/OpenAccomodationListing/open_accommodation_listing_screen.dart';
import 'package:findly/UI/MainBottomNavigationBar/Views/Home/widgets/home_category_heading.dart';
import 'package:findly/UI/utils/loader_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/route_manager.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

import '../../../../../../Models/AccommodationModels/accommodation_model.dart';

class AccomodationScreen extends StatefulWidget {
  const AccomodationScreen({super.key});

  @override
  State<AccomodationScreen> createState() => _AccomodationScreenState();
}

class _AccomodationScreenState extends State<AccomodationScreen> {
  final TextEditingController searchController = TextEditingController();
  final String baseUrl =
      'https://findly-kappa.vercel.app/api/public/accommodations?page=1&limit=100';

  Future<List<Accommodation>> fetchAccommodations(
    AccommodationViewmodel model,
    String? location,
  ) async {
    http.Response response;
    String category =
        (model.selectedCategory != null && model.selectedCategory != 'All')
            ? model.selectedCategory!
            : '';
    String location =
        (model.selectedLocation != null && model.selectedLocation != 'All')
            ? model.selectedLocation!
            : '';

    String queryParams = '';
    if (category.isNotEmpty) {
      queryParams += '&category=$category';
    }
    if (location.isNotEmpty) {
      queryParams += '&location=$location';
    }

    response = await http.get(Uri.parse('$baseUrl$queryParams'));
    if (response.statusCode == 200) {
      final data = AccommodationResponse.fromJson(jsonDecode(response.body));
      return data
          .data.accommodations; // Extract accommodations from the response
    } else {
      throw Exception('Failed to load accommodations');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DeepBlueContainer(
        child: Consumer<AccommodationViewmodel>(
          builder: (context, model, child) {
            return Stack(
              children: [
                CustomAuthAppBar2(
                  text: "Accommodations",
                  leftpadding: 25.w,
                  width: 40.w,
                ),
                WhiteContainer(
                  topPadding: 138.h,
                  height: 1.sh,
                  child: FutureBuilder<List<Accommodation>>(
                    future: fetchAccommodations(model, null),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const Center(child: CircularProgressIndicator());
                      } else if (snapshot.hasError) {
                        return Center(child: Text('Error: ${snapshot.error}'));
                      }

                      // Get the fetched accommodations
                      List<Accommodation> accommodations = snapshot.data!;

                      return SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            SizedBox(height: 59.h),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 28.w),
                              child: workSansText(
                                text: "Categories",
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w500,
                                color: textColor,
                              ),
                            ),
                            SizedBox(height: 14.h),
                            SizedBox(
                              width: 1.sw,
                              height: 96.h,
                              child: Padding(
                                padding: EdgeInsets.symmetric(horizontal: 28.h),
                                child: ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  physics: const NeverScrollableScrollPhysics(),
                                  padding: EdgeInsets.zero,
                                  itemCount: categories.length,
                                  itemBuilder: (context, index) {
                                    return Padding(
                                      padding: EdgeInsets.only(right: 19.3.w),
                                      child: HomeCategoryHeadings(
                                        isSelected:
                                            categories[index].isSelected ??
                                                false,
                                        image: categories[index].image!,
                                        text: categories[index].text!,
                                        height: categories[index].height!,
                                        width: categories[index].width!,
                                        onTap: () {
                                          model.onCategoryChanged(index);
                                        },
                                      ),
                                    );
                                  },
                                ),
                              ),
                            ),
                            SizedBox(height: 22.h),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 28.w),
                              child: workSansText(
                                text: "${accommodations.length} Results",
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w500,
                                color: textColor,
                              ),
                            ),
                            SizedBox(height: 25.h),
                            accommodations.isEmpty
                                ? const Center(
                                    child: Text('No accommodations found.'))
                                : ListView.builder(
                                    physics:
                                        const NeverScrollableScrollPhysics(),
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 28.w),
                                    shrinkWrap: true,
                                    itemCount: accommodations.length,
                                    itemBuilder: (context, index) {
                                      if (index >= accommodations.length) {
                                        return const SizedBox.shrink();
                                      }
                                      Accommodation d = accommodations[index];
                                      String image = d.images.isNotEmpty
                                          ? d.images[0]
                                          : 'assets/images/friend.png';

                                      return Padding(
                                        padding: EdgeInsets.only(bottom: 18.h),
                                        child: AccommodationListing(
                                          onTap: () {
                                            Get.to(() =>
                                                OpenAccommodationListingScreen(
                                                  index: index,
                                                  accommodationModel:
                                                      AccommodationModel(
                                                          id: d.id,
                                                          user: d.user,
                                                          reference:
                                                              d.reference,
                                                          images: d.images,
                                                          description:
                                                              d.description,
                                                          location: d.location,
                                                          price: d.price
                                                              .toString(),
                                                          rating: '4.5',
                                                          category: d.category,
                                                          roomTypes:
                                                              d.roomTypes,
                                                          status:
                                                              d.availability,
                                                          isFemale:
                                                              d.tenantType ==
                                                                  'Female only',
                                                          isMale:
                                                              d.tenantType ==
                                                                  'Male only',
                                                          isUnix:
                                                              d.tenantType ==
                                                                  'Unisex',
                                                          isBookmarked: false,
                                                          /*model
                                                                  .isBookmarkedList[
                                                              0],*/
                                                          isRated: d.isActive,
                                                          title: d.title,
                                                          amenities:
                                                              d.amenities,
                                                          isAvailable:
                                                              d.availability ==
                                                                  'Available'),
                                                  isBookmarked: false,
                                                  // model.isBookmarkedList[0],
                                                ));
                                          },
                                          image: image,
                                          // Adjusted for the first image
                                          location: d.location,
                                          price: d.price.toString(),
                                          rating: '4.5',
                                          // Adjust as needed
                                          status: d.availability,

                                          isFemale:
                                              d.tenantType == 'Female only',
                                          isMale: d.tenantType == 'Male only',
                                          isUnix: d.tenantType == 'Unisex',
                                          isBookmarked: false,
                                          // model.isBookmarkedList[0],
                                          isRated: d.isActive,
                                          onBookMarkTap: () {
                                            model.toggleBookmark(0);
                                          },
                                        ),
                                      );
                                    },
                                  )
                          ],
                        ),
                      );
                    },
                  ),
                ),
                Positioned(
                  top: 115.h,
                  child: SizedBox(
                    width: 1.sw,
                    child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 27.w),
                        child: AccommodationLocationCustomDropDown(
                          hintText: 'Select Campus Area Location',
                          onChanged: (String? newValue) async {
                            model.onLocationChanged(newValue);
                          },
                        )),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
