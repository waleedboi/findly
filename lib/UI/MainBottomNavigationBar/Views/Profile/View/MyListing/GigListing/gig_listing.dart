import 'package:findly/Constant/colors.dart';
import 'package:findly/Constant/text_constant.dart';
import 'package:findly/Core/Custom/circular_progress.dart';
import 'package:findly/Core/Custom/container_widget.dart';
import 'package:findly/Models/GigModels/gig_user_gigs_model.dart';
import 'package:findly/UI/Auth/Widgets/custom_auth_appbar.dart';
import 'package:findly/UI/MainBottomNavigationBar/Views/Home/widgets/home_search_field.dart';
import 'package:findly/UI/MainBottomNavigationBar/Views/Profile/View/MyListing/EditGig/edit_gig_screen.dart';
import 'package:findly/UI/MainBottomNavigationBar/Views/Profile/View/MyListing/GigListing/gig_listing_viewmodel.dart';
import 'package:findly/UI/MainBottomNavigationBar/Views/Profile/View/MyListing/widgets/listing_delete_popup.dart';
import 'package:findly/UI/MainBottomNavigationBar/Views/Profile/View/MyListing/widgets/listing_photographer_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

class GigListing extends StatefulWidget {
  const GigListing({super.key});

  @override
  State<GigListing> createState() => _GigListingState();
}

class _GigListingState extends State<GigListing> {

  @override
  void initState() {
    context.read<GigListingViewmodel>().init();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<GigListingViewmodel>(builder: (context, model, child) {
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
                                  itemCount: model.filterGigs.length,
                                  shrinkWrap: true,
                                  itemBuilder: (context, index) {
                                    GetUserGigsModel data =
                                        model.filterGigs[index];
                                    return Padding(
                                        padding: EdgeInsets.only(bottom: 20.h),
                                        child: ListingPhotographerWidget(
                                          index: index,
                                          data: data,
                                          onDelete: () {
                                            Get.dialog(ListingDeletePopup(
                                              onDelete: () {
                                                model.onDelete(
                                                    index);
                                                Get.back();
                                              },
                                            ));
                                          },
                                          onEdit: () {
                                            Get.to(EditGigScreen(data: data));
                                          },
                                        ));
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
                            model.filterGigsQuery(val);
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
