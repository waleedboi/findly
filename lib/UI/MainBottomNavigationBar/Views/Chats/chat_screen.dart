import 'dart:developer';
import 'dart:io';

import 'package:bubble/bubble.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:emoji_picker_flutter/emoji_picker_flutter.dart';
import 'package:findly/Constant/assets_constant.dart';
import 'package:findly/Constant/enum.dart';
import 'package:findly/Core/Custom/container_widget.dart';
import 'package:findly/Models/AccommodationModels/accommodation_model.dart';
import 'package:findly/UI/Auth/Widgets/custom_auth_appbar.dart';
import 'package:findly/UI/MainBottomNavigationBar/Views/AccommoadtionSection/View/OpenAccomodationListing/open_accommodation_listing_screen.dart';
import 'package:findly/UI/MainBottomNavigationBar/Views/Chats/chat_viewmodel.dart';
import 'package:findly/UI/MainBottomNavigationBar/Views/GraduationPhtographySection/PhotoGrapherDetails/photographer_details.dart';
import 'package:findly/UI/MainBottomNavigationBar/Views/MarketPlaceSection/MarketPlaceItemDetails/marketplace_itemdetails.dart';
import 'package:findly/UI/MainBottomNavigationBar/bottomshett_viewmodel.dart';
import 'package:firebase_auth/firebase_auth.dart' as Auth;
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../../../../Constant/colors.dart';
import '../../../../Constant/text_constant.dart';
import '../../../../Core/controllers/main_controller.dart';
import 'Widgets/messages_related_container.dart';
import 'Widgets/sendbutton_and_textfield.dart';

class ColorConstants {
  static const themeColor = Color(0xfff5a623);
  static const primaryColor = Color(0xff203152);
  static const greyColor = Color(0xffaeaeae);
  static const greyColor2 = Color(0xffE8E8E8);
}

class TypeMessage {
  static const text = 0;
  static const image = 1;
  static const sticker = 2;
}

class ChatScreen extends StatefulWidget {
  ChatScreen({
    super.key,
    this.serviceType,
  });

  final ServiceType? serviceType;

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final TextEditingController messageController = TextEditingController();
  String _currentUserId = '';

  List<QueryDocumentSnapshot> _listMessage = [];
  int _limit = 20;
  final _limitIncrement = 20;
  String _groupChatId = "";

  File? _imageFile;
  bool _isLoading = false;
  bool _isShowSticker = false;
  String _imageUrl = "";

  final _chatInputController = TextEditingController();
  final _listScrollController = ScrollController();
  final _focusNode = FocusNode();
  String otherUserOnlineStatus = "Offline";

  // late final _chatProvider = context.read<ChatProvider>();
  // late final _authProvider = context.read<AuthProvider>();

  @override
  void initState() {
    super.initState();
    // getOtherUserData();
    setIsInsideChat();
    _focusNode.addListener(_onFocusChange);
    _listScrollController.addListener(_scrollListener);
    _readLocal();
  }

  String recieverFirstName = '';
  String recieverLastName = '';

  // getOtherUserData() async {
  //   final reciever = await FirebaseFirestore.instance
  //       .collection('users')
  //       .doc(context.read<ChatViewmodel>().accomodationUserID)
  //       .get();
  //   recieverFirstName = reciever.get('firstName');
  //   recieverLastName = reciever.get('lastName');
  // }

  @override
  void dispose() {
    _chatInputController.dispose();
    _listScrollController
      ..removeListener(_scrollListener)
      ..dispose();
    super.dispose();
  }

