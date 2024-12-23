import 'dart:convert';
import 'dart:developer';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:findly/Constant/assets_constant.dart';
import 'package:findly/Constant/colors.dart';
import 'package:findly/Core/Custom/container_widget.dart';
import 'package:findly/Core/Custom/custom_drop_down.dart';
import 'package:findly/UI/Auth/Widgets/custom_auth_appbar.dart';
import 'package:findly/UI/MainBottomNavigationBar/Views/GraduationPhtographySection/GraduationPhotoGraphyHome/getGig_model.dart';
import 'package:findly/UI/MainBottomNavigationBar/Views/GraduationPhtographySection/GraduationPhotoGraphyHome/photography_homeviewmodel.dart';
import 'package:findly/UI/MainBottomNavigationBar/Views/GraduationPhtographySection/PhotoGrapherDetails/photographer_details.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/route_manager.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

import '../../../../../Constant/text_constant.dart';

class GraduationphotographyHome extends StatefulWidget {
  const GraduationphotographyHome({super.key});

  @override
  State<GraduationphotographyHome> createState() =>
      _GraduationphotographyHomeState();
}

class _GraduationphotographyHomeState extends State<GraduationphotographyHome> {
  final TextEditingController searchController = TextEditingController();
  List<Gig> topRatedPhotographers = [];
  final String baseUrl =
      'https://findly-kappa.vercel.app/api/public/gigs?page=1&limit=1000';
  bool loading = false;

