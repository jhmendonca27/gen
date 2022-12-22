import 'package:gen_app/utils/errors/errors.dart';
import 'package:dartz/dartz.dart';

import '../../infra/models/data_mcu_model.dart';

abstract class HomeRepository{
  Future<Either<Failure,DataMcuModel>> getData();
}