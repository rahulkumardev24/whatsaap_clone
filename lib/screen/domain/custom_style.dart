import 'package:flutter/material.dart';

class CustomTextStyle{

  static TextStyle mStyleColor({required bool isLight}){
    return TextStyle(
        color: isLight ? Colors.green.shade500 : Colors.white,
        fontWeight: FontWeight.bold
    );
  }
}