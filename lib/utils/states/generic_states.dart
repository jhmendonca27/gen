import 'package:equatable/equatable.dart';

abstract class GenericStates extends Equatable {
 const GenericStates();
 @override
 List<Object> get props => [];
}

 class InitState extends GenericStates {}

 class ErrorState extends GenericStates {}

 class SuccessState extends GenericStates {}

 class LoadingState extends GenericStates {}