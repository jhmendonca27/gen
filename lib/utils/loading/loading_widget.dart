import 'package:flutter/material.dart';
import 'package:gen_app/utils/texts/texts.dart';

import '../strings/strings_images.dart';

Widget getLoading(){
  return Container(
    decoration: const BoxDecoration(
        borderRadius:BorderRadius.all(Radius.circular(10)),
        color: Colors.black
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: Image.asset(LOADING,repeat: ImageRepeat.noRepeat),
        ),
        getTextSimple(text: 'Carregando', color: Colors.white, size: 18),
      ],
    ),
  );
}