import 'package:clinic_app/features/domain/entities/text_messsage_entity.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class TextMessageModel implements TextMessageEntity {
  TextMessageModel({
    required String senderName,
    required String sederUID,
    required String recipientName,
    required String recipientUID,
    required String messageType,
    required String message,
    required bool isOdp,
    required String messageId,
    required Timestamp time, required String senderUID,
  });
  factory TextMessageModel.fromSnapshot(DocumentSnapshot snapshot) {
  final data = snapshot.data() as Map<String, dynamic>?;

  return TextMessageModel(
    senderName: data?['senderName'] as String,
    senderUID: data?['senderUID'] as String,
    recipientName: data?['recipientName'] as String,
    recipientUID: data?['recipientUID'] as String,
    messageType: data?['messageType'] as String,
    message: data?['message'] as String,
    isOdp: data?['isOdp'] as bool,
    messageId: data?['messageId'] as String,
    time: data?['time'] as Timestamp, sederUID: '',
  );
}

  Map<String, dynamic> toDocument() {
    return {
      "senderName": senderName,
      "sederUID": sederUID,
      "recipientName": recipientName,
      "recipientUID": recipientUID,
      "messageType": messsageType,
      "message": message,
      "isOdp": isOdp,
      "messageId": messageId,
      "time": time,
    };
  }

  @override
  // TODO: implement isOdp
  bool get isOdp => throw UnimplementedError();

  @override
  // TODO: implement message
  String get message => throw UnimplementedError();

  @override
  // TODO: implement messageId
  String get messageId => throw UnimplementedError();

  @override
  // TODO: implement messsageType
  String get messsageType => throw UnimplementedError();

  @override
  // TODO: implement props
  List<Object> get props => throw UnimplementedError();

  @override
  // TODO: implement recipientName
  String get recipientName => throw UnimplementedError();

  @override
  // TODO: implement recipientUID
  String get recipientUID => throw UnimplementedError();

  @override
  // TODO: implement sederUID
  String get sederUID => throw UnimplementedError();

  @override
  // TODO: implement senderName
  String get senderName => throw UnimplementedError();

  @override
  // TODO: implement stringify
  bool? get stringify => throw UnimplementedError();

  @override
  // TODO: implement time
  Timestamp get time => throw UnimplementedError();
}