  setIsInsideChat() async {
    // recieverId: MainController.to.singleAccomodation!.user.id,
    // context.read<ChatViewmodel>().currentUserID
    List<String> ids = [
      context.read<ChatViewmodel>().currentUserID,
      MainController.to.singleAccomodation!.user.id
    ];

    ids.sort();
    String chatRoomId = ids.join("_");
    final doc = await FirebaseFirestore.instance
        .collection('chat_rooms')
        .doc(chatRoomId)
        .get();

    if (!doc.exists) {
      await FirebaseFirestore.instance
          .collection('chat_rooms')
          .doc(chatRoomId)
          .set(
        {
          context.read<ChatViewmodel>().currentUserID: {
            'unreadMessagesCount': 0,
            'isOnline': true,
          },
          MainController.to.singleAccomodation!.user.id: {
            'unreadMessagesCount': 0,
            'isOnline': false,
          },
        },
        SetOptions(merge: true),
      );
    }

    otherUserOnlineStatus =
        doc.get(MainController.to.singleAccomodation!.user.id)['isOnline']
            ? "Online"
            : "Offline";

    FirebaseFirestore.instance.collection('chat_rooms').doc(chatRoomId).set(
      {
        context.read<ChatViewmodel>().currentUserID: {
          'unreadMessagesCount': 0,
          'isOnline': otherUserOnlineStatus == "Online" ? true : false,
        },

        // MainController.to.singleAccomodation!.user.id:
        //     doc.get(MainController.to.singleAccomodation!.user.id),
      },
      SetOptions(merge: true),
    );
  }

  void _scrollListener() {
    if (!_listScrollController.hasClients) return;
    if (_listScrollController.offset >=
            _listScrollController.position.maxScrollExtent &&
        !_listScrollController.position.outOfRange &&
        _limit <= _listMessage.length) {
      setState(() {
        _limit += _limitIncrement;
      });
    }
  }

  void _onFocusChange() {
    if (_focusNode.hasFocus) {
      // Hide sticker when keyboard appear
      setState(() {
        _isShowSticker = false;
      });
    }
  }

  void _readLocal() {
    if (Auth.FirebaseAuth.instance.currentUser?.uid == true) {
      _currentUserId = Auth.FirebaseAuth.instance.currentUser!.uid;
      MainController.to.currentUserId = _currentUserId;
    } else {
      // Navigator.of(context).pushAndRemoveUntil(
      //   MaterialPageRoute(builder: (_) => LoginPage()),
      //   (_) => false,
      // );
    }
    String peerId = ''; //widget.arguments.peerId;
    if (_currentUserId.compareTo(peerId) > 0) {
      _groupChatId = '$_currentUserId-$peerId';
    } else {
      _groupChatId = '$peerId-$_currentUserId';
    }

    // _chatProvider.updateDataFirestore(
    //   FirestoreConstants.pathUserCollection,
    //   _currentUserId,
    //   {FirestoreConstants.chattingWith: peerId},
    // );
  }

