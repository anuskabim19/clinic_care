

import 'package:clinic_app/features/domain/repositories/firebase_repository.dart';

class GetOneToOneSingleUserChannelIdUseCase{
  final FirebaseRepository repository;

  GetOneToOneSingleUserChannelIdUseCase({required this.repository});

  Future<String> call(String uid,String otherUid) async{
    return repository.getOneToOneSingleUserChannelId(uid, otherUid);
  }
}