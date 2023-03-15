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
Color remiderColor = Color(0xffF6AE2D);
Color eventColor = Color(0xffF26419);
TextStyle titulo() {
  return TextStyle(
      fontSize: 30, color: primaryColor, fontWeight: FontWeight.w800);
}

TextStyle subTitulo() {
  return TextStyle(
      fontSize: 20, color: primaryColor, fontWeight: FontWeight.w700);
}

BoxDecoration containerWithShadow() {
  return BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.all(Radius.circular(5)),
      boxShadow: [
        BoxShadow(
            offset: Offset(0.0, 4),
            blurRadius: 4,
            color: Colors.black.withOpacity(0.25))
      ]);
}

TextStyle tipo() {
  return const TextStyle(
      fontSize: 15, fontWeight: FontWeight.w600, color: Color(0xffAFAFAF));
}

TextStyle headerBottomDialog() {
  return TextStyle(
      fontSize: 30, color: primaryColor, fontWeight: FontWeight.w800);
}

TextStyle headerDialog() {
  return TextStyle(
      fontSize: 25, color: primaryColor, fontWeight: FontWeight.w800);
}

Icon iconDialog() {
  return Icon(
    Icons.chevron_left,
    size: 40,
    color: primaryColor,
  );
}

TextStyle alarmName() {
  return const TextStyle(
      fontSize: 20, fontWeight: FontWeight.w600, color: Color(0xff33658A));
}

const backgroundColor = Color(0xffF5F8FF);
InputDecoration inputDecorationSearch(String hintText) {
  return InputDecoration(
      contentPadding: EdgeInsets.only(left: 10),
      suffixIcon: Icon(
        Icons.search,
        color: primaryColor,
      ),
      filled: true,
      hintText: hintText,
      fillColor: Colors.white,
      enabledBorder: const OutlineInputBorder(
        borderSide: BorderSide(color: Colors.white),
        borderRadius: BorderRadius.all(Radius.circular(30)),
      ),
      focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Color(0xffC2DDEB), width: 2)),
      border: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.white),
        borderRadius: BorderRadius.all(Radius.circular(5)),
      ));
}

InputDecoration inputDecoration(String hintText) {
  return InputDecoration(
      contentPadding: EdgeInsets.only(left: 10),
      filled: true,
      hintText: hintText,
      fillColor: Colors.white,
      enabledBorder: const OutlineInputBorder(
        borderSide: BorderSide(color: Colors.white),
        borderRadius: BorderRadius.all(Radius.circular(5)),
      ),
      focusedBorder: const OutlineInputBorder(
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
        if (states.contains(MaterialState.disabled)) {
          return primaryColor.withOpacity(0.6);
        }
        if (states.contains(MaterialState.pressed)) {
          return onHoverColor;
        }
        return primaryColor;
      }));
}