  void _onBackPress() async {
    List<String> ids = [
      context.read<ChatViewmodel>().currentUserID,
      MainController.to.singleAccomodation!.user.id
    ];
    ids.sort();
    String chatRoomId = ids.join("_");
    final doc = await FirebaseFirestore.instance
        .collection('chat_rooms')
        .doc(chatRoomId)
        .get();

    FirebaseFirestore.instance.collection('chat_rooms').doc(chatRoomId).set(
      {
        MainController.to.currentUserId: {
          'isOnline': false,
        },
        // MainController.to.singleAccomodation!.user.id:
        //     doc.get(MainController.to.singleAccomodation!.user.id),
      },
      SetOptions(merge: true),
    );
    // _chatProvider.updateDataFirestore(
    //   FirestoreConstants.pathUserCollection,
    //   _currentUserId,
    //   {FirestoreConstants.chattingWith: null},
    // );
    // Navigator.pop(context);
  }

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
    return PopScope(
      onPopInvokedWithResult: (didPop, result) {
        log('back pressed');
        _onBackPress();
      },
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        body: Consumer<ChatViewmodel>(builder: (context, model, chil) {
          return BlueContainer(
            child: Stack(
              fit: StackFit.loose,
              children: [
                Positioned(
                  top: 55.h,
                  child: SizedBox(
                    width: 1.sw,
                    child: ChatAppBar(
                        // text: '$recieverFirstName $recieverLastName',
                        text:
                            '${MainController.to.singleAccomodation?.user.firstName}',
                        status: otherUserOnlineStatus,
                        profile: profile1),
                  ),
                ),
                WhiteContainer(
                  // height: 0.87.sh,
                  topPadding: 117.h,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 18.0),
                        child: MessageRelatedContainer(
                          onTap: () {
                            if (widget.serviceType == ServiceType.photography) {
                              Get.to(const PhotographerDetails(
                                isBookMarked: false,
                                index: 0,
                              ));
                            } else if (widget.serviceType ==
                                ServiceType.accommodation) {
                              Get.to(OpenAccommodationListingScreen(
                                accommodationModel: accomodationList[0],
                                index: 0,
                                isBookmarked: false,
                              ));
                            } else if (widget.serviceType ==
                                ServiceType.marketplace) {
                              Get.to(MarketplaceItemdetails(
                                isBookMarked: false,
                                index: 0,
                              ));
                            }
                          },
                        ),
                      ),
                      Flexible(
                        fit: FlexFit.loose,
                        child: StreamBuilder(
                            stream: getInboxChats(context),
                            builder: (context, snapshots) {
                              if (snapshots.hasError) {
                                return const Text(
                                    'Error while getting messages');
                              }
                              if (snapshots.connectionState ==
                                  ConnectionState.waiting) {
                                return const Text('Loading messages');
                              }
                              return Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 18.0),
                                child: ListView(
                                  children:
                                      snapshots.data!.docs.map((document) {
                                    Timestamp firebaseTimestamp =
                                        document.get('timestamp');
                                    DateTime dateTime =
                                        firebaseTimestamp.toDate();
                                    log('----------------------------------------------------------------');
                                    log('senderId: ${document.get('senderId')}');
                                    log('recieverId: ${document.get('recieverId')}');
                                    log('recieverId mine: ${context.read<BottomshettViewmodel>().user.id}');
                                    log('----------------------------------------------------------------');
                                    String amPm =
                                        DateFormat('a').format(dateTime);
                                    return document.get('senderId') ==
                                            context
                                                .read<BottomshettViewmodel>()
                                                .user
                                                .id
                                        ? Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.end,
                                            mainAxisAlignment:
                                                MainAxisAlignment.end,
                                            children: [
                                              Expanded(
                                                child: Bubble(
                                                  style: styleMe(true),
                                                  child: Container(
                                                    constraints: BoxConstraints(
                                                        maxWidth: 248.w),
                                                    child: Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .end,
                                                      children: [
                                                        workSansText(
                                                          overflow: TextOverflow
                                                              .visible,
                                                          // text:
                                                          //     "I have 3 spaces, available 2 single rooms and I cottage",
                                                          text: document
                                                              .get('message'),
                                                          fontSize: 14.sp,
                                                          fontWeight:
                                                              FontWeight.normal,
                                                          color: whiteColor,
                                                        ),
                                                        SizedBox(height: 5.h),
                                                        workSansText(
                                                          // text: "11:00 AM",
                                                          text:
                                                              "${dateTime.toUtc().hour}:${dateTime.toUtc().minute} $amPm",
                                                          fontSize: 8.sp,
                                                          fontWeight:
                                                              FontWeight.normal,
                                                          color: whiteColor,
                                                        )
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              //  Container(
                                              //   height: 30.h,
                                              //   width: 30.w,
                                              //   decoration: BoxDecoration(
                                              //     color: whiteColor,
                                              //     shape: BoxShape.circle,
                                              //     image: DecorationImage(image: NetworkImage()),
                                              //   ),
                                              // ),
                                            ],
                                          )
                                        : Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.end,
                                            children: [
                                              ImageCircleContainer(
                                                height: 30.h,
                                                width: 30.w,
                                                profile: profile1,
                                              ),
                                              Expanded(
                                                child: Bubble(
                                                  style: styleSomebody(document
                                                              .get(
                                                                  'senderId') ==
                                                          context
                                                              .read<
                                                                  BottomshettViewmodel>()
                                                              .user
                                                              .id
                                                      ? true
                                                      : false),
                                                  child: Container(
                                                    constraints: BoxConstraints(
                                                        maxWidth: 248.w),
                                                    child: Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .end,
                                                      children: [
                                                        workSansText(
                                                          overflow: TextOverflow
                                                              .visible,
                                                          // text:
                                                          //     "Hey, i’m looking for accomodation",
                                                          text: document
                                                              .get('message'),
                                                          fontSize: 14.sp,
                                                          fontWeight:
                                                              FontWeight.normal,
                                                          color: const Color(
                                                              0XFF262628),
                                                        ),
                                                        SizedBox(height: 5.h),
                                                        workSansText(
                                                          // text: "11:00 AM",
                                                          text:
                                                              "${dateTime.toUtc().hour}:${dateTime.toUtc().minute} $amPm",
                                                          fontSize: 8.sp,
                                                          fontWeight:
                                                              FontWeight.normal,
                                                          color: const Color(
                                                              0XFF9B9B9B),
                                                        )
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          );
                                  }).toList(),
                                ),
                              );
                            }),
                        // child: FutureBuilder<List<Map<String, dynamic>>>(
                        //     future: getInboxChats(context),
                        //     builder: (context, snapshot) {
                        //       return snapshot.hasData == false
                        //           ? const Center(
                        //               child: CircularProgressIndicator(),
                        //             )
                        //           : snapshot.data == null
                        //               ? const Center(
                        //                   child: Text('No Messages'),
                        //                 )
                        //               : snapshot.data!.isEmpty
                        //                   ? const Center(
                        //                       child: Text('No Messages'),
                        //                     )
                        //                   : ListView.builder(
                        //                       reverse: false,
                        //                       physics: const ScrollPhysics(),
                        //                       padding: EdgeInsets.symmetric(
                        //                             horizontal: 24.w,
                        //                           ) +
                        //                           EdgeInsets.only(bottom: 0.h),
                        //                       itemCount: snapshot.data!.length,
                        //                       shrinkWrap: true,
                        //                       itemBuilder: (context, index) {
                        //                         // return Text(
                        //                         //     '${snapshot.data![index]['message']}');
                        //                         return ChatScreenWidget(
                        //                           isme: true,
                        //                           index: index,
                        //                           date: DateTime
                        //                               .fromMillisecondsSinceEpoch(
                        //                                   int.parse(snapshot
                        //                                           .data![index]
                        //                                       ['dateTime'])),
                        //                           text: snapshot.data![index]
                        //                               ['message'],
                        //                         );
                        //                       },
                        //                     );
                        // : ListView.builder(
                        //     reverse: true,
                        //     physics: const ScrollPhysics(),
                        //     padding: EdgeInsets.symmetric(
                        //           horizontal: 24.w,
                        //         ) +
                        //         EdgeInsets.only(bottom: 0.h),
                        //     itemCount: snapshot.data!.length,
                        //     shrinkWrap: true,
                        //     itemBuilder: (context, index) {
                        //       bool isme = index % 2 == 0;
                        //       bool showGroupLabel = index ==
                        //               0 ||
                        //           messages[index].date.day !=
                        //               messages[index - 1]
                        //                   .date
                        //                   .day;

                        //       return Column(
                        //         crossAxisAlignment:
                        //             CrossAxisAlignment.center,
                        //         children: [
                        //           if (showGroupLabel)
                        //             Padding(
                        //               padding:
                        //                   EdgeInsets.symmetric(
                        //                       vertical: 8.h),
                        //               child: Text(
                        //                 getGroupLabel(
                        //                     messages[index]
                        //                         .date),
                        //                 style: GoogleFonts.workSans(
                        //                     fontSize: 12.sp,
                        //                     fontWeight:
                        //                         FontWeight
                        //                             .normal,
                        //                     color: const Color(
                        //                         0XFF9B9B9B)),
                        //               ),
                        //             ),
                        //           index == 0 ||
                        //                   index ==
                        //                       messages.length -
                        //                           1
                        //               ? MessageRelatedContainer(
                        //                   onTap: () {
                        //                     if (widget
                        //                             .serviceType ==
                        //                         ServiceType
                        //                             .photography) {
                        //                       Get.to(
                        //                           const PhotographerDetails(
                        //                         isBookMarked:
                        //                             false,
                        //                         index: 0,
                        //                       ));
                        //                     } else if (widget
                        //                             .serviceType ==
                        //                         ServiceType
                        //                             .accommodation) {
                        //                       Get.to(
                        //                           OpenAccommodationListingScreen(
                        //                         accommodationModel:
                        //                             accomodationList[
                        //                                 0],
                        //                         index: 0,
                        //                         isBookmarked:
                        //                             false,
                        //                       ));
                        //                     } else if (widget
                        //                             .serviceType ==
                        //                         ServiceType
                        //                             .marketplace) {
                        //                       Get.to(
                        //                           MarketplaceItemdetails(
                        //                         isBookMarked:
                        //                             false,
                        //                         index: 0,
                        //                       ));
                        //                     }
                        //                   },
                        //                 )
                        //               : ChatScreenWidget(
                        //                   isme: isme,
                        //                   index: index),
                        //         ],
                        //       );
                        //     },
                        //   );
                        // }),
                      ),
                      SendButtonAndTextFiel(
                        messageController: model.sendMessageController,
                      ),
                      Offstage(
                        offstage: !model.isEmojiPickerVisible,
                        child: EmojiPicker(
                          textEditingController: model.sendMessageController,
                          scrollController: model.scrollController,
                          config: const Config(
                            height: 256,
                            checkPlatformCompatibility: true,
                            emojiViewConfig: EmojiViewConfig(
                              // Issue: https://github.com/flutter/flutter/issues/28894
                              emojiSizeMax: 28 * 1.0,
                            ),
                            swapCategoryAndBottomBar: false,
                            // skinToneConfig: SkinToneConfig(),
                            categoryViewConfig: CategoryViewConfig(),
                            bottomActionBarConfig: BottomActionBarConfig(
                                showSearchViewButton: false,
                                showBackspaceButton: false),
                            // searchViewConfig: SearchViewConfig(),
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          );
        }),
        // floatingActionButton: const SendButtonAndTextFiel(),
        // floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      ),
    );
  }

  Stream<QuerySnapshot> getInboxChats(BuildContext context) {
    final String currentUserID = context.read<ChatViewmodel>().currentUserID;
    final String otherUserID = context.read<ChatViewmodel>().accomodationUserID;
    List<String> ids = [currentUserID, otherUserID];
    ids.sort();
    String chatRoomId = ids.join("_");
    return FirebaseFirestore.instance
        .collection('chat_rooms')
        .doc(chatRoomId)
        .collection('messages')
        .orderBy('timestamp', descending: false)
        .snapshots();
    // DocumentReference docRef = FirebaseFirestore.instance
    //     .collection('chats')
    //     .doc('$currentUserID$otherUserID');
    // DocumentSnapshot docSnapshot = await docRef.get();
    // bool exists = docSnapshot.exists;
    // DocumentReference? chatReference;
    // if (exists) {
    //   chatReference = docRef;
    // } else {
    //   chatReference = FirebaseFirestore.instance
    //       .collection('chats')
    //       .doc('$otherUserID$currentUserID');
    // }

    // QuerySnapshot<Map<String, dynamic>> snapshot =
    //     await chatReference.collection('messages').get();
    // // setState(() {});
    // return snapshot.docs.map((doc) {
    //   print('messages: ${doc.get('message')}');
    //   return doc.data();
    // }).toList();
  }

  // Future<List<Map<String, dynamic>>> getInboxChats(BuildContext context) async {
  //   final String currentUserID = context.read<ChatViewmodel>().currentUserID;
  //   final String otherUserID = context.read<ChatViewmodel>().accomodationUserID;
  //   DocumentReference docRef = FirebaseFirestore.instance
  //       .collection('chats')
  //       .doc('$currentUserID$otherUserID');
  //   DocumentSnapshot docSnapshot = await docRef.get();
  //   bool exists = docSnapshot.exists;
  //   DocumentReference? chatReference;
  //   if (exists) {
  //     chatReference = docRef;
  //   } else {
  //     chatReference = FirebaseFirestore.instance
  //         .collection('chats')
  //         .doc('$otherUserID$currentUserID');
  //   }

  //   QuerySnapshot<Map<String, dynamic>> snapshot =
  //       await chatReference.collection('messages').get();
  //   return snapshot.docs.map((doc) => doc.data()).toList();
  // }
}

// class CustomChat extends StatelessWidget {
//   const CustomChat({
//     super.key,
//   });

//   // Define WIDTH here

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       constraints: BoxConstraints(maxWidth: 248.w),
//       child: CustomPaint(
//         size: const Size(200, 69),
//         painter: RPSCustomPainter(),
//         child: const Column(
//           mainAxisAlignment: MainAxisAlignment.end,
//           children: [
//             Text(
//                 "Hello i want to meet here jdfkjsd kjbfks akjbkjasjk kjafb j j jfj kfj akb fb "),
//             Text("11:00 am"),
//           ],
//         ),
//       ),
//     );
//   }
// }

//Copy this CustomPainter code to the Bottom of the File

class Message {
  final String content;
  final DateTime date;

  Message({required this.content, required this.date});
}

String getGroupLabel(DateTime date) {
  final now = DateTime.now();
  final today = DateTime(now.year, now.month, now.day);
  final yesterday = today.subtract(const Duration(days: 1));

  if (date.isAfter(today)) {
    return "Today";
  } else if (date.isAfter(yesterday)) {
    return "Yesterday";
  } else {
    return "${date.day} ${date.month} ${date.year}";
  }
}

List<Message> messages = [
  Message(
      content: "Hello", date: DateTime.now().subtract(const Duration(days: 1))),
  Message(
      content: "How are you?",
      date: DateTime.now().subtract(const Duration(days: 1))),
  Message(content: "I'm fine", date: DateTime.now()),
  Message(content: "Good to hear", date: DateTime.now()),
  Message(
      content: "Hello", date: DateTime.now().subtract(const Duration(days: 1))),
  Message(
      content: "How are you?",
      date: DateTime.now().subtract(const Duration(days: 1))),
  Message(content: "I'm fine", date: DateTime.now()),
  Message(content: "Good to hear", date: DateTime.now()),
  Message(
      content: "Hello", date: DateTime.now().subtract(const Duration(days: 1))),
  Message(
      content: "How are you?",
      date: DateTime.now().subtract(const Duration(days: 1))),
  Message(content: "I'm fine", date: DateTime.now()),
  Message(content: "Good to hear", date: DateTime.now()),
  Message(
      content: "Hello", date: DateTime.now().subtract(const Duration(days: 1))),
  Message(
      content: "How are you?",
      date: DateTime.now().subtract(const Duration(days: 1))),
  Message(content: "I'm fine", date: DateTime.now()),
  Message(content: "Good to hear", date: DateTime.now()),
  Message(
      content: "Hello", date: DateTime.now().subtract(const Duration(days: 1))),
  Message(
      content: "How are you?",
      date: DateTime.now().subtract(const Duration(days: 1))),
  Message(content: "I'm fine", date: DateTime.now()),
  Message(content: "Good to hear", date: DateTime.now()),
  Message(
      content: "Hello", date: DateTime.now().subtract(const Duration(days: 1))),
  Message(
      content: "How are you?",
      date: DateTime.now().subtract(const Duration(days: 1))),
  Message(content: "I'm fine", date: DateTime.now()),
  Message(content: "Good to hear", date: DateTime.now()),
  Message(
      content: "Hello", date: DateTime.now().subtract(const Duration(days: 1))),
  Message(
      content: "How are you?",
      date: DateTime.now().subtract(const Duration(days: 1))),
  Message(content: "I'm fine", date: DateTime.now()),
  Message(content: "Good to hear", date: DateTime.now()),
  Message(
      content: "Hello", date: DateTime.now().subtract(const Duration(days: 1))),
];
