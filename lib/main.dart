import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'app/app_module.dart';
import 'app/app_widget.dart';
import 'package:intl/date_symbol_data_local.dart';

void main()async  {
  WidgetsFlutterBinding.ensureInitialized();
  initializeDateFormatting("pt").then((_) => runApp(ModularApp(module: AppModule(),child: const AppWidget(),)));
}