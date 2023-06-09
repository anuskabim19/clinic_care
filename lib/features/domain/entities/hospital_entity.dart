

import 'package:cloud_firestore/cloud_firestore.dart';

class HospitalEntity {
  final String hospitalFullAddress;
  final String hospitalPicUrl;
  final String emergency;
  final String hospitalId;
  final String hospitalName;
  final GeoPoint location;
  final List<String> departments;

  HospitalEntity(
      {required this.hospitalFullAddress,
    required this.hospitalPicUrl,
    required this.emergency,
    required this.hospitalId,
    required this.hospitalName,
    required this.location,
    required this.departments,
      });

}