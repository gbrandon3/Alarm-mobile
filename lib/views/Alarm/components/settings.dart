import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Settings extends StatelessWidget {
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
            children: [Text("Notificar antes"), Text("15 min")],
          )),
          Expanded(
              child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [Text("Notificar antes"), Text("15 min")],
          )),
          Expanded(
              child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [Text("Notificar antes"), Text("15 min")],
          ))
        ],
      ),
    );
  }
}
