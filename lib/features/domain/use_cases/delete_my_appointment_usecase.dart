
import 'package:clinic_app/features/domain/entities/my_chat_entity.dart';
import 'package:clinic_app/features/domain/repositories/firebase_repository.dart';

class DeleteMyAppointmentUseCase{
  final FirebaseRepository repository;

  DeleteMyAppointmentUseCase({required this.repository});

  Future<void> call(MyChatEntity chatEntity){
    return repository.deleteMyAppointment(chatEntity);
  }
}