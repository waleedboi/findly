import 'package:findly/UI/MainBottomNavigationBar/Views/AccommoadtionSection/View/MapScreen/map_screen_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import '../../../../../../Models/AccommodationModels/accommodation_model.dart';
import '../OpenAccomodationListing/open_accommodation_listing_screen.dart';
import 'Widgets/distance_slider_widget.dart';
import 'Widgets/location_marker_icon.dart';
import 'Widgets/map_backbutton_maprangecontainer.dart';
import 'Widgets/map_location_listview.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({super.key});

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<MapScreenViewmodel>(builder: (context, model, child) {
        return Stack(
          // alignment: Alignment.cen,
          fit: StackFit.loose,
          children: [
            Container(
              height: 1.sh,
              width: 1.sw,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/images/maps.png"),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 68.h, left: 24.w, right: 24.w),
              child: Row(
                children: [
                  const MapBackButton(),
                  SizedBox(width: 15.w),
                  const DistanceSliderWidget(),
                ],
              ),
            ),
            LocationMarkerIcon(sliderValue: model.sliderValue),
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: EdgeInsets.only(bottom: 44.h),
                child: SizedBox(
                  height: 110.h,
                  child: ListView.builder(
                    padding: EdgeInsets.only(left: 25.w),
                    itemCount: accomodationList.length,
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return MapLocationListview(onTap: () {
                        Get.to(() => OpenAccommodationListingScreen(
                            index: index,
                            accommodationModel: accomodationList[index],
                            isBookmarked: false));
                      });
                    },
                  ),
                ),
              ),
            ),
          ],
        );
      }),
    );
  }
}
