import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:gen_app/pages/details_movie/presenter/cubit/details_movie_cubit.dart';
import 'package:gen_app/pages/home/presenter/cubit/home_cubit.dart';
import 'package:gen_app/utils/constainers/containers_home.dart';
import 'package:gen_app/utils/loading/loading_widget.dart';
import 'package:gen_app/utils/states/generic_states.dart';
import 'package:gen_app/utils/strings/strings_images.dart';

import '../../../utils/error_widget/error_widget.dart';
import '../../../utils/formaters/year_formater.dart';
import '../../../utils/routes/routes_app.dart';
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  late final HomeCubit cubit;
  late final DetailsMovieCubit movieCubit;

  @override
  void initState() {
    super.initState();
    cubit = Modular.get<HomeCubit>();
    movieCubit = Modular.get<DetailsMovieCubit>();
    cubit.errorState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: BlocBuilder(
        bloc: cubit,
        builder: (context, state){
          if(state is SuccessState){
            return Stack(
              alignment: AlignmentDirectional.topCenter,
              children: [
                Image.asset(POSTER,height: MediaQuery.of(context).size.height,fit: BoxFit.fitHeight,),
                Padding(
                  padding: const EdgeInsets.only(bottom: 20.0),
                  child: Align(
                      alignment: AlignmentDirectional.bottomCenter,
                      child: SizedBox(
                        height: MediaQuery.of(context).size.height * 0.4,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          physics: const AlwaysScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemBuilder: (context, index){
                            return Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: InkWell(
                                onTap: (){
                                  movieCubit.setResponse(cubit.model!.mcu![index]);
                                  Modular.to.pushNamed(RoutesApp.details);
                                },
                                child: Stack(
                                  children: [
                                    Image.asset(cubit.model!.mcu![index].posterPath!,width: 200,
                                      height: MediaQuery.of(context).size.height * 0.3,fit: BoxFit.fitHeight,),
                                    Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      getContainerHome(cubit.model!.mcu![index].title!, Colors.white),
                                      getContainerHome("(${yearStringFormater(cubit.model!.mcu![index].releaseDate!)})", Colors.white)
                                    ],
                                  ),
                                ]
                                ),
                              ),
                            );
                          },
                          itemCount: cubit.model!.mcu!.length,
                        ),
                      ),
                  ),
                ),
              ],
            );
          }else if(state is ErrorState){
            return getErrorWidget(cubit);
          }else if (state is LoadingState){
            return getLoading();
          }
          return const SizedBox();
        },
      ),
    );
  }
}
