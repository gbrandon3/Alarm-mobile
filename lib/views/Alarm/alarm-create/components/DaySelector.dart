import 'package:alarm_movil/views/styles/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../bloc/create_alarm_bloc.dart';

class DaySelector extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return DaySelectorState();
  }

  String date;
  DaySelector({required this.date});
}

class DaySelectorState extends State<DaySelector> {
  final List<String> days = ["D", "L", "M", "X", "J", "V", "S"];
  List<int> daysSelected = [0, 1, 2, 3, 4, 5, 6];
  String fecha = "Repetir cada";
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if (widget.date != "") {
      setState(() {
        if (days.contains(widget.date[0])) {
          daysSelected = [];
          for (var i = 0; i < widget.date.length; i++) {
            daysSelected.add(days.indexOf(widget.date[i]));
          }
        } else {
          fecha = widget.date;
        }
      });
    }
  }

  static const selectedColor = Color(0xff5B83A1);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      children: [
        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Text(
            fecha,
            style: const TextStyle(
                fontSize: 18,
                color: Color(0xff5B83A1),
                fontWeight: FontWeight.w600),
          ),
          GestureDetector(
            child: const Icon(Icons.calendar_month, color: selectedColor),
            onTap: () {
              showDatePicker(
                  locale: Locale('es'),
                  context: context,
                  initialDate: this.fecha != "Repetir cada"
                      ? DateTime.parse(fecha)
                      : DateTime.now(),
                  firstDate: DateTime.now(),
                  lastDate: DateTime(DateTime.now().year + 3,
                      DateTime.now().month, DateTime.now().day),
                  builder: (BuildContext context, child) {
                    return Theme(
                      data: Theme.of(context).copyWith(
                        dialogTheme: DialogTheme(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(
                                16.0), // this is the border radius of the picker
                          ),
                        ),
                      ),
                      child: child!,
                    );
                  }).then((value) {
                if (value != null) {
                  setState(() {
                    fecha = value!.toIso8601String().split("T").first;
                    daysSelected = [];
                  });
                  BlocProvider.of<CreateAlarmBloc>(context).add(
                      SetDate(value!.toIso8601String().split("T").first, []));
                }
              });
            },
          )
        ]),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: List.generate(
              days.length, (index) => dayWidget(days[index], index)),
        )
      ],
    );
  }

  GestureDetector dayWidget(String day, int index) {
    return GestureDetector(
      child: Text(
        day,
        style: TextStyle(
            color: daysSelected.contains(index) && fecha == "Repetir cada"
                ? selectedColor
                : const Color(0xffBEBEBE)),
      ),
      onTap: () {
        int dayIndex = days.indexOf(day);
        int indexF = daysSelected.firstWhere((item) => item == dayIndex,
            orElse: () => -1);
        if (indexF == -1) {
          setState(() {
            daysSelected.add(index);
            if (fecha != "Repetir cada") {
              setState(() {
                fecha = "Repetir cada";
              });
            }
          });
        } else {
          setState(() {
            if (daysSelected.length != 1 && fecha == "Repetir cada") {
              daysSelected.remove(indexF);

              fecha = "Repetir cada";
            }
          });
        }
        BlocProvider.of<CreateAlarmBloc>(context).add(AddDay(daysSelected));
      },
    );
  }
}
