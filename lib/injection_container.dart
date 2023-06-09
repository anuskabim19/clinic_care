import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';
import 'package:google_sign_in/google_sign_in.dart';

import 'features/data/data_sources/firebase_remote_data_source.dart';
import 'features/data/data_sources/firebase_remote_data_source_impl.dart';
import 'features/data/repositories/firebase_repository_impl.dart';
import 'features/domain/repositories/firebase_repository.dart';
import 'features/domain/use_cases/send_text_message_usecase.dart';
// ... import other use cases and cubits

final sl = GetIt.instance;

Future<void> init() async {
  // External dependencies
  final auth = FirebaseAuth.instance;
  final fireStore = FirebaseFirestore.instance;
  final googleSignInAuth = GoogleSignIn();

  // Data sources
  sl.registerLazySingleton<FirebaseRemoteDataSource>(
    () => FirebaseRemoteDataSourceImpl(
      googleSignInAuth: googleSignInAuth,
      auth: auth,
      fireStore: fireStore,
    ),
  );

  // Repository
  sl.registerLazySingleton<FirebaseRepository>(
    () => FirebaseRepositoryImpl(remoteDataSource: sl.call()),
  );

  // Use cases
  sl.registerLazySingleton<SendTextMessageUseCase>(
    () => SendTextMessageUseCase(repository: sl.call()),
  );
  // ... register other use cases

  // Cubits
  // ... register your cubits

  // Register external dependencies
  sl.registerLazySingleton(() => auth);
  sl.registerLazySingleton(() => fireStore);
  sl.registerLazySingleton(() => googleSignInAuth);
}
