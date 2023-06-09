import 'package:clinic_app/features/domain/repositories/firebase_repository.dart';

class UpdateSingleMessageUseCase{
  final FirebaseRepository repository;

  UpdateSingleMessageUseCase({required this.repository});

  Future<void> call(String channelId,String messageId,bool isOPD){
    return repository.updateSingleMessage(channelId, messageId, isOPD);
  }
}