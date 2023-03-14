import 'package:alarm_movil/views/styles/style.dart';
import 'package:flutter/material.dart';

class NavigationButtons extends StatelessWidget {
  final String seccion;
  NavigationButtons({required this.seccion});
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return GestureDetector(
        child: Container(
      height: 30,
      padding: EdgeInsets.only(left: 10),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(5)),
          boxShadow: [
            BoxShadow(
                offset: Offset(0.0, 4),
                blurRadius: 4,
                color: Colors.black.withOpacity(0.25))
          ]),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            this.seccion,
            style: TextStyle(
                color: primaryColor, fontWeight: FontWeight.w600, fontSize: 18),
          ),
          Icon(
            Icons.chevron_right,
            color: primaryColor,
            size: 30,
          )
        ],
      ),
    ));
  }
}
