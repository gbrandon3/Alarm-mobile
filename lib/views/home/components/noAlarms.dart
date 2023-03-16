import 'package:flutter/material.dart';

class NoAlarms extends StatelessWidget {
  bool firstTime;
  NoAlarms({required this.firstTime});
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
          Text(firstTime
              ? "Aun no tienes alaramas creadas, para crear una presiona el boton en la parte inferior izquierda"
              : "No tienes alaramas creadas, para crear una alarma presiona el boton en la parte inferior izquierda"),
          if (firstTime)
            Text(
              "Nota: Al momento de crear la alarma recuerda elegir primero un tipo",
              style: TextStyle(
                  fontWeight: FontWeight.w600, color: Color(0xff9C9C9C)),
            )
        ],
      ),
    );
  }
}
