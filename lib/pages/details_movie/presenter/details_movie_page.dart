import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:gen_app/pages/details_movie/presenter/cubit/details_movie_cubit.dart';
import 'package:gen_app/pages/home/presenter/cubit/home_cubit.dart';
import 'package:gen_app/utils/states/generic_states.dart';
import 'package:gen_app/utils/strings/strings_images.dart';

import '../../../utils/constainers/container_decoration.dart';
import '../../../utils/error_widget/error_widget.dart';
import '../../../utils/loading/loading_widget.dart';
import '../../../utils/texts/texts.dart';
class DetailsMoviePage extends StatefulWidget {
  const DetailsMoviePage({super.key});

  @override
  State<DetailsMoviePage> createState() => _DetailsMoviePageState();
}

class _DetailsMoviePageState extends State<DetailsMoviePage> {
  late final DetailsMovieCubit cubit;
  late final HomeCubit homeCubit;

  @override
  void initState() {
    super.initState();
    cubit = Modular.get<DetailsMovieCubit>();
    homeCubit = Modular.get<HomeCubit>();
    cubit.setResponse(cubit.model!);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: SizedBox(
          height: 30,
            child: IconButton(onPressed: (){
              Modular.to.pop();
            }, icon: const Icon(Icons.chevron_left_rounded,size: 30,))),
      ),
      body: BlocBuilder(
        bloc: cubit,
        builder: (context, state){
          if(state is SuccessState){
            return Stack(
              alignment: AlignmentDirectional.topCenter,
              children: [
                Image.asset(cubit.model!.posterPath!,height: MediaQuery.of(context).size.height,fit: BoxFit.fitHeight,),
                Padding(
                  padding: const EdgeInsets.symmetric( vertical: 60.0, horizontal: 20),
                  child: Align(
                    alignment: AlignmentDirectional.center,
                    child: getContainerDecoration(
                      colorContainer: Colors.black87,
                      child: SizedBox(
                        height: MediaQuery.of(context).size.height * 0.5,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 10.0,left: 20, right: 20),
                              child: getTextDescription(
                                color: Colors.white,
                                size: 16.0,
                                text: cubit.model!.title!,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 10.0,left: 20, right: 20),
                              child: getTextDescription(
                                color: Colors.white,
                                size: 16.0,
                                text: "(${cubit.model!.originalTitle!})",
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 10, left: 20, right: 20),
                              child: getTitleDescription(
                                color: Colors.white,
                                title: 'Data: ',
                                subTitle: cubit.model!.releaseDate!,
                                sizeDescription: 16,
                                sizeTitle: 16
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 10, left: 20, right: 20),
                              child: getTitleDescription(
                                  color: Colors.white,
                                  title: 'Idioma original: ',
                                  subTitle: cubit.model!.originalLanguage!.toString().toUpperCase(),
                                  sizeDescription: 16,
                                  sizeTitle: 16
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 10, left: 20, right: 20),
                              child: getTitleDescription(
                                  color: Colors.white,
                                  title: 'Média: ',
                                  subTitle: cubit.model!.voteAverage!.toString(),
                                  sizeDescription: 16,
                                  sizeTitle: 16
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 10, left: 20, right: 20),
                              child: getTitleDescription(
                                  color: Colors.white,
                                  title: 'Número de votos: ',
                                  subTitle: cubit.model!.voteCount!.toString(),
                                  sizeDescription: 16,
                                  sizeTitle: 16
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 10, left: 20, right: 20),
                              child: getTitleDescription(
                                  color: Colors.white,
                                  title: 'Descrição: ',
                                  subTitle: cubit.model!.overview!,
                                  sizeDescription: 16,
                                  sizeTitle: 16
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            );
          }
          else if(state is ErrorState){
            return getErrorWidget(homeCubit);
          }else if (state is LoadingState){
            return getLoading();
          }
          return const SizedBox();
        },
      ),
    );
  }
}
