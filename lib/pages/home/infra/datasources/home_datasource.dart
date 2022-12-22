import 'package:gen_app/pages/home/infra/models/data_mcu_model.dart';

abstract class IHomeDatasource{
  Future<DataMcuModel> getData();
}