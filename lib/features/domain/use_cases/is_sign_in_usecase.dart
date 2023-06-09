import 'package:clinic_app/features/domain/repositories/firebase_repository.dart';

class IsSignInUseCase {

  final FirebaseRepository repository;

  IsSignInUseCase({required this.repository});

  Future<bool> call()async{
    return repository.isSignIn();
  }
}