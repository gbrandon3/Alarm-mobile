import 'package:alarm_movil/views/Alarm/alarm-create/components/NavigationButtons.dart';
import 'package:alarm_movil/views/Alarm/components/settings.dart';
import 'package:alarm_movil/views/styles/style.dart';
import 'package:flutter/material.dart';

class CreateAlarmView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return CreateAlarmState();
  }
}

class CreateAlarmState extends State<CreateAlarmView> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          child: Icon(
            Icons.chevron_left,
            color: primaryColor,
            size: 40,
          ),
          onTap: () {
            Navigator.of(context).pop();
          },
        ),
        title: Text(
          "Crear alarma",
          style: titulo(),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width,
          padding: EdgeInsets.symmetric(
              horizontal: MediaQuery.of(context).size.width * 0.1),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: 200,
                height: 120,
                color: Colors.red,
              ),
              const SizedBox(
                height: 5,
              ),
              NavigationButtons(seccion: "Elegir tipo"),
              const SizedBox(
                height: 20,
              ),
              Container(
                  height: 30,
                  decoration: BoxDecoration(color: Colors.white, boxShadow: [
                    BoxShadow(
                        offset: Offset(0.0, 4),
                        blurRadius: 4,
                        color: Colors.black.withOpacity(0.25))
                  ]),
                  child: TextField(decoration: inputDecoration())),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                  width: double.infinity,
                  child: Text(
                    "Descripcion",
                    textAlign: TextAlign.start,
                    style: subTitulo(),
                  )),
              Container(
                decoration: BoxDecoration(color: Colors.white, boxShadow: [
                  BoxShadow(
                      offset: Offset(0.0, 4),
                      blurRadius: 4,
                      color: Colors.black.withOpacity(0.25))
                ]),
                child: TextField(
                  minLines: 3,
                  maxLines: 3,
                  decoration: inputDecoration(),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              NavigationButtons(seccion: "Compartir con"),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                  width: double.infinity,
                  child: Text(
                    "Otros ajustes",
                    textAlign: TextAlign.start,
                    style: subTitulo(),
                  )),
              Settings()
            ],
          ),
        ),
      ),
    );
  }
}
