import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gen_app/utils/states/generic_states.dart';

class SplashCubit extends Cubit<GenericStates>{
  SplashCubit() : super(InitState());

  void getConfigurations() {
    Timer(const Duration(seconds: 3), () =>  emit(SuccessState()));
  }
}