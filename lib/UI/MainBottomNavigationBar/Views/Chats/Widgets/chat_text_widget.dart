import 'package:bubble/bubble.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../Constant/assets_constant.dart';
import '../../../../../Constant/colors.dart';
import '../../../../../Constant/text_constant.dart';
import '../../../../Auth/Widgets/custom_auth_appbar.dart';

class ChatScreenWidget extends StatelessWidget {
  const ChatScreenWidget({
    super.key,
    required this.isme,
    required this.index,
    required this.date,
    required this.text,
  });

  final bool isme;
  final int index;
  final String text;
  final DateTime date;

  BubbleStyle styleSomebody(bool isSame) {
    return const BubbleStyle(
      padding: BubbleEdges.all(10),
      radius: Radius.circular(12),
      nip: BubbleNip.leftBottom,
      color: Color(0xFFEFEFF4),
      // nipOffset: 2,

      // nipHeight: 30,
      // borderColor: Colors.black,
      borderWidth: 1,
      elevation: 0,
      stick: false,
      margin: BubbleEdges.only(top: 5),
      alignment: Alignment.topLeft,
    );
  }

  BubbleStyle styleMe(bool isSame) {
    return const BubbleStyle(
      // padding: BubbleEdges.all(15),

      radius: Radius.circular(12),
      nip: BubbleNip.rightBottom,
      color: Color(0xFF0055D4),

      stick: true,
      borderWidth: 1,
      elevation: 0,
      margin: BubbleEdges.only(top: 5),
      alignment: Alignment.topRight,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: index == 30 - 1 ? 110.h : 13.h),
      child:
          // isme
          //     ? Row(
          //         crossAxisAlignment: CrossAxisAlignment.end,
          //         mainAxisAlignment: MainAxisAlignment.end,
          //         children: [
          //           Expanded(
          //             child: Bubble(
          //               style: styleMe(true),
          //               child: Container(
          //                 constraints: BoxConstraints(maxWidth: 248.w),
          //                 child: Column(
          //                   crossAxisAlignment: CrossAxisAlignment.end,
          //                   children: [
          //                     workSansText(
          //                       overflow: TextOverflow.visible,
          //                       text:
          //                           "I have 3 spaces, available 2 single rooms and I cottage",
          //                       fontSize: 14.sp,
          //                       fontWeight: FontWeight.normal,
          //                       color: whiteColor,
          //                     ),
          //                     SizedBox(height: 5.h),
          //                     workSansText(
          //                       text: "11:00 AM",
          //                       fontSize: 8.sp,
          //                       fontWeight: FontWeight.normal,
          //                       color: whiteColor,
          //                     )
          //                   ],
          //                 ),
          //               ),
          //             ),
          //           ),
          //           ImageCircleContainer(
          //               height: 30.h, width: 30.w, profile: profile1),
          //         ],
          //       )
          //     :
          Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          ImageCircleContainer(height: 30.h, width: 30.w, profile: profile1),
          Expanded(
            child: Bubble(
              style: styleSomebody(true),
              child: Container(
                constraints: BoxConstraints(maxWidth: 248.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    workSansText(
                      overflow: TextOverflow.visible,
                      text: "Hey, i’m looking for accomodation",
                      fontSize: 14.sp,
                      fontWeight: FontWeight.normal,
                      color: const Color(0XFF262628),
                    ),
                    SizedBox(height: 5.h),
                    workSansText(
                      text: "11:00 AM",
                      fontSize: 8.sp,
                      fontWeight: FontWeight.normal,
                      color: const Color(0XFF9B9B9B),
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
