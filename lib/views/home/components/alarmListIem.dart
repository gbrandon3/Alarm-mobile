import 'package:alarm_movil/views/Alarm/alarm-detail/alarmDetail.dart';
import 'package:alarm_movil/views/styles/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../alarm_bloc/alarm_bloc.dart';
import '../../../model/alarm.dart';
import '../../Alarm/alarm-create/CreateAlarmBlocProvider.dart';

class AlarmListItem extends StatelessWidget {
  Alarm alarma;
  int index;
  AlarmListItem({required this.alarma, required this.index});
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
        margin: EdgeInsets.only(top: 5),
        width: MediaQuery.of(context).size.width * 0.88,
        padding: EdgeInsets.only(right: 5, bottom: 5),
        height: 100,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(5)),
            boxShadow: [
              BoxShadow(
                  offset: const Offset(0.0, 4),
                  blurRadius: 4,
                  color: Colors.black.withOpacity(0.25))
            ],
            color: alarma.tipo == "Evento" ? eventColor : remiderColor),
        child: Container(
          padding: EdgeInsets.all(5),
          decoration: BoxDecoration(color: Colors.white),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                  flex: 4,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(alarma.nombre, style: alarmName()),
                      Text(
                        alarma.tipo,
                        style: const TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                            color: Color(0xffAFAFAF)),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        alarma.fecha,
                        style: const TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                            color: Color(0xffAFAFAF)),
                      ),
                    ],
                  )),
              Expanded(
                  flex: 2,
                  child: Row(
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Row(children: [
                            IconButton(
                              icon: Icon(Icons.delete),
                              onPressed: () {
                                showDialog<void>(
                                    context: context,
                                    barrierDismissible:
                                        false, // user must tap button!
                                    builder: (BuildContext context2) {
                                      return AlertDialog(
                                        title: Text(
                                          'Eliminar alarma',
                                          style: TextStyle(color: primaryColor),
                                        ),
                                        content: SingleChildScrollView(
                                          child: ListBody(
                                            children: const <Widget>[
                                              Text(
                                                  'Seguro que deseas eliminar esta alarma'),
                                            ],
                                          ),
                                        ),
                                        actions: <Widget>[
                                          TextButton(
                                              onPressed: () {
                                                BlocProvider.of<AlarmBloc>(
                                                        context)
                                                    .add(DeleteAlarm(
                                                        index: index));
                                                Navigator.of(context).pop();
                                              },
                                              child: Text(
                                                "Si",
                                                style: TextStyle(fontSize: 18),
                                              )),
                                          TextButton(
                                              onPressed: () {
                                                Navigator.of(context).pop();
                                              },
                                              child: Text(
                                                "No",
                                                style: TextStyle(fontSize: 18),
                                              ))
                                        ],
                                      );
                                    });
                              },
                            ),
                            IconButton(
                              icon: Icon(Icons.edit),
                              onPressed: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) =>
                                        CreateAlarmBlocProvider(
                                          alarm: alarma,
                                          index: index,
                                        )));
                              },
                            )
                          ])
                        ],
                      )
                    ],
                  )),
              Expanded(
                  flex: 1,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                          margin: EdgeInsets.only(right: 2),
                          child: IconButton(
                              onPressed: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) =>
                                        AlarmDetail(alarm: alarma)));
                              },
                              icon: Icon(
                                Icons.chevron_right,
                                size: 60,
                              )))
                    ],
                  ))
            ],
          ),
        ));
  }
}
