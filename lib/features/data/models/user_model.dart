import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:clinic_app/features/domain/entities/user_entity.dart';


class UserModel implements UserEntity {
  UserModel({
    required String name,
    required String email,
    required String uid,
    required String profileUrl,
    required String accountType,
    required bool isOnline,
    required String isHide,
  });

  factory UserModel.fromSnapshot(DocumentSnapshot<Object?> snapshot) {
  final data = snapshot.data() as Map<String, dynamic>?;
  return UserModel(
    name: data?['name'] as String,
    email: data?['email'] as String,
    uid: data?['uid'] as String,
    profileUrl: data?['profileUrl'] as String,
    accountType: data?['accountType'] as String,
    isOnline: data?['isOnline'] as bool? ?? false,
    isHide: data?['isHide']!,
  );
}



  Map<String, dynamic> toDocument() {
    return {
      "name": name,
      "email": email,
      "uid": uid,
      "profileUrl": profileUrl,
      "accountType": accountType,
      "isOnline": isOnline,
      "isHide": isHide,
    };
  }

  @override
  // TODO: implement accountType
  String get accountType => throw UnimplementedError();

  @override
  // TODO: implement email
  String get email => throw UnimplementedError();

  @override
  // TODO: implement isHide
  String get isHide => throw UnimplementedError();

  @override
  // TODO: implement isOnline
  bool get isOnline => throw UnimplementedError();

  @override
  // TODO: implement name
  String get name => throw UnimplementedError();

  @override
  // TODO: implement profileUrl
  String get profileUrl => throw UnimplementedError();

  @override
  // TODO: implement uid
  String get uid => throw UnimplementedError();
}
