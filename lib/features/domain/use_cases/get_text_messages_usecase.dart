
import 'package:clinic_app/features/domain/entities/text_messsage_entity.dart';
import 'package:clinic_app/features/domain/repositories/firebase_repository.dart';

class GetTextMessagesUseCase{
  final FirebaseRepository repository;

  GetTextMessagesUseCase({required this.repository});

  Stream<List<TextMessageEntity>> call(String channelId){
    return repository.getMessages(channelId);
  }
}