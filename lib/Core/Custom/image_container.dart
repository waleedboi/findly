import 'package:cached_network_image/cached_network_image.dart';
import 'package:findly/Core/Custom/circular_progress.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../Constant/assets_constant.dart';

class ImageContainer extends StatelessWidget {
  const ImageContainer({super.key, this.height, this.width, this.image});
  final double? height;
  final double? width;
  final String? image;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: height ?? 76.h,
      width: width ?? 76.w,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(13.r),
        image: DecorationImage(
          image: AssetImage(image ?? hostelimage1),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

class NetworkImageContainer extends StatelessWidget {
  const NetworkImageContainer({super.key, this.height, this.width, this.image});
  final double? height;
  final double? width;
  final String? image;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: height ?? 76.h,
      width: width ?? 76.w,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(13.r),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(13.0),
        child: image != null
            ? CachedNetworkImage(
                imageUrl: image!,
                fit: BoxFit.cover,
                placeholder: (context, url) => const KCircularProgress(),
                errorWidget: (context, url, error) =>
                    const Icon(Icons.broken_image_outlined),
              )
            : Image.asset(hostelimage1, fit: BoxFit.cover),
      ),
    );
  }
}
