import 'package:clinic_app/features/domain/repositories/firebase_repository.dart';

class DeleteSingleMessageUseCase{
  final FirebaseRepository repository;

  DeleteSingleMessageUseCase({required this.repository});

  Future<void> call(String channelId,String messageId){
    return repository.deleteSingleMessage(channelId, messageId);
  }
}