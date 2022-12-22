import 'package:dartz/dartz.dart';
import 'package:gen_app/pages/home/domain/repositories/home_repository.dart';
import 'package:gen_app/pages/home/infra/datasources/home_datasource.dart';
import 'package:gen_app/pages/home/infra/models/data_mcu_model.dart';
import 'package:gen_app/utils/errors/errors.dart';

class HomeRepositoryImpl implements HomeRepository{

  final IHomeDatasource datasource;
  HomeRepositoryImpl(this.datasource);

  @override
  Future<Either<Failure, DataMcuModel>> getData() async{
    final DataMcuModel dataMcuModel;
    DataMcuModel result;
    try{
      result = await datasource.getData();
      dataMcuModel = result;
      return right(dataMcuModel);
    }catch(e){
      if(e is Failure){
        return left(e);
      }
      return left(GenericError());
    }
  }
}