import 'package:alarm_movil/views/login/Login.dart';
import 'package:alarm_movil/views/styles/style.dart';
import 'package:flutter/material.dart';

class SettingAccount extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    // TODO: implement build
    return Container(
      height: height * 0.8,
      width: width,
      padding: EdgeInsets.only(
          top: 20, left: width * 0.05, right: width * 0.05, bottom: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              Container(
                height: height * 0.3,
                width: height * 0.3,
                decoration: const BoxDecoration(color: Colors.red),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                "Nombre".toUpperCase(),
                style: titulo(),
              )
            ],
          ),
          SizedBox(
              width: width * 0.6,
              child: OutlinedButton(
                  onPressed: () {
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) => Login()));
                  },
                  style: botonStyle(),
                  child: Text(
                    "Cerrar sesión",
                    style:
                        TextStyle(color: Colors.white, fontSize: height * 0.03),
                  )))
        ],
      ),
    );
  }
}
