import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cloud_firestore_platform_interface/src/timestamp.dart';
import 'package:clinic_app/features/domain/entities/my_chat_entity.dart';

class MyChatModel extends MyChatEntity {
  MyChatModel({
   required String senderName,
   required String senderUID,
   required String recipientName,
   required String recipientUID,
   required String channelId,
   required String profileURL,
   required String recipientPhoneNumber,
   required String senderPhoneNumber,
   required String recentTextMessage,
   required bool isRead,
   required bool isArchived,
   required Timestamp time,
  }) : super(
          senderName: senderName,
          senderUID: senderUID,
          recipientName: recipientName,
          recipientUID: recipientUID,
          channelId: channelId,
          profileURL: profileURL,
          recipientPhoneNumber: recipientPhoneNumber,
          senderPhoneNumber: senderPhoneNumber,
          recentTextMessage: recentTextMessage,
          isRead: isRead,
          isArchived: isArchived,
          time: time,
        );

  factory MyChatModel.fromSnapshot(DocumentSnapshot snapshot) {
  final data = snapshot.data() as Map<String, dynamic>?;

  return MyChatModel(
    senderName: data?['senderName'] as String,
    senderUID: data?['senderUID'] as String,
    senderPhoneNumber: data?['senderPhoneNumber'] as String,
    recipientName: data?['recipientName'] as String,
    recipientUID: data?['recipientUID'] as String,
    recipientPhoneNumber: data?['recipientPhoneNumber'] as String,
    channelId: data?['channelId'] as String,
    time: data?['time'] as Timestamp,
    isArchived: data?['isArchived'] as bool,
    isRead: data?['isRead'] as bool,
    recentTextMessage: data?['recentTextMessage'] as String,
    profileURL: data?['profileURL'] as String,
  );
}


  Map<String, dynamic> toDocument() {
    return {
      "senderName": senderName,
      "senderUID": senderUID,
      "recipientName": recipientName,
      "recipientUID": recipientUID,
      "channelId": channelId,
      "profileURL": profileURL,
      "recipientPhoneNumber": recipientPhoneNumber,
      "senderPhoneNumber": senderPhoneNumber,
      "recentTextMessage": recentTextMessage,
      "isRead": isRead,
      "isArchived": isArchived,
      "time": time,
    };
  }
}
