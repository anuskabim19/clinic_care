import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:clinic_app/features/domain/entities/hospital_entity.dart';
import 'package:clinic_app/features/domain/use_cases/get_hospital.dart';

part 'get_hospital_state.dart';

class GetHospitalCubit extends Cubit<GetHospitalState> {
  final GetHospitalUseCase getHospitalUseCase;
  GetHospitalCubit({required this.getHospitalUseCase}) : super(GetHospitalInitial());


  Future<void> getHospitals()async{

    try{
    final streamResponse=getHospitalUseCase.call();
    streamResponse.listen((event) {
      emit(GetHospitalLoaded(
        hospitalData: event,
      ));
    });
    }on SocketException catch(_){

    }catch(_){

    }
  }
}
