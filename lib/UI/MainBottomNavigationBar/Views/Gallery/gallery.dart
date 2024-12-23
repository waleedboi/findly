import 'package:findly/Core/Custom/container_widget.dart';
import 'package:findly/UI/Auth/Widgets/custom_auth_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Gallery extends StatelessWidget {
  const Gallery({super.key, required this.images});

  final List<String> images;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlueContainer(
          child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          CustomAuthAppBar2(text: "Gallery", width: 95.w),
          Flexible(
            fit: FlexFit.loose,
            child: ListView.builder(
                shrinkWrap: true,
                itemCount: images.length,
                padding: EdgeInsets.only(top: 20.h),
                itemBuilder: (context, index) {
                  return Image.network(images[index]);
                }),
          )
        ],
      )),
    );
  }
}
