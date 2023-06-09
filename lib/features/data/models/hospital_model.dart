import 'package:clinic_app/features/domain/entities/hospital_entity.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cloud_firestore_platform_interface/src/geo_point.dart';

class HospitalModel extends HospitalEntity {
  HospitalModel({
  required String hospitalFullAddress,
  required String hospitalPicUrl,
  required String emergency,
  required String hospitalId,
  required String hospitalName,
  required GeoPoint location,
  required List<String> departments,
  })
      : super(hospitalFullAddress:hospitalFullAddress, hospitalPicUrl:hospitalPicUrl, emergency:emergency, hospitalId:hospitalId,
  hospitalName:hospitalName, location:location, departments:departments,);

  factory HospitalModel.fromSnapshot(DocumentSnapshot snapshot) {
  final data = snapshot.data() as Map<String, dynamic>?;

  return HospitalModel(
    hospitalFullAddress: data?['hospitalFullAddress'] as String,
    hospitalPicUrl: data?['hospitalPicUrl'] as String,
    emergency: data?['emergency'] as String,
    hospitalId: data?['hospitalId'] as String,
    hospitalName: data?['hospitalName'] as String,
    location: data?['location'] as GeoPoint,
    departments: List<String>.from(data?['departments'] as List<dynamic>),
  );
}

  }


