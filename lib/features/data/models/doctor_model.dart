import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:clinic_app/features/domain/entities/doctor_entity.dart';

class DoctorModel implements DoctorEntity {
  DoctorModel({
    required String doctorName,
    required String specialist,
    required String timing,
    required String department,
    required String profileImage,
    required String gender,
    required String phoneNumber,
    required String email,
    required String descriptionDetails,
    required String hospitalAddress,
    required String qualification,
    required String doctorId,
  });
  factory DoctorModel.fromSnapshot(DocumentSnapshot snapshot) {
    final data = snapshot.data() as Map<String, dynamic>?;

    return DoctorModel(
      doctorName: data?['doctorName'] as String,
      specialist: data?['specialist'] as String,
      timing: data?['timing'] as String,
      department: data?['department'] as String,
      profileImage: data?['profileImage'] as String,
      gender: data?['gender'] as String,
      phoneNumber: data?['phoneNumber'] as String,
      email: data?['email'] as String,
      descriptionDetails: data?['descriptionDetails'] as String,
      hospitalAddress: data?['hospitalAddress'] as String,
      qualification: data?['qualification'] as String,
      doctorId: data?['doctorId'] as String,
    );
  }

  @override
  // TODO: implement department
  String get department => throw UnimplementedError();

  @override
  // TODO: implement descriptionDetails
  String get descriptionDetails => throw UnimplementedError();

  @override
  // TODO: implement doctorId
  String get doctorId => throw UnimplementedError();

  @override
  // TODO: implement doctorName
  String get doctorName => throw UnimplementedError();

  @override
  // TODO: implement email
  String get email => throw UnimplementedError();

  @override
  // TODO: implement gender
  String get gender => throw UnimplementedError();

  @override
  // TODO: implement hospitalAddress
  String get hospitalAddress => throw UnimplementedError();

  @override
  // TODO: implement phoneNumber
  String get phoneNumber => throw UnimplementedError();

  @override
  // TODO: implement profileImage
  String get profileImage => throw UnimplementedError();

  @override
  // TODO: implement qualification
  String get qualification => throw UnimplementedError();

  @override
  // TODO: implement specialist
  String get specialist => throw UnimplementedError();

  @override
  // TODO: implement timing
  String get timing => throw UnimplementedError();
}
