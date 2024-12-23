import 'package:findly/Constant/assets_constant.dart';
import 'package:findly/Constant/text_constant.dart';
import 'package:findly/Core/Custom/container_widget.dart';
import 'package:findly/UI/Auth/Widgets/custom_auth_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../Constant/colors.dart';

class Notifications extends StatefulWidget {
  const Notifications({super.key});

  @override
  State<Notifications> createState() => _NotificationsState();
}

class _NotificationsState extends State<Notifications> {
  final Map<int, bool> _expandedStates = {};

  void _toggleExpanded(int index) {
    setState(() {
      _expandedStates[index] = !(_expandedStates[index] ?? false);
    });
  }

  @override
  Widget build(BuildContext context) {
    // Sample notifications list
    List<Notification> notifications = [
      Notification(date: "Today", message: "New Notification 1", time: "1 min"),
      Notification(date: "Today", message: "New Notification 2", time: "5 min"),
      Notification(
          date: "Today", message: "New Notification 3", time: "10 min"),
      Notification(
          date: "Yesterday", message: "New Notification 4", time: "1 hour"),
      Notification(
          date: "Yesterday", message: "New Notification 5", time: "2 hours"),
      Notification(
          date: "Yesterday", message: "New Notification 6", time: "3 hours"),
      // Add more notifications as needed
    ];

    // Group notifications by date
    Map<String, List<Notification>> groupedNotifications = {};
    for (var notification in notifications) {
      if (groupedNotifications[notification.date] == null) {
        groupedNotifications[notification.date] = [];
      }
      groupedNotifications[notification.date]!.add(notification);
    }
    return Scaffold(
        body: BlueContainer(
      child: Stack(
        children: [
          CustomAuthAppBar2(text: "Notifications", topPadding: 62.h),
          WhiteContainer(
            topPadding: 117.h,
            height: 1.sh,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 27.w) +
                  EdgeInsets.only(top: 20.h, bottom: 15.h),
              child: ListView.builder(
                shrinkWrap: true,
                padding: EdgeInsets.zero,
                itemCount: groupedNotifications.keys.length,
                itemBuilder: (context, index) {
                  String date = groupedNotifications.keys.elementAt(index);
                  List<Notification> dateNotifications =
                      groupedNotifications[date]!;

                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(height: 5.h),
                      workSansText(
                        text: date,
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w500,
                        color: blackColor,
                      ),
                      SizedBox(height: 23.h),
                      ...dateNotifications.map((notification) {
                        int notificationIndex =
                            notifications.indexOf(notification);
                        bool isExpanded =
                            _expandedStates[notificationIndex] ?? false;
                        return Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                CircleContainer(
                                  height: 32.h,
                                  width: 32.w,
                                  color: blackColor.withOpacity(0.05),
                                  child: Image.asset(notificationbell2,
                                      height: 27.h, width: 27.w),
                                ),
                                SizedBox(width: 8.w),
                                Expanded(
                                  flex: 20,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      workSansText(
                                        text: notification.message,
                                        maxLines: 1,
                                        fontSize: 14.sp,
                                        fontWeight: FontWeight.normal,
                                        color: blackColor,
                                      ),
                                      workSansText2(
                                        maxLines: !isExpanded ? 1 : 1000,
                                        text:
                                            "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Lorem ipsum dolor sit amet, consectetur adipiscing elit.",
                                        fontSize: 12.sp,
                                        textAlign: TextAlign.start,
                                        fontWeight: FontWeight.normal,
                                        color: blackColor.withOpacity(0.5),
                                      ),
                                    ],
                                  ),
                                ),
                                // const Spacer(),
                                SizedBox(width: 30.w),

                                workSansText(
                                  text: notification.time,
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w500,
                                  color: blackColor,
                                ),
                              ],
                            ),
                            Align(
                              alignment: Alignment.center,
                              child: GestureDetector(
                                onTap: () => _toggleExpanded(notificationIndex),
                                child: workSansText(
                                    text: isExpanded ? "See Less" : "See More",
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.normal,
                                    color: textHighLight),
                              ),
                            ),
                            Divider(
                              color: blackColor.withOpacity(0.1),
                              height: 0,
                            ),
                            const SizedBox(height: 8),
                          ],
                        );
                      }),
                    ],
                  );
                },
              ),
            ),
          )
        ],
      ),
    ));
  }
}

class Notification {
  final String date;
  final String message;
  final String time;

  Notification({required this.date, required this.message, required this.time});
}

List<Notification> notifications = [
  Notification(date: "Today", message: "New Notification 1", time: "1 min"),
  Notification(date: "Today", message: "New Notification 2", time: "5 min"),
  Notification(date: "Today", message: "New Notification 3", time: "10 min"),
  Notification(
      date: "Yesterday", message: "New Notification 4", time: "1 hour"),
  Notification(
      date: "Yesterday", message: "New Notification 5", time: "2 hours"),
  Notification(
      date: "Yesterday", message: "New Notification 6", time: "3 hours"),
  // Add more notifications as needed
];
