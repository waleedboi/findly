import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:findly/Core/controllers/main_controller.dart';
import 'package:findly/Models/chat_message_model.dart';
import 'package:findly/UI/MainBottomNavigationBar/Views/Chats/chat_viewmodel.dart';
import 'package:findly/UI/MainBottomNavigationBar/bottomshett_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../../../../Constant/assets_constant.dart';
import '../../../../../Constant/colors.dart';
import '../../../../Auth/Widgets/custom_auth_appbar.dart';

class SendButtonAndTextFiel extends StatelessWidget {
  const SendButtonAndTextFiel({
    super.key,
    required this.messageController,
  });
  final TextEditingController messageController;

  @override
  Widget build(BuildContext context) {
    return Consumer<ChatViewmodel>(builder: (context, model, chil) {
      return Padding(
        padding:
            EdgeInsets.only(right: 25.w, left: 25.w, bottom: 15.h, top: 15.h),
        child: Row(
          children: [
            Expanded(
              child: Focus(
                onFocusChange: (hasFocus) {
                  if (hasFocus) {
                    model.onTextFieldFocus();
                  }
                },
                child: TextField(
                  minLines: 1,
                  maxLines: 3,
                  controller: messageController,
                  decoration: InputDecoration(
                    prefixIcon: GestureDetector(
                      onTap: () {
                        model.toggleEmojiPicker(context);
                      },
                      child: Icon(
                        model.isEmojiPickerVisible
                            ? Icons.keyboard
                            : Icons.emoji_emotions_outlined,
                        color: const Color(0XFFA1A1A1),
                      ),
                    ),
                    suffixIcon: SizedBox(
                      width: 65.w,
                      child: Row(
                        children: [
                          GestureDetector(
                            onTap: () {
                              model.pickFile();
                              print("Attachment");
                            },
                            child: Image.asset(
                              attachment,
                              width: 16.w,
                              height: 16.h,
                            ),
                          ),
                          SizedBox(width: 10.w),
                          GestureDetector(
                            onTap: () {
                              model.captureImageFromCamera();
                              print("Camera");
                            },
                            child: Image.asset(
                              cameraoutline,
                              width: 24.w,
                              height: 24.h,
                            ),
                          ),
                        ],
                      ),
                    ),
                    fillColor: const Color(0XFFEFEFF4),
                    filled: true,
                    hintText: "Type a message",
                    hintStyle: const TextStyle(
                      color: Color(0XFFEFEFF4),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30.r),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              width: 8.w,
            ),
            GestureDetector(
              onTap: () {
                print(messageController.text);
                sendChatMessage(
                    context: context,
                    recieverId: MainController.to.singleAccomodation!.user.id,
                    isRead: false,
                    senderId: context.read<ChatViewmodel>().currentUserID);
                // sendMessage(context);
              },
              child: const IconCircleContainer(
                iconData: Icons.send,
                color: Color(0xFF0055D4),
                iconColor: whiteColor,
              ),
            )
          ],
        ),
      );
    });
  }

  void sendMessage(BuildContext context) async {
    final String currentUserID = context.read<ChatViewmodel>().currentUserID;
    log('currentUserID: $currentUserID');
    final String otherUserID = context.read<ChatViewmodel>().accomodationUserID;
    log('otherUserID: $otherUserID');
    final reciever = await FirebaseFirestore.instance
        .collection('users')
        .doc(otherUserID)
        .get();
    String recieverFirstName = reciever.get('firstName');
    String recieverLastName = reciever.get('lastName');
    log('senderFirstName: ${context.read<BottomshettViewmodel>().user.firstName}');
    log('senderLastName: ${context.read<BottomshettViewmodel>().user.lastName}');
    log('recieverFirstName: $recieverFirstName');
    log('recieverLastName: $recieverLastName');
    DocumentReference docRef = FirebaseFirestore.instance
        .collection('chats')
        .doc('$currentUserID$otherUserID');
    // Example milliseconds since epoch
    // String milliseconds = DateTime.now().millisecondsSinceEpoch.toString();
    // final data = await docRef.get();
    // String milliseconds = data.get('lastMessageTime');

    // // Parse to DateTime
    // DateTime parsedDate =
    //     DateTime.fromMillisecondsSinceEpoch(int.parse(milliseconds));
    // String timeElapsed = timeago.format(parsedDate);
    // log('parsed Date time: $timeElapsed');
    docRef.set({
      'senderID': currentUserID,
      'senderFirstName': context.read<BottomshettViewmodel>().user.firstName,
      'senderLastName': context.read<BottomshettViewmodel>().user.lastName,
      'recieverID': otherUserID,
      'content': messageController.text,
      'lastMessageTime': DateTime.now().millisecondsSinceEpoch.toString()
    }, SetOptions(merge: true));
    docRef.collection('messages').add({
      "firstName": context.read<BottomshettViewmodel>().user.firstName,
      "lastName": context.read<BottomshettViewmodel>().user.lastName,
      "senderID": context.read<BottomshettViewmodel>().user.id,
      'recieverID': otherUserID,
      "message": messageController.text,
      "dateTime": DateTime.now().millisecondsSinceEpoch.toString(),
    });
  }

  sendChatMessage(
      {required String senderId,
      required String recieverId,
      required bool isRead,
      required BuildContext context}) async {
    List<String> ids = [senderId, recieverId];
    ids.sort();
    String chatRoomId = ids.join("_");
    final doc = await FirebaseFirestore.instance
        .collection('chat_rooms')
        .doc(chatRoomId)
        .get();

    FirebaseFirestore.instance.collection('chat_rooms').doc(chatRoomId).set(
      {
        context.read<ChatViewmodel>().currentUserID : true,
        MainController.to.singleAccomodation!.user.id  :
            doc.get(MainController.to.singleAccomodation!.user.id),
      },
      SetOptions(merge: true),
    );

    ChatMessageModel chatMessage = ChatMessageModel(
      message: messageController.text,
      senderId: senderId,
      recieverId: recieverId,
      isRead: isRead,
      timestamp: Timestamp.now(),
    );


    FirebaseFirestore.instance
        .collection('chat_rooms')
        .doc(chatRoomId)
        .collection('messages')
        .add(chatMessage.toMap());

    FirebaseFirestore.instance
        .collection('users')
        .doc(senderId)
        .collection('messagedUsers')
        .doc(recieverId)
        .set({
      'recieverID': recieverId,
      'senderFirstName': context.read<BottomshettViewmodel>().user.firstName,
      'senderLastName': context.read<BottomshettViewmodel>().user.lastName,
      'content': messageController.text,
      'lastMessageTime': DateTime.now().millisecondsSinceEpoch.toString()
    });

    messageController.clear();
    // FirebaseFirestore.instance
    //     .collection('users')
    //     .doc(userID)
    //     .collection('messagedUsers')
    //     .doc(otherUserID)
    //     .set({
    //   'recieverID': MainController,
    //   'senderFirstName': context.read<BottomshettViewmodel>().user.firstName,
    //   'senderLastName': context.read<BottomshettViewmodel>().user.lastName,
    //   'recieverID': otherUserID,
    //   'content': messageController.text,
    //   'lastMessageTime': DateTime.now().millisecondsSinceEpoch.toString()
    // });
  }
}
