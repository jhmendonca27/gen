import 'package:flutter/material.dart';

Text getTextDescription({required String text,required Color color, required double size}){
  return Text(
    text,
    style: TextStyle(
      color: color,
      fontSize: size,
      fontWeight: FontWeight.bold
    ),
  );
}

Text getTextSimple({required String text,required Color color, required double size}){
  return Text(
    text,
    style: TextStyle(
        color: color,
        fontSize: size,
        fontWeight: FontWeight.normal
    ),
  );
}

RichText getTitleDescription({required String title, required String subTitle, required Color color, required double sizeTitle, required double sizeDescription}){
  return RichText(
    text: TextSpan(
      children: [
        TextSpan(
          text: title,
            style: TextStyle(
                color: color,
                fontSize: sizeTitle,
                fontWeight: FontWeight.bold
            ),
        ),
        TextSpan(
          text: subTitle,
          style: TextStyle(
            color: color,
            fontSize: sizeDescription,
            fontWeight: FontWeight.normal
          ),
        ),
      ]
    )
  );
}