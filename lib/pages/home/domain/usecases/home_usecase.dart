import 'package:gen_app/pages/home/domain/repositories/home_repository.dart';

abstract class HomeUsecase {
  Future<dynamic>call();
}

class HomeUsecaseImpl implements HomeUsecase{

  final HomeRepository repository;
  HomeUsecaseImpl(this.repository);

  @override
  Future<dynamic> call() async{
    var model;
    var result = await repository.getData();
    result.fold((error) {
      model = error;
      return model;
    },
          (success) {
        model = success;
        return model;
      },
    );
    return model;
  }
}