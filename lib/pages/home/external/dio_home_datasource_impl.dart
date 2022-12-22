import 'package:gen_app/pages/home/infra/datasources/home_datasource.dart';
import 'package:gen_app/pages/home/infra/models/data_mcu_model.dart';
import 'package:gen_app/utils/errors/errors.dart';

import '../../../utils/dio/constants/endpoints_constants.dart';
import '../../../utils/dio/dio_client.dart';
import '../../../utils/dio/enum/dio_method.dart';

class DioIHomeDatasourceImpl implements IHomeDatasource{
  final DioClient dioClient;
  DioIHomeDatasourceImpl(this.dioClient);

  @override
  Future<DataMcuModel> getData() async{
    try{
      final response = await dioClient.request(url: BASE_URL + GET_MCU_DATA,
          method: DioMethod.GET_MOCK,);
      final jsonResult = response.body;
      DataMcuModel dataMcuModel = DataMcuModel.fromJson(jsonResult!);
      return dataMcuModel;
    }catch (e) {
      throw GenericError();
    }
  }

}