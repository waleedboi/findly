import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../Constant/assets_constant.dart';
import '../../Constant/colors.dart';
import '../../Constant/text_constant.dart';

class CustomDropDown extends StatelessWidget {
  const CustomDropDown({
    super.key,
    required this.hinttext,
    this.value,
    required this.onChanged,
  });

  final String hinttext;
  final String? value;
  final Function(String?) onChanged;

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
      style: workSansTextStyle(
          color: textColor, fontSize: 14.sp, fontWeight: FontWeight.normal),
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Color(0xFFE6E6E6),
          ),
          borderRadius: BorderRadius.circular(10.r),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Color(0xFFE6E6E6),
          ),
          borderRadius: BorderRadius.circular(10.r),
        ),
        border: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Color(0XFFE6E6E6),
          ),
          borderRadius: BorderRadius.circular(10.r),
        ),
      ),
      icon: const Icon(Icons.keyboard_arrow_down_rounded),
      hint: workSansText2(
          text: hinttext,
          fontSize: 14.sp,
          fontWeight: FontWeight.normal,
          color: blackColor.withOpacity(0.2)),
      items: <String>['New', 'Used'].map((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: workSansText2(
              text: value,
              fontSize: 14.sp,
              fontWeight: FontWeight.normal,
              color: textFieldHintColor),
        );
      }).toList(),
      onChanged: onChanged,
    );
  }
}

class CustomDropDown2<T> extends StatelessWidget {
  const CustomDropDown2({
    super.key,
    required this.hinttext,
    this.value,
    required this.onChanged,
    required this.items,
    required this.itemBuilder,
    this.validator,
  });

  final String hinttext;
  final T? value;
  final List<T> items;
  final Function(T?) onChanged;
  final Widget Function(T) itemBuilder;
  final String? Function(T?)? validator;

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<T>(
      value: value,
      validator: validator,
      style: workSansTextStyle(
          color: textColor, fontSize: 14.sp, fontWeight: FontWeight.normal),
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Color(0xFFE6E6E6),
          ),
          borderRadius: BorderRadius.circular(10.r),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Color(0xFFE6E6E6),
          ),
          borderRadius: BorderRadius.circular(10.r),
        ),
        border: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Color(0XFFE6E6E6),
          ),
          borderRadius: BorderRadius.circular(10.r),
        ),
      ),
      icon: const Icon(Icons.keyboard_arrow_down_rounded),
      hint: workSansText2(
          text: hinttext,
          fontSize: 14.sp,
          fontWeight: FontWeight.normal,
          color: blackColor.withOpacity(0.2)),
      items: items.map((T value) {
        return DropdownMenuItem<T>(
          value: value,
          child: itemBuilder(value),
        );
      }).toList(),
      onChanged: onChanged,
    );
  }
}

class GraduationphotographyHomeCustomDropDown extends StatelessWidget {
  const GraduationphotographyHomeCustomDropDown(
      {super.key,
      required this.hinttext,
      this.val,
      required this.onChanged,
      this.hintTextColor});

  final String hinttext;
  final String? val;
  final Color? hintTextColor;
  final Function(String?) onChanged;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: blackColor.withOpacity(0.12),
            spreadRadius: 0,
            blurRadius: 48,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: DropdownButtonFormField<String>(
        style: workSansTextStyle(
            color: textColor, fontSize: 14.sp, fontWeight: FontWeight.normal),
        decoration: InputDecoration(
          fillColor: whiteColor,
          filled: true,
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(10.r),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(10.r),
          ),
          border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(10.r),
          ),
        ),
        icon: const Icon(Icons.keyboard_arrow_down_rounded),
        hint: workSansText2(
            text: hinttext,
            fontSize: 14.sp,
            fontWeight: FontWeight.normal,
            color: hintTextColor ?? const Color(0xFFA0A0A0)),
        items: <String>['All','CapeTown', 'Durban', 'Pretoria', 'Polokwane'].map((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: workSansText2(
                text: value,
                fontSize: 14.sp,
                fontWeight: FontWeight.w500,
                color: const Color(0XFF1A1A1A)),
          );
        }).toList(),
        onChanged: onChanged,
      ),
    );
  }
}

class AccommodationLocationCustomDropDown extends StatelessWidget {
  const AccommodationLocationCustomDropDown({
    super.key,
    required this.hintText,
    required this.onChanged,
    this.value,
    this.hintTextColor,
    this.fromAddAccommodationPage = false,
  });

