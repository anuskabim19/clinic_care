import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:clinic_app/features/domain/entities/my_chat_entity.dart';
import 'package:clinic_app/features/domain/use_cases/delete_my_appointment_usecase.dart';
import 'package:clinic_app/features/domain/use_cases/get_appointments_usecase.dart';
import 'package:clinic_app/features/domain/use_cases/get_one_to_one_single_user_chat_channel_usecase.dart';
import 'package:clinic_app/features/domain/use_cases/my_appointment_usecase.dart';

part 'my_appointment_state.dart';

class MyAppointmentCubit extends Cubit<MyAppointmentState> {
  final MyAppointmentUseCase myAppointmentUseCase;
  final GetAppointmentUseCase getAppointmentUseCase;
  final DeleteMyAppointmentUseCase deleteMyAppointmentUseCase;
  final GetOneToOneSingleUserChatChannelUseCase getOneToOneSingleUserChatChannelUseCase;
  MyAppointmentCubit({required this.getAppointmentUseCase,required this.deleteMyAppointmentUseCase,required this.myAppointmentUseCase,required this.getOneToOneSingleUserChatChannelUseCase}) : super(MyAppointmentInitial());

  Future<void> confirmAppointment({
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

      await myAppointmentUseCase.call(MyChatEntity(
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
  Future<void> deleteMyAppointment({
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
      await deleteMyAppointmentUseCase.call(MyChatEntity(
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
        isArchived: false, channelId: '',
      ));

    } on SocketException catch (_) {
      print("failure");
    } catch (_) {
      print("failure");
    }
  }

  Future<void> getAppointments({required String uid})async{

    try{
      final streamResponse=getAppointmentUseCase.call(uid);
      streamResponse.listen((event) {
        emit(MyAppointmentLoaded(
          myAppointmentData: event,
        ));
      });
    }on SocketException catch(_){

    }catch(_){

    }
  }
}
