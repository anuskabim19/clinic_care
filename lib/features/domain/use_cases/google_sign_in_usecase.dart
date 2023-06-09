import 'package:clinic_app/features/domain/repositories/firebase_repository.dart';

class GoogleSignInUseCase {
  final FirebaseRepository repository;

  GoogleSignInUseCase({required this.repository});

  Future<void> call() async {
    return repository.googleSignIn();
  }
}