  Future<void> fetchGigs(PhotographyViewmodel viewModel) async {
    try {
      String searchQuery =
          viewModel.search.isNotEmpty && viewModel.search != 'All'
              ? '&region=${viewModel.search}'
              : '';
      loading = true;
      final response = await http.get(Uri.parse('$baseUrl$searchQuery'));

      if (response.statusCode == 200) {
        final jsonData = json.decode(response.body);
        final gigsData = jsonData['data']['gigs'] as List;

        topRatedPhotographers =
            gigsData.map((gig) => Gig.fromJson(gig)).toList();
      } else {
        throw Exception('Failed to load gigs');
      }
    } catch (e) {
      log('Error fetching gigs: $e');
    } finally {
      setState(() {
        loading = false;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    PhotographyViewmodel viewmodel = context.read<PhotographyViewmodel>();
    fetchGigs(viewmodel);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<PhotographyViewmodel>(
        builder: (context, model, child) {
          return PhotoGraphyContainer(
            child: Stack(
              children: [
                PhotoGraphyAppBar(
                  text: "Graduation Photographers",
                  topPadding: 49.h,
                  width: 42.42.w,
                ),
                WhiteContainer(
                  topPadding: 160.h,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 27.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 50.h),
                        if(loading)
                          const Center(child: CircularProgressIndicator())
                        else
                        Flexible(
                          fit: FlexFit.loose,
                          child: ListView.builder(
                            padding: EdgeInsets.symmetric(vertical: 20.h),
                            shrinkWrap: true,
                            itemCount: topRatedPhotographers.length,
                            itemBuilder: (context, index) {
                              final photographer = topRatedPhotographers[index];
                              return GestureDetector(
                                onTap: () {
                                  Get.to(() => PhotographerDetails(
                                        index: index,
                                        isBookMarked: model.isBookmarkedList[0],
                                        gig: photographer,
                                      ));
                                },
                                child: TopRatedPhotoGraphy(
                                  onBookMarkTap: () {
                                    model.toggleBookmark(index);
                                  },
                                  isBookMarked: model.isBookmarkedList[0],
                                  model: photographer,
                                ),
                              );
                            },
                          ),
                        ),
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
                        hinttext: "Select Region",
                        val: model.search,
                        onChanged: (val) {
                          log("value is $val");
                          model.setSearch(val!);
                          fetchGigs(model);
                          // Get.to(() => const GraduationPhotographyResult());
                        },
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

class TopRatedPhotoGraphy extends StatefulWidget {
  const TopRatedPhotoGraphy({
    super.key,
    required this.model,
    required this.isBookMarked,
    required this.onBookMarkTap,
  });

  final Gig model;
  final bool isBookMarked;
  final VoidCallback onBookMarkTap;

  @override
  State<TopRatedPhotoGraphy> createState() => _TopRatedPhotoGraphyState();
}

class _TopRatedPhotoGraphyState extends State<TopRatedPhotoGraphy> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 13.h),
      height: 109.h,
      decoration: BoxDecoration(
        border: Border.all(
          color: const Color(0xFFC6C5C5),
        ),
        borderRadius: BorderRadius.circular(14.r),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (widget.model.portfolio != null &&
              widget.model.portfolio!.isNotEmpty)
            Container(
              height: 109.h,
              width: 110.w,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(14.r),
                  bottomLeft: Radius.circular(14.r),
                ),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(14.r),
                  bottomLeft: Radius.circular(14.r),
                ),
                child: CachedNetworkImage(
                  imageUrl: widget.model.portfolio![0],
                  fit: BoxFit.cover,
                  placeholder: (context, url) => Container(),
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                ),
              ),
            ),
          Flexible(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: 12.w),
                        child: workSans16Text(
                            text: widget.model.name.toString(),
                            fontWeight: FontWeight.w500,
                            fontSize: 20.sp),
                      ),
                      SizedBox(height: 2.h),
                      Padding(
                        padding: EdgeInsets.only(left: 12.w),
                        child: Row(
                          children: [
                            Image.asset(locationIcon,
                                height: 14.h, width: 13.w),
                            SizedBox(width: 4.w),
                            workSansText(
                              text: widget.model.regions.toString(),
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w500,
                              color: textColor,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                /* SizedBox(height: 5.h),
                widget.model.isActive ?? false
                    ? Padding(
                        padding: EdgeInsets.only(left: 10.w),
                        child: Row(
                          children: [
                            Image.asset(star2, height: 13.h, width: 15.w),
                            SizedBox(width: 4.w),
                            RichText(
                              text: TextSpan(
                                text: "4.5",
                                style: workSansTextStyle(
                                    color: textColor,
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.w500),
                                children: [
                                  TextSpan(
                                    text: " (67)",
                                    style: workSansTextStyle(
                                        color: textColor,
                                        fontSize: 11.sp,
                                        fontWeight: FontWeight.w300),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      )
                    : Padding(
                        padding: EdgeInsets.only(left: 16.w),
                        child: workSansText(
                            text: "Not rated yet",
                            color: textColor,
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w400),
                      ),*/
                Padding(
                  padding: EdgeInsets.only(top: 5.h, left: 16.w, bottom: 4.h),
                  child: RichText(
                    text: TextSpan(
                      text: "From ",
                      style: workSansTextStyle(
                          color: textColor,
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w400),
                      children: [
                        TextSpan(
                          text: 'R${widget.model.price}',
                          style: workSansTextStyle(
                              color: textColor,
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w700),
                        ),
                        TextSpan(
                          text: '/session',
                          style: workSansTextStyle(
                              color: textColor,
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w400),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Column(
            children: [
              GestureDetector(
                onTap: widget.onBookMarkTap,
                child: Container(
                  padding: EdgeInsets.all(4.r),
                  margin: EdgeInsets.all(8.r),
                  decoration: BoxDecoration(
                    color: const Color(0xFFFEFEFE),
                    borderRadius: BorderRadius.circular(14.r),
                    boxShadow: const [
                      BoxShadow(
                        color: lightGreyColor,
                        blurRadius: 4,
                        blurStyle: BlurStyle.outer,
                      )
                    ],
                  ),
                  child: widget.isBookMarked
                      ? const Icon(
                          Icons.favorite,
                          color: secondaryColor,
                          size: 12,
                        )
                      : const Icon(
                          Icons.favorite_border,
                          color: secondaryColor,
                          size: 16,
                        ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
