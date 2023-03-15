import 'package:alarm_movil/alarm_bloc/alarm_bloc.dart';
import 'package:alarm_movil/views/Alarm/alarm-create/CreateAlarm.dart';
import 'package:alarm_movil/views/Alarm/alarm-create/CreateAlarmBlocProvider.dart';
import 'package:alarm_movil/views/home/components/alarmListIem.dart';
import 'package:alarm_movil/views/home/components/noAlarms.dart';
import 'package:alarm_movil/views/styles/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../model/alarm.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      floatingActionButton: FloatingActionButton(
          backgroundColor: primaryColor,
          splashColor: onHoverColor,
          child: const Icon(
            Icons.add,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => CreateAlarmBlocProvider(
                      alarm: Alarm(
                          "", "", "", Ajuste("No", "15 Min", 1, "Sonido1")),
                    )));
          }),
      appBar: AppBar(
        title: Center(
            child: Text(
          "ALARMAS CREADAS",
          style: titulo(),
        )),
      ),
      body: BlocBuilder<AlarmBloc, AlarmState>(
        builder: (context, state) {
          if (state is AlarmInitial ||
              state is AlarmLoaded && state.alarms.isEmpty) {
            return NoAlarms();
          } else {
            final currentState = state as AlarmLoaded;

            return Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.symmetric(
                  horizontal: MediaQuery.of(context).size.width * 0.05),
              child: Column(children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      height: 30,
                      width: MediaQuery.of(context).size.width * 0.66,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(5)),
                          boxShadow: [
                            BoxShadow(
                                offset: const Offset(0.0, 4),
                                blurRadius: 4,
                                color: Colors.black.withOpacity(0.25))
                          ]),
                      child: TextField(
                        decoration: inputDecorationSearch("Buscar"),
                      ),
                    ),
                    Container(
                        width: 80,
                        child: ElevatedButton(
                            onPressed: () {
                              showDialog(
                                context: context,
                                builder: (BuildContext context2) {
                                  return Dialog(
                                      backgroundColor: backgroundColor,
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(20.0)),
                                      child: SizedBox(
                                        height: 320,
                                        child: Padding(
                                          padding: const EdgeInsets.all(12.0),
                                          child: Column(
                                            children: [
                                              SizedBox(
                                                  width: double.infinity,
                                                  child: Stack(
                                                    children: [
                                                      SizedBox(
                                                          width:
                                                              double.infinity,
                                                          child: Text(
                                                            "Filtrar",
                                                            textAlign: TextAlign
                                                                .center,
                                                            style:
                                                                headerDialog(),
                                                          )),
                                                      Positioned(
                                                        left: 0,
                                                        child: GestureDetector(
                                                          child: iconDialog(),
                                                          onTap: () {
                                                            Navigator.of(
                                                                    context)
                                                                .pop();
                                                          },
                                                        ),
                                                      ),
                                                    ],
                                                  )),
                                              const SizedBox(
                                                height: 5,
                                              ),
                                              Expanded(
                                                  child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                children: [
                                                  SizedBox(
                                                    height: 5,
                                                  ),
                                                  SizedBox(
                                                      width: double.infinity,
                                                      child: Text(
                                                        "Ordenar por",
                                                        textAlign:
                                                            TextAlign.start,
                                                        style: subTitulo(),
                                                      )),
                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceEvenly,
                                                    children: [
                                                      OutlinedButton(
                                                          onPressed: () {},
                                                          child:
                                                              Text("Nombre")),
                                                      ElevatedButton(
                                                          onPressed: () {},
                                                          child: Text(
                                                              "Mas cercano"))
                                                    ],
                                                  ),
                                                  SizedBox(
                                                    width: double.infinity,
                                                    child: Text(
                                                      "Filtrar por",
                                                      style: subTitulo(),
                                                    ),
                                                  ),
                                                  Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceAround,
                                                    children: [
                                                      Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: [
                                                          Text("Evento"),
                                                          Checkbox(
                                                              value: true,
                                                              onChanged:
                                                                  (value) {})
                                                        ],
                                                      ),
                                                      Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: [
                                                          Text("Recordatorio"),
                                                          Checkbox(
                                                              value: true,
                                                              onChanged:
                                                                  (value) {})
                                                        ],
                                                      ),
                                                      SizedBox(
                                                        width: double.infinity,
                                                        child: Column(
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .end,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .end,
                                                          children: [
                                                            TextButton(
                                                                onPressed: () {
                                                                  Navigator.of(
                                                                          context)
                                                                      .pop();
                                                                },
                                                                child: Text(
                                                                  "Aplicar",
                                                                  style:
                                                                      subTitulo(),
                                                                ))
                                                          ],
                                                        ),
                                                      )
                                                    ],
                                                  )
                                                ],
                                              ))
                                            ],
                                          ),
                                        ),
                                      ));
                                },
                              );
                            },
                            style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all(
                                    Color(0xff5B83A1)),
                                shape: MaterialStatePropertyAll<
                                        RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(100)))),
                            child: Row(
                              children: [
                                Text(
                                  "Filtrar",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 12),
                                ),
                                Icon(
                                  Icons.filter_alt,
                                  size: 15,
                                  color: Colors.white,
                                )
                              ],
                            )))
                  ],
                ),
                Expanded(
                    child: ListView.builder(
                  itemBuilder: (context, index) {
                    return AlarmListItem(
                      alarma: currentState.alarms[index],
                    );
                  },
                  itemCount: currentState.alarms.length,
                ))
              ]),
            );
          }
        },
      ),
      bottomNavigationBar:
          BottomNavigationBar(items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.view_agenda),
          label: 'Agenda',
        ),
      ]),
    );
  }
}
