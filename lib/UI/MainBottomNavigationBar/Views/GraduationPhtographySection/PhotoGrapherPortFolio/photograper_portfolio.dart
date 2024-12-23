import 'package:findly/Core/Custom/container_widget.dart';
import 'package:findly/UI/Auth/Widgets/custom_auth_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PhotographerPortfolio extends StatelessWidget {
  const PhotographerPortfolio({super.key, required this.porfolioImages});

  final List<String> porfolioImages;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlueContainer(
          child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          CustomAuthAppBar2(text: " Portfolio", width: 90.w),
          Flexible(
            fit: FlexFit.loose,
            child: ListView.builder(
                shrinkWrap: true,
                itemCount: porfolioImages.length,
                padding: EdgeInsets.only(top: 20.h),
                itemBuilder: (context, index) {
                  return Image.network(porfolioImages[index], loadingBuilder:
                      (BuildContext context, Widget child,
                          ImageChunkEvent? loadingProgress) {
                    if (loadingProgress == null) return child;
                    return Center(
                      child: CircularProgressIndicator(
                        value: loadingProgress.expectedTotalBytes != null
                            ? loadingProgress.cumulativeBytesLoaded /
                                loadingProgress.expectedTotalBytes!
                            : null,
                      ),
                    );
                  });
                }),
          )
        ],
      )),
    );
  }
}
