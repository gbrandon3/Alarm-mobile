import 'dart:math';

import 'package:alarm_movil/views/Alarm/alarm-create/components/DaySelector.dart';
import 'package:alarm_movil/views/Alarm/alarm-create/components/HourPicker.dart';
import 'package:alarm_movil/views/Alarm/alarm-create/components/TypeSelector.dart';
import 'package:alarm_movil/views/Alarm/alarm-create/components/shareWith.dart';
import 'package:alarm_movil/views/Alarm/components/settings.dart';
import 'package:alarm_movil/views/Alarm/components/settingsCreate.dart';
import 'package:alarm_movil/views/styles/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:faker/faker.dart';
import '../../../alarm_bloc/alarm_bloc.dart';
import '../../../bloc/create_alarm_bloc.dart';
import '../../../model/alarm.dart';

class CreateAlarmView extends StatefulWidget {
  Alarm? editAlarm;
  CreateAlarmView({this.editAlarm});
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return CreateAlarmViewState();
  }
}

class CreateAlarmViewState extends State<CreateAlarmView> {
  String tipo = "";
  List<String> compartido = [];
  String dateString = "";
  TextEditingController lugar = TextEditingController();
  TextEditingController fecha = TextEditingController();
  TextEditingController nombre = TextEditingController();
  TextEditingController descripcion = TextEditingController();
  @override
  void initState() {
    // TODO: implement initState
    if (widget.editAlarm != null) {
      setState(() {
        tipo = widget.editAlarm!.tipo;
        if (tipo == "Evento") {
          fecha.text = widget.editAlarm!.fecha.split(" ")[0];
          lugar.text = widget.editAlarm!.lugar;
        } else {
          dateString = widget.editAlarm!.fecha.split(" ")[0];
        }
        nombre.text = widget.editAlarm!.nombre;
        descripcion.text = widget.editAlarm!.descripcion;

        compartido = widget.editAlarm!.contacts;
      });
    }
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final faker = new Faker();
    return BlocListener<CreateAlarmBloc, CreateAlarmState>(
      listener: (context, state) {
        final currentState = state as CreateAlarmInitial;
        if (currentState.save) {
          BlocProvider.of<AlarmBloc>(context)
              .add(SaveAlarm(currentState.alarm, currentState.editing));
          Navigator.of(context).pop();
        }
        if (currentState.alarm.tipo != this.tipo) {
          setState(() {
            this.tipo = currentState.alarm.tipo;
            if (this.tipo == "Evento" && this.lugar.text.isEmpty) {
              var datetime = DateTime.now();
              int dia = Random().nextInt(31);
              fecha.text =
                  DateTime(datetime.year, datetime.month, datetime.day + dia)
                      .toIso8601String()
                      .split("T")
                      .first;
              lugar.text = faker.address.streetName();
            }
          });
        }
        setState(() {
          compartido = currentState.alarm.contacts;
        });

        if (dateString != state.fechaString) {
          setState(() {
            dateString = state.fechaString;
          });
        }
      },
      child: Scaffold(
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
        body: Stack(children: [
          SingleChildScrollView(
              child: Container(
            width: MediaQuery.of(context).size.width,
            padding: EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.width * 0.1),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                HourPicker(
                    currentHour: widget.editAlarm != null
                        ? widget.editAlarm!.fecha.split(" ")[1] +
                            " " +
                            widget.editAlarm!.fecha.split(" ")[2]
                        : ""),
                const SizedBox(
                  height: 5,
                ),
                Visibility(
                  visible: tipo == "Evento",
                  child: SizedBox(
                    height: 30,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width * 0.3,
                          decoration:
                              BoxDecoration(color: Colors.white, boxShadow: [
                            BoxShadow(
                                offset: const Offset(0.0, 4),
                                blurRadius: 4,
                                color: Colors.black.withOpacity(0.25))
                          ]),
                          child: TextField(
                            controller: lugar,
                            decoration: inputDecoration("Lugar"),
                          ),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width * 0.3,
                          decoration:
                              BoxDecoration(color: Colors.white, boxShadow: [
                            BoxShadow(
                                offset: Offset(0.0, 4),
                                blurRadius: 4,
                                color: Colors.black.withOpacity(0.25))
                          ]),
                          child: TextField(
                            controller: fecha,
                            enabled: false,
                            decoration: inputDecoration("Fecha YYYY-MM-DD"),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                TypeSelector(
                  seccion: tipo == "" ? "Elegir tipo" : tipo,
                  value: tipo,
                ),
                const SizedBox(
                  height: 20,
                ),
                Visibility(
                  child: DaySelector(
                    date: this.dateString,
                  ),
                  visible: tipo == "Recordatorio",
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                    height: 30,
                    decoration: BoxDecoration(color: Colors.white, boxShadow: [
                      BoxShadow(
                          offset: Offset(0.0, 4),
                          blurRadius: 4,
                          color: Colors.black.withOpacity(0.25))
                    ]),
                    child: TextField(
                        controller: nombre,
                        decoration: inputDecoration("Nombre (opcional)"))),
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
                    controller: descripcion,
                    minLines: 3,
                    maxLines: 3,
                    decoration: inputDecoration("Descripcion"),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                ShareWith(
                  contactsSelected: this.compartido,
                ),
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
                SettingsCreate(),
                SizedBox(
                  height: 50,
                ),
              ],
            ),
          )),
          Positioned(
              bottom: 0,
              child: Container(
                  width: MediaQuery.of(context).size.width,
                  color: backgroundColor,
                  child: Center(
                      child: SizedBox(
                          width: 300,
                          child: OutlinedButton(
                            onPressed: tipo == ""
                                ? null
                                : () {
                                    BlocProvider.of<CreateAlarmBloc>(context)
                                        .add(submitting(
                                            nombre.text,
                                            descripcion.text,
                                            fecha.text,
                                            lugar.text));
                                  },
                            style: botonStyle(),
                            child: Text(
                              "Guardar",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: MediaQuery.of(context).size.height *
                                      0.027),
                            ),
                          )))))
        ]),
      ),
    );
  }
}
