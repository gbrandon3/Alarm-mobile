import 'dart:ffi';
import 'dart:math';

import 'package:alarm_movil/model/alarm.dart';
import 'package:alarm_movil/views/styles/style.dart';
import 'package:calendar_view/calendar_view.dart';
import 'package:flutter/material.dart';

DateTime get _now => DateTime.now();

class Calendar extends StatefulWidget {
  final _breakPoint = 490.0;

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return CalendarState();
  }
}

class CalendarState extends State<Calendar> {
  String value = "Dia";
  final List<String> dias = ["D", "L", "M", "X", "J", "V", "S"];
  final List<int> fechas = [16, 5, 9, 10];

  final tipo = ["Recordatorio", "Evento", "Recordatorio", "Evento"];
  @override
  Widget build(BuildContext context) {
    final alarmas = [4, 9, 8, 11];

    // TODO: implement build
    return Container(
        child: Column(
      children: [
        SizedBox(
          height: 30,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Row(
                children: [
                  Text("Dia",
                      style: TextStyle(
                          color: Color(0xff5B83A1),
                          fontWeight: FontWeight.w600)),
                  Radio(
                      value: "Dia",
                      groupValue: value,
                      onChanged: (valueS) {
                        setState(() {
                          value = valueS!;
                        });
                      })
                ],
              ),
              Row(
                children: [
                  Text(
                    "Mes",
                    style: TextStyle(
                        color: Color(0xff5B83A1), fontWeight: FontWeight.w600),
                  ),
                  Radio(
                      value: "Mes",
                      groupValue: value,
                      onChanged: (valueS) {
                        print(valueS!);
                        setState(() {
                          value = valueS;
                        });
                        print(value);
                      })
                ],
              )
            ],
          ),
        ),
        if (value == "Dia")
          Expanded(
              child: Stack(children: [
            ListView.builder(
              itemBuilder: (context, index) {
                return Container(
                    height: 100,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        border:
                            Border(top: BorderSide(color: Color(0xff9C9C9C)))),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(
                            child: Container(
                          decoration: BoxDecoration(
                              border: Border(
                                  right: BorderSide(color: Color(0xff9C9C9C)))),
                          child: Center(
                              child: Text(
                            index <= 11
                                ? index + 1 < 10
                                    ? "${index + 1}:00 Am"
                                    : "${index + 1}:00 Am"
                                : "${(index % 12) + 1}:00 PM",
                            style: TextStyle(color: Color(0xff5B83A1)),
                          )),
                        )),
                        Expanded(
                          flex: 3,
                          child: Container(
                            height: 100,
                            padding: EdgeInsets.only(
                                left: 5, right: 5, top: 5, bottom: 5),
                            child: Container(
                              padding: EdgeInsets.only(left: 10, top: 10),
                              decoration: BoxDecoration(
                                  color: !alarmas.contains(index)
                                      ? Colors.transparent
                                      : tipo[alarmas.indexOf(index)] == "Evento"
                                          ? eventColor
                                          : remiderColor,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(5))),
                              child: !alarmas.contains(index)
                                  ? const Text("")
                                  : Text(tipo[alarmas.indexOf(index)],
                                      style: TextStyle(
                                          fontWeight: FontWeight.w800,
                                          color: Colors.white,
                                          fontSize: 15)),
                            ),
                          ),
                        )
                      ],
                    ));
              },
              itemCount: 24,
            ),
          ])),
        if (value == "Mes")
          Container(
              color: Colors.white,
              padding: EdgeInsets.symmetric(horizontal: 10),
              height: MediaQuery.of(context).size.height * 0.7,
              width: MediaQuery.of(context).size.width,
              child: calendarColumn())
      ],
    ));
  }

  Column calendarColumn() {
    return Column(
      children: List.generate(
          7,
          (index) => index == 0
              ? calendarRow(index)
              : Expanded(child: calendarRow(index))),
    );
  }

  Row calendarRow(int index) {
    if (index == 0) {
      return Row(
        children: List.generate(6, (index) => Expanded(child: rowItem(index))),
      );
    } else {
      return Row(
          children: List.generate(
              6,
              (index2) => Expanded(
                  child: rowDay(index2, index2 + (index - 1) * 6,
                      last: index == 6))));
    }
  }

  Container rowDay(int index, int col, {bool last = false}) {
    int num = col % 31;

    String value = num > 30
        ? "${col - 30 % 31}"
        : num == 0
            ? "31"
            : "$num";

    return Container(
      decoration: BoxDecoration(
        border: index == 0 ? firstCell(last) : cell(last),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            value,
            style: TextStyle(
                color: (col > 30 && index != 1) || (num == 0 && index == 0)
                    ? Color(0xff9C9C9C)
                    : num == _now.day
                        ? primaryColor
                        : Colors.black),
          ),
          if (fechas.indexOf(num) != -1)
            Container(
                padding: EdgeInsets.only(left: 5, top: 10, right: 5),
                margin: EdgeInsets.only(bottom: 5, left: 5, right: 5),
                decoration: BoxDecoration(
                  color: tipo[fechas.indexOf(num)] == "Evento"
                      ? eventColor
                      : remiderColor,
                )),
        ],
      ),
    );
  }

  Border cell(bool last) {
    if (last) {
      return const Border(
          top: BorderSide(
            color: Color(0xff9C9C9C),
          ),
          bottom: BorderSide(
            color: Color(0xff9C9C9C),
          ),
          right: BorderSide(color: Color(0xff9C9C9C)));
    }
    return const Border(
        top: BorderSide(
          color: Color(0xff9C9C9C),
        ),
        right: BorderSide(color: Color(0xff9C9C9C)));
  }

  Border firstCell(bool last) {
    if (last) {
      return Border.all(color: Color(0xff9C9C9C));
    }
    return const Border(
        top: BorderSide(
          color: Color(0xff9C9C9C),
        ),
        right: BorderSide(color: Color(0xff9C9C9C)),
        left: BorderSide(color: Color(0xff9C9C9C)));
  }

  Container rowItem(int index) {
    return Container(
      decoration: BoxDecoration(
          border: index == 0
              ? Border(
                  top: BorderSide(
                    color: Color(0xff9C9C9C),
                  ),
                  right: BorderSide(color: Color(0xff9C9C9C)),
                  left: BorderSide(color: Color(0xff9C9C9C)))
              : Border(
                  top: BorderSide(
                    color: Color(0xff9C9C9C),
                  ),
                  right: BorderSide(color: Color(0xff9C9C9C)))),
      child: Center(
          child: Text(
        dias[index],
        style: TextStyle(color: primaryColor, fontWeight: FontWeight.w700),
      )),
    );
  }
}
    /*/CalendarControllerProvider<Event>(
        controller: EventController<Event>()..addAll(_events),
        child: DayView<Event>(
          initialDay: _now,
          maxDay: _now,
          minDay: _now,
          width: width,
        ));
  }
}

@immutable
class Event {
  final String title;

  const Event({this.title = "Title"});

  @override
  bool operator ==(Object other) => other is Event && title == other.title;

  @override
  int get hashCode => super.hashCode;

  @override
  String toString() => title;
}
*/