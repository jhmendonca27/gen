import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:gen_app/pages/details_movie/presenter/cubit/details_movie_cubit.dart';
import 'package:gen_app/pages/details_movie/presenter/details_movie_page.dart';
import 'package:gen_app/pages/home/domain/usecases/home_usecase.dart';
import 'package:gen_app/pages/home/external/dio_home_datasource_impl.dart';
import 'package:gen_app/pages/home/infra/repositories/home_repository_impl.dart';
import 'package:gen_app/pages/home/presenter/cubit/home_cubit.dart';
import 'package:gen_app/pages/home/presenter/home_page.dart';
import 'package:gen_app/utils/routes/routes_app.dart';

import '../pages/splash/presenter/cubit/splash_cubit.dart';
import '../pages/splash/presenter/splash_page.dart';
import '../utils/dio/dio_client.dart';

class AppModule extends Module{
  Dio getDioConfig() {
    var options = BaseOptions(
        connectTimeout: 15000,
        receiveTimeout: 13000
    );
    Dio dio = Dio(options);
    return dio;
  }

  @override
  List<Bind> get binds => [
    Bind((i) => SplashCubit()),
    Bind((i) => DioClient(getDioConfig())),
    Bind((i) => HomeUsecaseImpl(i.get())),
    Bind((i) => HomeRepositoryImpl(i.get())),
    Bind((i) => DioIHomeDatasourceImpl(i.get())),
    Bind((i) => HomeCubit(i.get())),
    Bind((i) => DetailsMovieCubit()),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(RoutesApp.splash, child: (_, args) => const SplashPage()),
    ChildRoute(RoutesApp.home, child: (_, args) => const HomePage()),
    ChildRoute(RoutesApp.details, child: (_, args) => const DetailsMoviePage()),

  ];
}

