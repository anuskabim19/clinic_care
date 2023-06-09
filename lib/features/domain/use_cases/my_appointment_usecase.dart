import 'package:clinic_app/features/domain/entities/my_chat_entity.dart';
import 'package:clinic_app/features/domain/repositories/firebase_repository.dart';

class MyAppointmentUseCase{
  final FirebaseRepository repository;

  MyAppointmentUseCase({required this.repository});

  Future<void> call(MyChatEntity myChatEntity)async{
    return await repository.myAppointment(myChatEntity);
  }

}