import 'package:findly/Constant/enum.dart';
import 'package:findly/Models/bookmark_model.dart';
import 'package:findly/UI/MainBottomNavigationBar/Views/BookMarks/bookmark_viewmodel.dart';
import 'package:findly/UI/MainBottomNavigationBar/Views/BookMarks/widget/bookmark_accommodation_widget.dart';
import 'package:findly/UI/MainBottomNavigationBar/Views/BookMarks/widget/bookmark_marketplace_widget.dart';
import 'package:findly/UI/MainBottomNavigationBar/Views/BookMarks/widget/bookmark_photography_widget.dart';
import 'package:findly/UI/MainBottomNavigationBar/bottomshett_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../../../Constant/text_constant.dart';
import '../../../../Core/Custom/container_widget.dart';
import '../../../Auth/Widgets/custom_auth_appbar.dart';

class BookMarkScreen extends StatelessWidget {
  const BookMarkScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<BookmarkViewmodel>(builder: (context, model, child) {
        return BlueContainer(
          child: Stack(
            fit: StackFit.loose,
            children: [
              CustomAuthAppBar2(
                text: "Bookmarks",
                width: 70.w,
                onTap: () {
                  context.read<BottomshettViewmodel>().onItemTapped(0);
                },
              ),
              // Positioned(
              //   top: 62.h,
              //   child: SizedBox(
              //     width: 357.w,
              //     child: const CustomAuthAppBar(
              //       text: "Bookmarks",
              //     ),
              //   ),
              // ),
              Positioned(
                top: 117.h,
                child: WhiteContainer(
                  height: 0.87.sh,
                  topPadding: 0,
                  child: SizedBox(
                    width: 1.sw,
                    child: bookMarkList2.isEmpty
                        ? Center(
                            child: workSans16Text(
                                text: "Bookmarks is empty"))
                        : ListView.builder(
                            padding: EdgeInsets.symmetric(
                                    horizontal: 32.w, vertical: 24.h) +
                                EdgeInsets.only(bottom: 50.h),
                            itemCount: bookMarkList2.length,
                            shrinkWrap: true,
                            itemBuilder: (context, index) {
                              BookMarkModel data = bookMarkList2[index];
                              return Padding(
                                padding: EdgeInsets.only(bottom: 20.h),
                                child: data.serviceType ==
                                        ServiceType.accommodation
                                    ? BookmarkAccommodationWidget(
                                        index: index,
                                        model: model,
                                        data: data,
                                      )
                                    : data.serviceType ==
                                            ServiceType.marketplace
                                        ? BookmarkMarketplaceWidget(
                                            index: index, model: model)
                                        : data.serviceType ==
                                                ServiceType.photography
                                            ? BookmarkPhotographyWidget(
                                                index: index,
                                                model: model)
                                            : const SizedBox(),
                              );
                            },
                          ),
                  ),
                ),
              ),

              // Positioned(
              //   top: 140.h,
              //   child: SizedBox(
              //     width: 1.sw,
              //     child: ListView.builder(
              //       itemCount: 100,
              //       shrinkWrap: true,
              //       itemBuilder: (context, index) {
              //         return Text("$index");
              //       },
              //     ),
              //   ),
              // ),
            ],
          ),
        );
      }),
    );
  }
}
