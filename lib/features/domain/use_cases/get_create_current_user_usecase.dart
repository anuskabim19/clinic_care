


import 'package:clinic_app/features/domain/entities/user_entity.dart';
import 'package:clinic_app/features/domain/repositories/firebase_repository.dart';

class GetCreateCurrentUserUseCase{
  final FirebaseRepository repository;

  GetCreateCurrentUserUseCase({required this.repository});

  Future<void> call(UserEntity user){
    return repository.getCreateCurrentUser(user);
  }
}