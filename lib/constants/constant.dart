import 'package:flutter/material.dart';

const appId = "0282cdbc-0b53-4f12-b9c9-4762e3ebedc2";
final iconsColor = const Color(0xffffffff);
final myLightBlue = const Color(0xff5ed1ff);
final myBlue = const Color(0xff0392ff);
final myDarkBlue = Color.fromARGB(255, 6, 39, 65);
final myTransparentBlue = const Color(0xff5ed1ff).withOpacity(0.5);
final myTransparentBlue2 = const Color(0xff0392ff).withOpacity(0.5);
final myLightOrange = const Color(0xffffc12a);
final myOrange = const Color(0xffff8304);

final myBlueGradient = [myBlue, myLightBlue];
final myOrangeGradient = [myOrange, myLightOrange];
Size size(context) => MediaQuery.of(context).size;
var textFieldDecoration = InputDecoration(
  contentPadding: EdgeInsets.all(20),
  // labelText: 'Even Densed TextFiled',
  // isDense: true,
  hintStyle: TextStyle(color: const Color(0xff626262)),
  filled: true,
  fillColor: const Color(0xfff7f7f7),
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.white),
    borderRadius: BorderRadius.circular(30.0),
  ),
  border: OutlineInputBorder(
    borderRadius: BorderRadius.circular(30.0),
  ),
  enabledBorder: UnderlineInputBorder(
    borderSide: BorderSide(color: Colors.white),
    borderRadius: BorderRadius.circular(30.0),
  ),
);