  final String hintText;
  final String? value;
  final Color? hintTextColor;
  final Function(String?) onChanged;
  final bool fromAddAccommodationPage;

  @override
  Widget build(BuildContext context) {
    List<String> locations = [
      "All",
      "Auckland park, Johannesburg",
      "Brixton, Johannesburg",
      "Westdene, Johannesburg",
      "Melville, Johannesburg",
      "Hursthill, Johannesburg",
      "Doornfontein, Johannesburg",
      "Parktown, Johannesburg",
      "Milpark, Johannesburg",
      "Braamfontein, Johannesburg",
      "Berea, Johannesburg",
      "Diepkloof, Johannesburg",
      "CBD, Johannesburg",
      "Soweto, Johannesburg",
      "Diepkloof, Soweto",
      "Martindale, Johannesburg",
      "New Doornfontein, Johannesburg",
      "Orlando, Soweto",
      "Sophiatown, Johannesburg",
      "Pimville, Soweto",
      "Protea Glen, Soweto",
      "Bassonia, Johannesburg",
      "Crosby, Johannesburg",
      "Winchester Hills, Johannesburg"
    ];
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: blackColor.withOpacity(0.12),
            spreadRadius: 0,
            blurRadius: 48,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: DropdownButtonFormField<String>(
        style: workSansTextStyle(
            color: textColor, fontSize: 14.sp, fontWeight: FontWeight.normal),
        decoration: InputDecoration(
          fillColor: fromAddAccommodationPage ? Colors.transparent : whiteColor,
          filled: true,
          enabledBorder: OutlineInputBorder(
            borderSide: fromAddAccommodationPage
                ? const BorderSide(
                    color: Color(0xFFE6E6E6),
                  )
                : BorderSide.none,
            borderRadius: BorderRadius.circular(10.r),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: fromAddAccommodationPage
                ? const BorderSide(
                    color: Color(0XFFE6E6E6),
                  )
                : BorderSide.none,
            borderRadius: BorderRadius.circular(10.r),
          ),
          border: OutlineInputBorder(
            borderSide: fromAddAccommodationPage
                ? const BorderSide(
                    color: Color(0XFFE6E6E6),
                  )
                : BorderSide.none,
            borderRadius: BorderRadius.circular(10.r),
          ),
        ),
        icon: const Icon(Icons.keyboard_arrow_down_rounded),
        hint: workSansText2(
            text: hintText,
            fontSize: 14.sp,
            fontWeight: FontWeight.normal,
            color: hintTextColor ?? const Color(0xFFA0A0A0)),
        value: value,
        items: locations.map((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: workSansText2(
                text: value,
                fontSize: 14.sp,
                fontWeight: FontWeight.w500,
                color: const Color(0XFF1A1A1A)),
          );
        }).toList(),
        onChanged: onChanged,
      ),
    );
  }
}

class CampusFriendHomeDropDown extends StatelessWidget {
  const CampusFriendHomeDropDown({
    super.key,
    required this.hinttext,
    this.value,
    required this.onChanged,
  });

  final String hinttext;
  final String? value;
  final Function(String?) onChanged;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: blackColor.withOpacity(0.12),
            spreadRadius: 0,
            blurRadius: 48,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: DropdownButtonFormField<String>(
        style: workSansTextStyle(
            color: textColor, fontSize: 14.sp, fontWeight: FontWeight.normal),
        decoration: InputDecoration(
          prefixIcon: Padding(
            padding: EdgeInsets.all(15.sp),
            child: Image.asset(
              locationIcon,
              height: 10.h,
              width: 6.27.w,
              color: const Color(0xFFFF6600),
            ),
          ),
          fillColor: whiteColor,
          filled: true,
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(10.r),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(10.r),
          ),
          border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(10.r),
          ),
        ),
        icon: const Icon(Icons.keyboard_arrow_down_rounded),
        hint: workSansText2(
            text: hinttext,
            fontSize: 14.sp,
            fontWeight: FontWeight.normal,
            color: blackColor.withOpacity(0.2)),
        items: <String>['Type 1', 'Type 2', 'Type 3'].map((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: workSansText2(
                text: value,
                fontSize: 14.sp,
                fontWeight: FontWeight.normal,
                color: textFieldHintColor),
          );
        }).toList(),
        onChanged: (String? newValue) {
          // Handle change
        },
      ),
    );
  }
}

