import 'dart:convert';
import 'dart:developer';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:findly/Constant/assets_constant.dart';
import 'package:findly/Constant/colors.dart';
import 'package:findly/Constant/text_constant.dart';
import 'package:findly/Core/Custom/container_widget.dart';
import 'package:findly/Core/controllers/main_controller.dart';
import 'package:findly/UI/Auth/logInScreen/log_in_screen.dart';
import 'package:findly/UI/MainBottomNavigationBar/Views/AccommoadtionSection/View/AccommodationHome/AccomodationModel/accomodation_api_model.dart';
import 'package:findly/UI/MainBottomNavigationBar/Views/AccommoadtionSection/View/AccommodationHome/accomodation_screen.dart';
import 'package:findly/UI/MainBottomNavigationBar/Views/Home/home_screen_viewmodel.dart';
import 'package:findly/UI/MainBottomNavigationBar/Views/MarketPlaceSection/MarketPlaceHome/market_place_home.dart';
import 'package:findly/UI/MainBottomNavigationBar/bottomshett_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/route_manager.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

import '../../../../Models/AccommodationModels/accommodation_model.dart';
import '../AccommoadtionSection/View/OpenAccomodationListing/open_accommodation_listing_screen.dart';
import '../AccommoadtionSection/widgets/accommodation_listview.dart';
import '../GraduationPhtographySection/GraduationPhotoGraphyHome/graduationphotography_home.dart';
import 'widgets/home_appbar.dart';
import 'widgets/home_category_heading.dart';
import 'widgets/home_search_field.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController searchController = TextEditingController();
  final String baseUrl =
      'https://findly-kappa.vercel.app/api/public/accommodations?page=1&limit=100';
  List<Accommodation> _accommodations = [];
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () {
      if (mounted) fetchAccommodations();
    });
  }

  Future<void> fetchAccommodations() async {
    try {
      final response = await http.get(Uri.parse(baseUrl));
      if (response.statusCode == 200) {
        final data = AccommodationResponse.fromJson(jsonDecode(response.body));
        log('Accommodation ${response.body}');
        MainController.to.accommodationListModel = data.data;
        MainController.to.update();
        setState(() {
          _accommodations = data.data.accommodations; // Set accommodations data
          _isLoading = false; // Set loading to false to indicate data is ready
        });
      } else {
        throw Exception('Failed to load accommodations');
      }
    } catch (error) {
      if (mounted)
        setState(() {
          _isLoading = false; // Stop loading even if there is an error
        });
      print("Error fetching accommodations: $error");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<BottomshettViewmodel>(builder: (context, model, child) {
      return Scaffold(
        body: BlueContainer(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(height: 40.h),
              HomeAppBar(model: model),
              Expanded(
                child: SingleChildScrollView(
                  child: Stack(
                    children: [
                      WhiteContainer(
                        topPadding: 50.h,
                        child: Container(
                          color: whiteColor,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(height: 52.h),
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 25.w),
                                child: workSansText(
                                  text: "Categories",
                                  fontWeight: FontWeight.w500,
                                  fontSize: 16.sp,
                                  color: const Color(0Xff1E1E1E),
                                ),
                              ),
                              SizedBox(height: 13.h),
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 15.w),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    HomeCategoryHeadings(
                                      text: "Campus Marketplace",
                                      image: marketplace,
                                      height: 33.h,
                                      width: 34.w,
                                      textWidth: 91.w,
                                      onTap: () {
                                        Get.to(() => MarketPlaceHome());
                                      },
                                    ),
                                    HomeCategoryHeadings(
                                      text: "Student Accommodations",
                                      image: accomodation,
                                      height: 23.h,
                                      width: 44.w,
                                      textWidth: 91.w,
                                      onTap: () {
                                        if (model.email != null) {
                                          Get.to(() => AccomodationScreen());
                                        } else {
                                          Get.to(LogInScreen(
                                              isFrombottomSheet: true));
                                        }
                                      },
                                    ),
                                    HomeCategoryHeadings(
                                      text: "Graduation Photographers",
                                      image: camera,
                                      height: 32.h,
                                      width: 36.w,
                                      textWidth: 91.w,
                                      onTap: () {
                                        if (model.email != null) {
                                          Get.to(() =>
                                              GraduationphotographyHome());
                                        } else {
                                          Get.to(LogInScreen(
                                              isFrombottomSheet: true));
                                        }
                                      },
                                    ),
                                    SizedBox(width: 50.w),
                                  ],
                                ),
                              ),
                              SizedBox(height: 31.h),
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 25.w),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    workSansText(
                                      text: "Popular Accommodations",
                                      fontWeight: FontWeight.w500,
                                      fontSize: 16.sp,
                                      color: textColor,
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        if (model.email != null) {
                                          Get.to(
                                              () => const AccomodationScreen());
                                        } else {
                                          Get.to(LogInScreen(
                                              isFrombottomSheet: true));
                                        }
                                      },
                                      child: workSansText(
                                        text: "See All",
                                        fontWeight: FontWeight.w500,
                                        fontSize: 12.sp,
                                        color: const Color(0xFFFF2A7F),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(height: 16.h),
                              Consumer<HomeScreenViewmodel>(
                                  builder: (context, homemodel, index) {
                                return Padding(
                                    padding: EdgeInsets.only(left: 25.w),
                                    child: SizedBox(
                                      height: 185.h,
                                      child: SizedBox(
                                        height: 185.h,
                                        child: _isLoading
                                            ? Center(
                                                child:
                                                    CircularProgressIndicator(),
                                              )
                                            : ListView.builder(
                                                scrollDirection:
                                                    Axis.horizontal,
                                                shrinkWrap: true,
                                                itemCount:
                                                    _accommodations.length,
                                                itemBuilder: (context, index) {
                                                  final accommodation =
                                                      _accommodations[index];

                                                  // Ensure images exist and use a placeholder if necessary
                                                  String imageUrl = (accommodation
                                                          .images.isNotEmpty)
                                                      ? accommodation.images[
                                                          0] // Use the first image
                                                      : 'assets/images/placeholder.png';
                                                  // Placeholder image path

                                                  return GestureDetector(
                                                      onTap: () {
                                                        if (model.email !=
                                                            null) {
                                                          log('currentUSer ID : ${context.read<BottomshettViewmodel>().user.id!}');
                                                          log('otherUSer ID : ${accommodation.user.id}');
                                                          MainController.to
                                                                  .singleAccomodation =
                                                              accommodation;
                                                          MainController.to
                                                              .update();
                                                          Get.to(() =>
                                                              OpenAccommodationListingScreen(
                                                                index: index,
                                                                accommodationModel: AccommodationModel(
                                                                    id: accommodation
                                                                        .user
                                                                        .id,
                                                                    user: accommodation
                                                                        .user,
                                                                    reference:
                                                                        accommodation
                                                                            .reference,
                                                                    title: accommodation
                                                                        .title,
                                                                    category: accommodation
                                                                        .category,
                                                                    roomTypes:
                                                                        accommodation
                                                                            .roomTypes,
                                                                    images: accommodation
                                                                        .images,
                                                                    description:
                                                                        accommodation
                                                                            .description,
                                                                    location: accommodation
                                                                        .location,
                                                                    price: accommodation
                                                                        .price
                                                                        .toString(),
                                                                    amenities:
                                                                        accommodation
                                                                            .amenities,
                                                                    rating: accommodation
                                                                            .id
                                                                            ?.toString() ??
                                                                        'N/A',
                                                                    isAvailable:
                                                                        accommodation.availability ==
                                                                            'Available'),
                                                                isBookmarked:
                                                                    false,
                                                              ));
                                                        } else {
                                                          Get.to(LogInScreen(
                                                              isFrombottomSheet:
                                                                  true));
                                                        }
                                                      },
                                                      child:
                                                          AccomondationListview(
                                                        image: imageUrl,
                                                        location: accommodation
                                                            .location,
                                                        price:
                                                            "R${accommodation.price?.toString() ?? 'Not Available'}",
                                                        rating: accommodation.id
                                                                ?.toString() ??
                                                            'N/A',
                                                        status: accommodation
                                                            .availability,
                                                        isBookmarked: false,
                                                        onBookMarkTap: () {
                                                          if (model.email !=
                                                              null) {
                                                            // Handle bookmark action
                                                          } else {
                                                            Get.to(LogInScreen(
                                                                isFrombottomSheet:
                                                                    true));
                                                          }
                                                        },
                                                      ));
                                                },
                                              ),
                                      ),
                                    ));
                              }),
                            
                            
                              SizedBox(height: 39.h),
                              Consumer<HomeScreenViewmodel>(
                                  builder: (context, model, child) {
                                return CarouselSlider(
                                  items: [
                                    BannerImageWidget(
                                      padding: 20.h,
                                      image: 'assets/images/banner.png',
                                      text:
                                          "Used Textbooks, Calculators, Laptops and much more on Campus Market",
                                    ),
                                    BannerImageWidget(
                                      padding: 0.h,
                                      image: 'assets/images/banner2.png',
                                      text:
                                          "Find the right photographer for your graduation day!",
                                    ),
                                    BannerImageWidget(
                                      padding: 0.h,
                                      textWidth: 195.w,
                                      image: 'assets/images/banner3.png',
                                      text:
                                          "Find accommodation that suits your preferences and budget",
                                    ),
                                  ],
                                  options: CarouselOptions(
                                    height: 200.0,
                                    autoPlay: true,
                                    enlargeCenterPage: true,
                                    onPageChanged: (index, reason) {
                                      model.changeIndex(index);
                                    },
                                  ),
                                );
                              }),
                              Consumer<HomeScreenViewmodel>(
                                  builder: (context, model, child) {
                                return Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [0, 1, 2].map((index) {
                                    return Container(
                                      width: model.currentIndex == index
                                          ? 14.2
                                          : 8.w,
                                      height: 8.0,
                                      margin: const EdgeInsets.symmetric(
                                          vertical: 10.0, horizontal: 2.0),
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            model.currentIndex == index
                                                ? BorderRadius.circular(21.r)
                                                : BorderRadius.circular(50.r),
                                        color: model.currentIndex == index
                                            ? const Color(0xFF37ABC8)
                                            : const Color.fromRGBO(
                                                0, 0, 0, 0.4),
                                      ),
                                    );
                                  }).toList(),
                                );
                              }),
                              SizedBox(height: 39.h),
                            ],
                          ),
                        ),
                      ),
                      Positioned(
                        top: 20.h,
                        child:
                            HomeSearchField(searchController: searchController),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}

class BannerImageWidget extends StatelessWidget {
  const BannerImageWidget({
    super.key,
    required this.image,
    required this.text,
    required this.padding,
    this.textWidth,
  });

  final String image;
  final String text;
  final double padding;
  final double? textWidth;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.centerLeft,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(12.r),
          child: Image.asset(
            image,
            height: 154.h,
            width: 337.w,
            fit: BoxFit.cover,
          ),
        ),
        Padding(
          padding: EdgeInsets.only(left: 20.w, top: padding),
          child: SizedBox(
            width: textWidth ?? 200.w,
            child: workSansText2(
              maxLines: 4,
              text: text,
              color: whiteColor,
              fontSize: 14.97.sp,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ],
    );
  }
}
