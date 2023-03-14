import 'package:flutter/material.dart';

Map<int, Color> color = const {
  50: Color.fromRGBO(51, 101, 138, .1),
  100: Color.fromRGBO(51, 101, 138, .2),
  200: Color.fromRGBO(51, 101, 138, .3),
  300: Color.fromRGBO(51, 101, 138, .4),
  400: Color.fromRGBO(51, 101, 138, .5),
  500: Color.fromRGBO(51, 101, 138, .6),
  600: Color.fromRGBO(51, 101, 138, .7),
  700: Color.fromRGBO(51, 101, 138, .8),
  800: Color.fromRGBO(51, 101, 138, .9),
  900: Color.fromRGBO(51, 101, 138, 1),
};
Color primaryColor = Color(0xFF33658a);
Color onHoverColor = Color(0xfff254A65);
MaterialColor colorCustom = MaterialColor(0xFF33658a, color);
TextStyle titulo() {
  return TextStyle(
      fontSize: 30, color: primaryColor, fontWeight: FontWeight.w800);
}

TextStyle subTitulo() {
  return TextStyle(
      fontSize: 20, color: primaryColor, fontWeight: FontWeight.w700);
}

InputDecoration inputDecoration() {
  return InputDecoration(
      contentPadding: EdgeInsets.only(left: 10),
      filled: true,
      hintText: "Nombre",
      fillColor: Colors.white,
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.white),
        borderRadius: BorderRadius.all(Radius.circular(5)),
      ),
      focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Color(0xffC2DDEB), width: 2)),
      border: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.white),
        borderRadius: BorderRadius.all(Radius.circular(5)),
      ));
}

ButtonStyle botonStyle() {
  return ButtonStyle(
      shape: MaterialStatePropertyAll<RoundedRectangleBorder>(
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(100))),
      backgroundColor: MaterialStateProperty.resolveWith((states) {
        if (states.contains(MaterialState.pressed)) {
          return onHoverColor;
        }
        return primaryColor;
      }));
}