class MarketPlaceHomeDropDown extends StatelessWidget {
  const MarketPlaceHomeDropDown({
    super.key,
    required this.hinttext,
    this.value,
    required this.onChanged,
  });

  final String hinttext;
  final String? value;
  final Function(String?) onChanged;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 160.w,
      child: DropdownButtonFormField<String>(
        style: workSansTextStyle(
            color: textColor, fontSize: 14.sp, fontWeight: FontWeight.normal),
        decoration: InputDecoration(
            prefixIcon: Padding(
                padding: EdgeInsets.only(right: 5.w),
                child: Image.asset(locationIcon,
                    height: 20.h, width: 15.w, color: const Color(0xFFFF6600))),
            prefixIconConstraints:
                BoxConstraints(minWidth: 0.w, minHeight: 0.h),
            suffixIconConstraints:
                BoxConstraints(minWidth: 0.w, minHeight: 0.h),
            border: InputBorder.none),
        icon: const Icon(Icons.keyboard_arrow_down_rounded),

        // alignment: Alignment. ,

        padding: EdgeInsets.zero,
        isExpanded: true,
        isDense: true,
        items: <String>['Type 1', 'Type 2', 'Type 3'].map((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: workSansText2(
                text: value,
                fontSize: 14.sp,
                fontWeight: FontWeight.normal,
                color: textFieldHintColor),
          );
        }).toList(),
        onChanged: (String? newValue) {
          // Handle change
        },
      ),
    );
  }
}

class LocationDropDown extends StatelessWidget {
  const LocationDropDown({
    super.key,
    required this.hinttext,
    this.value,
    required this.onChanged,
  });

  final String hinttext;
  final Location? value;
  final Function(Location?) onChanged;

  final List<Location> locations = const [
    Location('UJ', -26.1888, 28.0146),
    Location('WITS', -26.1908, 28.0303),
    Location('UP', -25.7554, 28.2339),
    Location('University of Mpumalanga', -25.4627, 30.9669),
    Location('DUT', -29.8587, 31.0218),
    Location('VUT', -26.7134, 27.8371),
    Location('UCT', -33.9574, 18.4604),
    Location('UFS', -29.1194, 26.2155),
    Location('TUT', -25.7313, 28.2184),
    Location('UL', -23.8880, 29.7586),
    Location('UNIVEN', -22.9761, 30.4447),
    Location('University of Fort Hare', -32.7887, 26.8534),
    Location('Stellenbosch University', -33.9322, 18.8647),
    Location('NWU', -26.6802, 27.0968),
    Location('Cape Town', -33.9249, 18.4241),
    Location('Durban', -29.8587, 31.0218),
    Location('Pretoria', -25.7479, 28.2293),
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 160.w,
      child: DropdownButtonFormField<Location>(
        style: TextStyle(
          color: Colors.black,
          fontSize: 14.sp,
          fontWeight: FontWeight.normal,
        ),
        decoration: InputDecoration(
          prefixIcon: Padding(
            padding: EdgeInsets.only(right: 5.w),
            child: Icon(
              Icons.location_pin,
              size: 20.h,
              color: const Color(0xFFFF6600),
            ),
          ),
          prefixIconConstraints: BoxConstraints(minWidth: 0.w, minHeight: 0.h),
          suffixIconConstraints: BoxConstraints(minWidth: 0.w, minHeight: 0.h),
          border: InputBorder.none,
        ),
        icon: const Icon(Icons.keyboard_arrow_down_rounded),
        hint: Text(
          hinttext,
          style: TextStyle(
            fontSize: 14.sp,
            fontWeight: FontWeight.normal,
            color: const Color(0xFF666666),
          ),
        ),
        isExpanded: true,
        isDense: true,
        value: value,
        // Set the currently selected value
        items: locations.map((location) {
          return DropdownMenuItem<Location>(
            value: location,
            child: Text(
              location.name,
              style: TextStyle(
                fontSize: 14.sp,
                fontWeight: FontWeight.normal,
                color: const Color(0xFF1E1E1E),
              ),
            ),
          );
        }).toList(),
        onChanged: (newValue) {
          // Call onChanged with the selected value
          onChanged(newValue);
        },
        validator: (value) {
          if (value == null) {
            return 'Please select a location';
          }
          return null;
        },
      ),
    );
  }
}

class Location {
  final String name;
  final double latitude;
  final double longitude;

  const Location(this.name, this.latitude, this.longitude);
}
