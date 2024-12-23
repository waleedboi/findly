import 'package:cloud_firestore/cloud_firestore.dart';

class ChatMessageModel {
  final String senderId;
  final String recieverId;
  final String message;
  final bool isRead;
  final Timestamp timestamp;

  ChatMessageModel(
      {required this.message,
      required this.senderId,
      required this.recieverId,
      required this.isRead,
      required this.timestamp});

  Map<String, dynamic> toMap() {
    return {
      'senderId': senderId,
      'recieverId': recieverId,
      'message': message,
      'isRead': isRead,
      'timestamp': timestamp,
    };
  }
}
