

import 'package:clinic_app/features/domain/entities/doctor_entity.dart';
import 'package:clinic_app/features/domain/repositories/firebase_repository.dart';

class GetHospitalDetailsUseCase{
  final FirebaseRepository repository;

  GetHospitalDetailsUseCase({required this.repository});

  Stream<List<DoctorEntity>> call(String hospitalId){
    return repository.getHospitalDetails(hospitalId);
  }
}