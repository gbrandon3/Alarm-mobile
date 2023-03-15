import 'package:alarm_movil/views/styles/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../bloc/create_alarm_bloc.dart';

class SettingsCreate extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return SettingsCreateState();
  }
}

class SettingsCreateState extends State<SettingsCreate> {
  final List<String> notificarCada = [
    "5 minutos",
    "10 minutos",
    "15 minutos",
    "20 minutos",
    "No repetir"
  ];
  final List<String> noficiarAntes = [
    '30 minutos antes',
    '25 minutos antes',
    '20 minutos antes',
    '15 minutos antes',
    'No notificar antes',
  ];
  final List<String> notificarAntesVal = [
    '30 min',
    '25 min',
    '20 min',
    '15 min',
    'No'
  ];
  final List<String> notificarCadaVal = [
    "5 min",
    "10 min",
    "15 min",
    "20 min",
    "No"
  ];
  int selectedN = 0;
  int selectedA = 3;
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
            children: [
              Text("Notificar antes"),
              GestureDetector(
                child: Row(children: [
                  Text(notificarAntesVal[selectedA]),
                  Icon(Icons.chevron_right)
                ]),
                onTap: () {
                  showModalBottomSheet<void>(
                      context: context,
                      backgroundColor: backgroundColor,
                      shape: const RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.vertical(top: Radius.circular(25)),
                      ),
                      builder: (BuildContext context2) {
                        return StatefulBuilder(
                            builder: (context2, StateSetter setState) {
                          return Container(
                            padding: EdgeInsets.only(top: 10),
                            height: 300,
                            child: Column(
                              children: [
                                Stack(
                                  children: [
                                    SizedBox(
                                        width: double.infinity,
                                        child: Text(
                                          "Notificar antes",
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
                                    child: Container(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 20),
                                        child: Column(
                                          children: List.generate(
                                              noficiarAntes.length,
                                              (index) => notificarCadaItem(
                                                      noficiarAntes[index],
                                                      (valueS) {
                                                    String current =
                                                        noficiarAntes[
                                                            selectedA];
                                                    if (valueS != current) {
                                                      setState(() {
                                                        selectedA =
                                                            noficiarAntes
                                                                .indexOf(
                                                                    valueS!);
                                                      });
                                                      BlocProvider.of<
                                                                  CreateAlarmBloc>(
                                                              context)
                                                          .add(AddNotificar(
                                                              notificarAntesVal[
                                                                  selectedA]));
                                                    }
                                                    Navigator.of(context).pop();
                                                  }, selectedA, noficiarAntes)),
                                        ))),
                              ],
                            ),
                          );
                        });
                      });
                },
              )
            ],
          )),
          Expanded(
              child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text("Recordar Cada"),
              GestureDetector(
                child: Row(children: [
                  Text(notificarCada[selectedN]),
                  Icon(Icons.chevron_right)
                ]),
                onTap: () {
                  showModalBottomSheet<void>(
                      context: context,
                      backgroundColor: backgroundColor,
                      shape: const RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.vertical(top: Radius.circular(25)),
                      ),
                      builder: (BuildContext context2) {
                        return StatefulBuilder(
                            builder: (context2, StateSetter setState) {
                          return Container(
                            padding: EdgeInsets.only(top: 10),
                            height: 300,
                            child: Column(
                              children: [
                                Stack(
                                  children: [
                                    SizedBox(
                                        width: double.infinity,
                                        child: Text(
                                          "Notificar cada",
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
                                    child: Container(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 20),
                                        child: Column(
                                          children: List.generate(
                                              notificarCada.length,
                                              (index) => notificarCadaItem(
                                                      notificarCada[index],
                                                      (valueS) {
                                                    String current =
                                                        notificarCada[
                                                            selectedN];
                                                    if (valueS != current) {
                                                      setState(() {
                                                        selectedN =
                                                            notificarCada
                                                                .indexOf(
                                                                    valueS!);
                                                        print(selectedN);
                                                      });
                                                      BlocProvider.of<
                                                                  CreateAlarmBloc>(
                                                              context)
                                                          .add(AddRepeter(
                                                              notificarCadaVal[
                                                                  selectedN]));
                                                      ;
                                                    }

                                                    Navigator.of(context).pop();
                                                  }, selectedN, notificarCada)),
                                        ))),
                              ],
                            ),
                          );
                        });
                      });
                },
              )
            ],
          )),
          Expanded(
              child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text("Sonido"),
              Row(children: [Text("Sonido 1"), Icon(Icons.chevron_right)])
            ],
          ))
        ],
      ),
    );
  }

  Expanded notificarCadaItem(String type, Function(String?) onChanged,
      int selected, List<String> val) {
    return Expanded(
        child: Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          type,
          style: TextStyle(
            fontSize: 20,
          ),
        ),
        Radio<String>(
            value: type, groupValue: val[selected], onChanged: onChanged)
      ],
    ));
  }
}
