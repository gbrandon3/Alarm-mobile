import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../../../model/alarm.dart';

class Settings extends StatelessWidget {
  Ajuste ajuste;
  Settings({required this.ajuste});
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      height: 180,
      padding: EdgeInsets.symmetric(horizontal: 15),
      decoration: BoxDecoration(color: Colors.white, boxShadow: [
        BoxShadow(
            offset: Offset(0.0, 4),
            blurRadius: 4,
            color: Colors.black.withOpacity(0.25))
      ]),
      child: Column(
        children: [
          Expanded(
              child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [Text("Notificar antes"), Text(ajuste.notificarAntes)],
          )),
          Expanded(
              child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [Text("Recordar Cada"), Text(ajuste.notificarCada)],
          )),
          Expanded(
              child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [Text("Sonido"), Text(ajuste.sonido)],
          ))
        ],
      ),
    );
  }
}
