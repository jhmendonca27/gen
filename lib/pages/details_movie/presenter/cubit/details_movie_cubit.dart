import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gen_app/utils/states/generic_states.dart';
import '../../../home/domain/entities/mcu_entite.dart';

class DetailsMovieCubit extends Cubit<GenericStates>{
  DetailsMovieCubit():super(InitState());

  McuEntite? model;

  setResponse(McuEntite? result){
    model = result;
    emit(SuccessState());
  }
}