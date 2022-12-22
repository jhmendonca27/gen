import 'dart:async';
import 'dart:developer';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gen_app/pages/home/infra/models/data_mcu_model.dart';
import 'package:gen_app/utils/errors/errors.dart';
import 'package:gen_app/utils/states/generic_states.dart';

import '../../domain/usecases/home_usecase.dart';

class HomeCubit extends Cubit<GenericStates> {
  final HomeUsecase usecase;
  HomeCubit(this.usecase) : super(LoadingState());

  errorState(){
    emit(ErrorState());
  }

  getDataMcu() async {
    emit(LoadingState());
    var result = await usecase();
    if (result is DataMcuModel) {
      setResponse(result);
      log(result.toString());
    } else if (result is Failure) {
      emit(ErrorState());
    }
  }
  DataMcuModel? model;

  setResponse(DataMcuModel result){
    model = result;
   Timer(const Duration(seconds: 2), () => emit(SuccessState()));
  }
}