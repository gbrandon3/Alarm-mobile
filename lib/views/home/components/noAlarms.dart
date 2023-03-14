import 'package:flutter/material.dart';

class NoAlarms extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      padding: EdgeInsets.only(
          left: MediaQuery.of(context).size.width * 0.0625,
          right: MediaQuery.of(context).size.width * 0.0625,
          top: MediaQuery.of(context).size.height * 0.05),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
              "Aun no tienes alaramas creadas, para crear una presiona el boton en la parte inferior izquierda")
        ],
      ),
    );
  }
}
