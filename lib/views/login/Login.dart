import 'package:alarm_movil/views/home/CentralWidget.dart';
import 'package:alarm_movil/views/styles/style.dart';
import 'package:flutter/material.dart';

import '../home/home.dart';

class Login extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Container(
        margin: EdgeInsets.symmetric(
            horizontal: MediaQuery.of(context).size.width * 0.12),
        padding:
            EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.08),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.41,
              width: MediaQuery.of(context).size.width * 0.76,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("assets/Calendar-amico.png"))),
            ),
            Text(
              "BIENVENIDO",
              style: titulo(),
            ),
            Container(
                width: MediaQuery.of(context).size.width * 0.76,
                height: MediaQuery.of(context).size.height * 0.07,
                child: OutlinedButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (BuildContext context) =>
                                CentralWidget()));
                  },
                  style: botonStyle(),
                  child: Container(
                      width: MediaQuery.of(context).size.width * 0.76,
                      child: Stack(
                        children: [
                          Center(
                              child: Text(
                            "Login",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize:
                                    MediaQuery.of(context).size.height * 0.027),
                          )),
                          Positioned(
                              left: 0,
                              top: MediaQuery.of(context).size.height *
                                  0.07 *
                                  0.2,
                              child: Center(
                                  child: Container(
                                height: 30,
                                width: 30,
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image: AssetImage(
                                            "assets/googlelogo.png"))),
                              )))
                        ],
                      )),
                ))
          ],
        ),
      ),
    );
  }
}
