import 'package:alarm_movil/views/Alarm/components/settings.dart';
import 'package:faker/faker.dart';
import 'package:flutter/material.dart';

import '../../../model/alarm.dart';
import '../../styles/style.dart';

class AlarmDetail extends StatelessWidget {
  final List<String> days = ["D", "L", "M", "X", "J", "V", "S"];
  final faker = Faker();
  Alarm alarm;
  AlarmDetail({required this.alarm});
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
          centerTitle: true,
          title: Text(
            "Detalles",
            style: titulo(),
          ),
        ),
        body: SingleChildScrollView(
          child: Container(
              margin: EdgeInsets.symmetric(
                  horizontal: MediaQuery.of(context).size.width * 0.1),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        alarm.nombre,
                        style: alarmName(),
                      ),
                      Switch(value: true, onChanged: (value) {})
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        alarm.tipo,
                        style: tipo(),
                      ),
                      Text(
                        alarm.fecha.split(" ")[1] + alarm.fecha.split(" ")[2],
                        style: normalText(),
                      )
                    ],
                  ),
                  Visibility(
                      visible: dias(),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: List.generate(days.length,
                            (index) => dayWidget(days[index], index)),
                      )),
                  Visibility(
                      visible: alarm.tipo == "Evento" || !dias(),
                      child: SizedBox(
                        width: double.infinity,
                        child: Text(
                          alarm.fecha.split(" ")[0],
                          style: normalText(),
                        ),
                      )),
                  Visibility(
                      visible: alarm.descripcion.isNotEmpty,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Descripcion",
                            style: subTitulo(),
                          ),
                          Container(
                            width: double.infinity,
                            height: MediaQuery.of(context).size.height * 0.15,
                            decoration: containerWithShadow(),
                            child: SingleChildScrollView(
                              child: Text(alarm.descripcion),
                            ),
                          )
                        ],
                      )),
                  Visibility(
                      visible: alarm.tipo == "Evento",
                      child: Container(
                        margin: EdgeInsets.only(top: 10),
                        width: double.infinity,
                        padding: EdgeInsets.all(5),
                        height: 30,
                        decoration: containerWithShadow(),
                        child: Text(alarm.lugar),
                      )),
                  SizedBox(
                    height: 20,
                  ),
                  GestureDetector(
                      onTap: () {
                        showModalBottomSheet<void>(
                            context: context,
                            backgroundColor: backgroundColor,
                            shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.vertical(
                                  top: Radius.circular(25)),
                            ),
                            builder: (BuildContext context2) {
                              return Container(
                                  padding: EdgeInsets.only(top: 10),
                                  height: 400,
                                  child: Column(children: [
                                    Stack(
                                      children: [
                                        SizedBox(
                                            width: double.infinity,
                                            child: Text(
                                              "Compartido con",
                                              textAlign: TextAlign.center,
                                              style: headerBottomDialog(),
                                            )),
                                        GestureDetector(
                                          onTap: () {
                                            Navigator.of(context).pop();
                                          },
                                          child: iconDialog(),
                                        ),
                                      ],
                                    ),
                                    Expanded(
                                        child: ListView.builder(
                                            itemCount: alarm.contacts.length,
                                            itemBuilder:
                                                (BuildContext context, index2) {
                                              return Container(
                                                  margin: const EdgeInsets.only(
                                                      top: 10),
                                                  child: Row(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        Row(
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              Container(
                                                                width: 50,
                                                                height: 50,
                                                                decoration: const BoxDecoration(
                                                                    shape: BoxShape
                                                                        .circle,
                                                                    color: Color(
                                                                        0xff2F4858)),
                                                                child: Center(
                                                                  child: Text(
                                                                      contactsInitials(
                                                                        alarm.contacts[
                                                                            index2],
                                                                      ),
                                                                      textAlign:
                                                                          TextAlign
                                                                              .center,
                                                                      style: const TextStyle(
                                                                          color: Colors
                                                                              .white,
                                                                          fontSize:
                                                                              25)),
                                                                ),
                                                              ),
                                                              const SizedBox(
                                                                width: 5,
                                                              ),
                                                              Text(
                                                                alarm.contacts[
                                                                    index2],
                                                                style: const TextStyle(
                                                                    color: Color(
                                                                        0xff33658A),
                                                                    fontSize:
                                                                        15),
                                                              )
                                                            ])
                                                      ]));
                                            }))
                                  ]));
                            });
                      },
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
                              "Compartido con",
                              style: TextStyle(
                                  color: primaryColor,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 18),
                            ),
                            Icon(
                              Icons.chevron_right,
                              color: primaryColor,
                              size: 30,
                            )
                          ],
                        ),
                      )),
                  SizedBox(
                    height: 10,
                  ),
                  Settings(ajuste: alarm.ajuste)
                ],
              )),
        ));
  }

  bool dias() {
    final days = alarm.fecha.split(" ")[0];
    for (var i = 0; i < days.length; i++) {
      if (this.days.contains(days[i])) {
        return true;
      }
    }
    return false;
  }

  Container dayWidget(String day, int index) {
    List<String> daySelected = [];
    final days = alarm.fecha.split(" ")[0];

    for (var i = 0; i < days.length; i++) {
      daySelected.add(days[i]);
    }

    return Container(
      child: Text(
        day,
        style: TextStyle(
            color: daySelected.contains(day)
                ? selectedColor
                : const Color(0xffBEBEBE)),
      ),
    );
  }

  String contactsInitials(String contact) {
    final initials = contact.split(' ');

    return "${initials[0].substring(0, 1)}${initials[1].substring(0, 1)}  ";
  }

  static const selectedColor = Color(0xff5B83A1);
  TextStyle normalText() {
    return TextStyle(color: Color(0xff4C8DBD), fontWeight: FontWeight.w400);
  }
}
