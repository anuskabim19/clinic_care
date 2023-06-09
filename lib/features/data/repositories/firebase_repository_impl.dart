
import 'package:clinic_app/features/data/data_sources/firebase_remote_data_source.dart';
import 'package:clinic_app/features/domain/entities/doctor_entity.dart';
import 'package:clinic_app/features/domain/entities/hospital_entity.dart';
import 'package:clinic_app/features/domain/entities/my_chat_entity.dart';
import 'package:clinic_app/features/domain/entities/text_messsage_entity.dart';
import 'package:clinic_app/features/domain/entities/user_entity.dart';
import 'package:clinic_app/features/domain/repositories/firebase_repository.dart';

class FirebaseRepositoryImpl implements FirebaseRepository {
  final FirebaseRemoteDataSource remoteDataSource;

  FirebaseRepositoryImpl({required this.remoteDataSource});

  @override
  Future<void> signIn(String email, String password) =>
      remoteDataSource.signIn(email, password);

  @override
  Future<void> signUp(String email, String password) =>
      remoteDataSource.signUp(email, password);

  @override
  Future<void> getCreateCurrentUser(UserEntity user) async =>
      await remoteDataSource.getCreateCurrentUser(user);

  @override
  Future<String> getCurrentUId() async =>
      await remoteDataSource.getCurrentUId();

  @override
  Future<bool> isSignIn() async => await remoteDataSource.isSignIn();

  Future<void> signInWithPhoneNumber(String pinCode) async =>
      await remoteDataSource.signInWithPhoneNumber(pinCode);

  @override
  Future<void> signOut() async => await remoteDataSource.signOut();

  Future<void> verifyPhoneNumber(String phoneNumber) async {
    await remoteDataSource.verifyPhoneNumber(phoneNumber);
  }

  @override
  Stream<List<UserEntity>> getAllUsers() => remoteDataSource.getAllUsers();

  @override
  Future<void> createOneToOneChatChannel(String uid, String otherUid) async =>
      remoteDataSource.createOneToOneChatChannel(
          uid: uid, otherUid: otherUid);

  @override
  Future<void> sendTextMessage(
          TextMessageEntity textMessageEntity, String channelId) async =>
      remoteDataSource.sendTextMessage(textMessageEntity, channelId);
  @override
  Stream<List<TextMessageEntity>> getMessages(String channelId) {
    return remoteDataSource.getMessages(channelId);
  }

  @override
  Future<String> getOneToOneSingleUserChannelId(
      String uid, String otherUid) async {
    return remoteDataSource.getOneToOneSingleUserChannelId(uid, otherUid);
  }

  @override
  Future<void> googleSignIn() async => remoteDataSource.googleSignIn();

  @override
  Future<void> addToMyChat(MyChatEntity myChatEntity) async =>
      remoteDataSource.addToMyChat(myChatEntity);

  @override
  Stream<List<MyChatEntity>> getMyChat(String uid) =>
      remoteDataSource.getMyChat(uid);

  @override
  Stream<List<HospitalEntity>> getHospitals() {
   return remoteDataSource.getHospitals();
  }

  @override
  Stream<List<DoctorEntity>> getHospitalDetails(String hospitalId) =>
       remoteDataSource.getHospitalDetails(hospitalId);

  @override
  Future<void> sendMessage(TextMessageEntity textMessageEntity, String channelId) async =>
      remoteDataSource.sendMessage(textMessageEntity, channelId);

  @override
  Future<void> deleteSingleMessage(String channelId, String messageId) async =>
      remoteDataSource.deleteSingleMessage(channelId, messageId);

  @override
  Future<void> updateSingleMessage(String channelId, String messageId, bool isOPD) async =>
      remoteDataSource.updateSingleMessage(channelId, messageId, isOPD);

  @override
  Future<void> myAppointment(MyChatEntity myChatEntity) async =>
      remoteDataSource.myAppointment(myChatEntity);

  @override
  Future<void> deleteMyAppointment(MyChatEntity myChatEntity) async =>
      remoteDataSource.deleteMyAppointment(myChatEntity);

  @override
  Stream<List<MyChatEntity>> getAppointments(String uid) =>
      remoteDataSource.getAppointments(uid);

}
