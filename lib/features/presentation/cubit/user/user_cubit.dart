import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:clinic_app/features/domain/entities/my_chat_entity.dart';
import 'package:clinic_app/features/domain/entities/text_messsage_entity.dart';
import 'package:clinic_app/features/domain/entities/user_entity.dart';
import 'package:clinic_app/features/domain/use_cases/add_to_my_chat_usecase.dart';
import 'package:clinic_app/features/domain/use_cases/create_one_to_one_chat_channel_usecase.dart';
import 'package:clinic_app/features/domain/use_cases/delete_single_message_usecase.dart';
import 'package:clinic_app/features/domain/use_cases/get_all_users_usecase.dart';
import 'package:clinic_app/features/domain/use_cases/get_one_to_one_single_user_chat_channel_usecase.dart';
import 'package:clinic_app/features/domain/use_cases/send_message_usecase.dart';
import 'package:clinic_app/features/domain/use_cases/update_single_message_usecase.dart';

part 'user_state.dart';

class UserCubit extends Cubit<UserState> {
  final SendMessageUseCase sendMessageUseCase;
  final GetAllUsersUseCase getAllUsersUseCase;
  final DeleteSingleMessageUseCase deleteSingleMessageUseCase;
  final UpdateSingleMessageUseCase updateSingleMessageUseCase;
  final AddToMyChatUseCase addToMyChatUseCase;
  final GetOneToOneSingleUserChatChannelUseCase getOneToOneSingleUserChatChannelUseCase;
  final CreateOneToOneChatChannelUseCase createOneToOneChatChannelUseCase;
  UserCubit({required this.updateSingleMessageUseCase,required this.deleteSingleMessageUseCase,required this.addToMyChatUseCase,required this.getOneToOneSingleUserChatChannelUseCase,required this.sendMessageUseCase,required this.getAllUsersUseCase,required this.createOneToOneChatChannelUseCase})
      : super(UserInitial());

  Future<void> createChatChannel({required String uid,required String otherUid})async{
    try{
      await createOneToOneChatChannelUseCase.call(uid, otherUid);
    }on SocketException catch(_){
      emit(UserFailure());
    }catch(_){
      emit(UserFailure());
    }
  }
  Future<void> getAllUsers() async {
    try {
      final streamResponse = getAllUsersUseCase.call();
      streamResponse.listen((response) {
        emit(UserLoaded(data: response));
      });
    } on SocketException catch (_) {
      emit(UserFailure());
    }
  }

  Future<void> sendTextMessage({
    required String senderName,
    required String senderId,
    required String recipientId,
    required String recipientName,
    required String message,
    required String recipientPhoneNumber,
    required String senderPhoneNumber,
    required String messageType,
  }) async {
    try {
      final channelId = await getOneToOneSingleUserChatChannelUseCase.call(
          senderId, recipientId);
      print(channelId);
      await sendMessageUseCase.call(
        TextMessageEntity(
          recipientName: recipientName,
          recipientUID: recipientId,
          senderName: senderName,
          time: Timestamp.now(),
          sederUID: senderId,
          message: message,
          messageId: "",
          messsageType: messageType,
        ),
        channelId,
      );
      await addToMyChatUseCase.call(MyChatEntity(
        time: Timestamp.now(),
        senderName: senderName,
        senderUID: senderId,
        senderPhoneNumber: senderPhoneNumber,
        recipientName: recipientName,
        recipientUID: recipientId,
        recipientPhoneNumber: recipientPhoneNumber,
        recentTextMessage: message,
        profileURL: "",
        isRead: true,
        isArchived: false,
        channelId: channelId,
      ));
    } on SocketException catch (_) {
      print("failure");
    } catch (_) {
      print("failure");
    }
  }

  Future<void> deleteSingleMessage({
   required String messageId,
   required String senderId,
   required String recipientId,
  }) async {
    try {
      final channelId = await getOneToOneSingleUserChatChannelUseCase.call(
          senderId, recipientId);
      print(channelId);
    deleteSingleMessageUseCase.call(channelId, messageId);
    } on SocketException catch (_) {
      print("failure");
    } catch (_) {
      print("failure");
    }
  }

  Future<void> updateSingleMessage({
   required String messageId,
   required String senderId,
   required String recipientId,
   required bool isOPD,
  }) async {
    try {
      final channelId = await getOneToOneSingleUserChatChannelUseCase.call(
          senderId, recipientId);
      print(channelId);
      updateSingleMessageUseCase.call(channelId, messageId, isOPD);
    } on SocketException catch (_) {
      print("failure");
    } catch (_) {
      print("failure");
    }
  }
}
