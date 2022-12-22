import 'package:flutter/material.dart';
import 'package:gen_app/pages/home/presenter/cubit/home_cubit.dart';
import '../strings/strings_images.dart';
import '../texts/texts.dart';

Widget getErrorWidget(HomeCubit cubit){
  return Container(
    decoration: const BoxDecoration(
        borderRadius:BorderRadius.all(Radius.circular(10)),
        color: Colors.white
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: Image.asset(ERROR,repeat: ImageRepeat.noRepeat,),
        ),
        getTextSimple(text: 'Carregando', color: Colors.white, size: 18),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: InkWell(
            onTap: (){
              cubit.getDataMcu();
            },
            child: Container(
              decoration: const BoxDecoration(
                  borderRadius:BorderRadius.all(Radius.circular(10)),
                  color: Colors.black87
              ),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Center(child: getTextDescription(text: 'Tentar novamente',
                    color: Colors.white, size: 16),),
              ),
            ),
          ),
        ),
      ],
    ),
  );
}