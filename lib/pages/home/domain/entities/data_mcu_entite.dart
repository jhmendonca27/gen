import 'package:equatable/equatable.dart';
import 'mcu_entite.dart';

class DataMcuEntite extends Equatable{
  final List<McuEntite>? mcu;

  const DataMcuEntite({this.mcu});
  @override
  List<Object?> get props => [
    mcu
  ];
}