import 'package:gen_app/pages/home/domain/entities/data_mcu_entite.dart';
import 'package:gen_app/pages/home/infra/models/mcu_model.dart';

class DataMcuModel extends DataMcuEntite{

  const DataMcuModel({
    final List<McuModel>? mcu,
}):super(
    mcu: mcu
  );

  factory DataMcuModel.fromJson(Map<String, dynamic> json) => DataMcuModel(
    mcu: json['mcu']!= null ? (json['mcu'] as List<dynamic>)
        .map((e) => McuModel.fromJson(e as Map<String, dynamic>))
        .toList() : null,
  );

}