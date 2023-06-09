import 'package:clinic_app/features/domain/entities/text_messsage_entity.dart';
import 'package:clinic_app/features/domain/repositories/firebase_repository.dart';

class SendMessageUseCase {

  final FirebaseRepository repository;

  SendMessageUseCase({required this.repository});

  Future<void> call(TextMessageEntity textMessageEntity,String channelId)async{
    return repository.sendMessage(textMessageEntity, channelId);
  }
}