import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gen_app/utils/routes/routes_app.dart';
import 'package:gen_app/utils/states/generic_states.dart';
import 'package:gen_app/utils/strings/strings_images.dart';

import 'cubit/splash_cubit.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  late final SplashCubit cubit;
  @override
  void initState() {
    super.initState();
    cubit = Modular.get<SplashCubit>();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: BlocBuilder(
        bloc: cubit,
        builder: (context, state) {
          if (state is InitState) {
            cubit.getConfigurations();
            return Align(
              alignment: Alignment.center,
              child: Container(
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  color: Colors.white,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    child: Image.asset(LOGO,height: 200),
                  ),
              ),
            );
          } else if (state is SuccessState) {
            Modular.to.pushReplacementNamed(RoutesApp.home, forRoot: true);
          }else if(state is LoadingState){
            return Container();
          }
          return Container();
        },
      ),
    );
  }
}
