import 'package:clinic_app/features/domain/entities/my_chat_entity.dart';
import 'package:clinic_app/features/domain/repositories/firebase_repository.dart';

class GetAppointmentUseCase{
  final FirebaseRepository repository;

  GetAppointmentUseCase({required this.repository});

 Stream<List<MyChatEntity>> call(String uid){
  return repository.getAppointments(uid);
 }
}