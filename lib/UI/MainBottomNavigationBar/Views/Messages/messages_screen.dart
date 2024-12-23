import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:findly/Constant/colors.dart';
import 'package:findly/Constant/text_constant.dart';
import 'package:findly/Core/Custom/container_widget.dart';
import 'package:findly/Models/messages_model.dart';
import 'package:findly/UI/MainBottomNavigationBar/Views/Chats/chat_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import '../../../Auth/Widgets/custom_auth_appbar.dart';
import '../../bottomshett_viewmodel.dart';

class MessagesScreen extends StatefulWidget {
  const MessagesScreen({super.key});

  @override
  State<MessagesScreen> createState() => _MessagesScreenState();
}

class _MessagesScreenState extends State<MessagesScreen> {
  @override
  void initState() {
    getAllUsers();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlueContainer(
        child: Stack(
          fit: StackFit.loose,
          alignment: Alignment.topCenter,
          children: [
            // Padding(
            //   padding: EdgeInsets.only(top: 62.h),
            //   child: workSansText(
            //     text: "Messages",
            //     fontSize: 24.sp,
            //     fontWeight: FontWeight.w500,
            //     color: whiteColor,
            //   ),
            // ),
            CustomAuthAppBar2(
              onTap: () {
                context.read<BottomshettViewmodel>().onItemTapped(0);
              },
              text: "Messages",
              leftpadding: 22.w,
              width: 90.w,
            ),

            Positioned(
              top: 117.h,
              child: WhiteContainer(
                height: 0.87.sh,
                topPadding: 0,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox(height: 24.h),
                    // Padding(
                    //   padding: EdgeInsets.symmetric(horizontal: 16.w),
                    //   child: const MessagesTopContainer(),
                    // ),
                    // SizedBox(height: 15.h),
                    const Divider(
                      color: Color(0XFFEFEFEF),
                      thickness: 1,
                    ),
                    Expanded(
                      child: SizedBox(
                        width: 1.sw,
                        child: FutureBuilder<List<Map<String, dynamic>>>(
                            future: getAllUsers(),
                            builder: (context, snapshot) {
                              return snapshot.hasData == false
                                  ? const Center(
                                      child: CircularProgressIndicator(),
                                    )
                                  : snapshot.data == null
                                      ? const Center(
                                          child: Text('No Users Found'),
                                        )
                                      : ListView.builder(
                                          padding: EdgeInsets.only(
                                              left: 32.w,
                                              top: 18.h,
                                              right: 32.w,
                                              bottom: 65.h),
                                          itemCount: snapshot.data!.length,
                                          shrinkWrap: true,
                                          physics:
                                              const BouncingScrollPhysics(),
                                          itemBuilder: (context, index) {
                                            // MessagesModel messages =
                                            //     tempMessagesList[index];
                                            return Padding(
                                              padding:
                                                  EdgeInsets.only(bottom: 20.h),
                                              child: InboxMessageContainer(
                                                onTap: () {
                                                  // Navigator.pushNamed(
                                                  //     context, AppRoutes.chatScreen);
                                                  Get.to(() => ChatScreen());
                                                },
                                                image: snapshot.data![index]
                                                    ['imageUrl'],
                                                name: snapshot.data![index]
                                                    ['firstName'],
                                                message: '',
                                                time: 'time',
                                                messageNumber: '12',
                                                isOnline: true,
                                                isRead: false,
                                              ),
                                            );
                                          },
                                        );
                            }),
                      ),
                    ),
                  ],
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
      ),
    );
  }

  Future<List<Map<String, dynamic>>> getAllUsers() async {
    log('getAllUsers');
    final QuerySnapshot querySnapshot =
        await FirebaseFirestore.instance.collection('users').get();
    final List<Map<String, dynamic>> users = [];
    for (QueryDocumentSnapshot doc in querySnapshot.docs) {
      final Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
      log('getAllUsers : ${data['email']}');
      users.add(data);
    }
    return users;
  }
}

class InboxMessageContainer extends StatelessWidget {
  const InboxMessageContainer({
    super.key,
    required this.image,
    required this.name,
    required this.message,
    required this.time,
    required this.messageNumber,
    required this.onTap,
    required this.isOnline,
    required this.isRead,
  });
  final String image;
  final String name;
  final String message;
  final String time;
  final String messageNumber;
  final VoidCallback onTap;
  final bool isOnline;
  final bool isRead;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: SizedBox(
        height: 56.h,
        child: Row(
          children: [
            Stack(
              alignment: Alignment.bottomRight,
              children: [
                Container(
                  height: 48.h,
                  width: 48.w,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(image),
                    ),
                  ),
                ),
                isOnline
                    ? Container(
                        height: 12.h,
                        width: 12.w,
                        padding: const EdgeInsets.all(1.5),
                        decoration: const BoxDecoration(
                            shape: BoxShape.circle, color: whiteColor),
                        child: Container(
                          decoration: const BoxDecoration(
                              shape: BoxShape.circle, color: Color(0xFF2CC069)),
                        ),
                      )
                    : const SizedBox.shrink(),
              ],
            ),
            SizedBox(width: 16.w),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                workSansText(
                  text: name,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w600,
                  color: const Color(0XFF0F1828),
                ),
                SizedBox(height: 3.h),
                SizedBox(
                  width: 200.w,
                  child: workSansText(
                    text: message,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.normal,
                    color: const Color(0XFFADB5BD),
                  ),
                ),
              ],
            ),
            const Spacer(),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                isOnline
                    ? workSansText(
                        text: time,
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w600,
                        color: blackColor,
                      )
                    : workSansText(
                        text: time,
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w600,
                        color: const Color(0XFFA4A4A4),
                      ),
                SizedBox(height: 3.h),
                isRead
                    ? SizedBox(
                        height: 22.h,
                        width: 22.w,
                      )
                    : Container(
                        height: 22.h,
                        width: 22.w,
                        margin: EdgeInsets.only(top: 5.h),
                        decoration: const BoxDecoration(
                            shape: BoxShape.circle, color: Color(0xFFE94242)),
                        child: Center(
                          child: workSansText(
                              text: messageNumber,
                              fontSize: 9.sp,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
