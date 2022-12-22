import 'package:flutter/material.dart';

Widget getContainerHome(String text, Color colorText){
  return  Container(
      width: 200,
      padding: const EdgeInsets.only(left: 5),
      child: Text(text,softWrap: true,
        style:  TextStyle(
          color: colorText,
        ),
      )
  );
}

Widget getContainerHomeMovie(String text, BuildContext context){
  return Container(
      width: 200,
      height: MediaQuery.of(context).size.height * 0.3,
      // decoration: const BoxDecoration(
      //     borderRadius:BorderRadius.all(Radius.circular(10)),
      //     color: Colors.black87
      // ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(text,maxLines: 2,
          softWrap: true,
          style: const TextStyle(color: Colors.pink),),
      ));
}