import 'package:clinic_app/features/domain/entities/hospital_entity.dart';
import 'package:clinic_app/features/domain/repositories/firebase_repository.dart';

class GetHospitalUseCase{
  final FirebaseRepository repository;

  GetHospitalUseCase({required this.repository});

  Stream<List<HospitalEntity>> call(){
    return repository.getHospitals();
  }
}