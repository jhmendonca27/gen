import 'package:flutter/material.dart';

Widget getContainerDecoration({required Color colorContainer, required Widget child}){
  return Container(
      decoration:  BoxDecoration(
          borderRadius:const BorderRadius.all(Radius.circular(10)),
          color: colorContainer
      ),
      child: child);
}