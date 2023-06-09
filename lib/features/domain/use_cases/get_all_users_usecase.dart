
import 'package:clinic_app/features/domain/entities/user_entity.dart';
import 'package:clinic_app/features/domain/repositories/firebase_repository.dart';

class GetAllUsersUseCase{
  final FirebaseRepository repository;

  GetAllUsersUseCase({required this.repository});

  Stream<List<UserEntity>> call(){
    return repository.getAllUsers();
  }
}