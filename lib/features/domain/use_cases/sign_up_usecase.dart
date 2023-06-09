import 'package:clinic_app/features/domain/repositories/firebase_repository.dart';

class SignUpUseCase{
  final FirebaseRepository repository;

  SignUpUseCase({required this.repository});

  Future<void> call(String email,String password){
    return repository.signUp(email, password);
  }
}