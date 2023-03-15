import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../bloc/create_alarm_bloc.dart';

class HourPicker extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return HourPickerState();
  }
}

class HourPickerState extends State<HourPicker> {
  List<String> hour = [
    '01',
    '02',
    '03',
    '04',
    '05',
    '06',
    '07',
    '08',
    '09',
    '10',
    '11',
    '12',
  ];
  List<String> time1 = ['Mañana', 'Tarde'];
  List<String> time2 = ['Mañana', 'Noche'];
  List<String> minutes = [
    '00',
    '01',
    '02',
    '03',
    '04',
    '05',
    '06',
    '07',
    '08',
    '09',
    '10',
    '11',
    '12',
    '13',
    '14',
    '15',
    '16',
    '17',
    '18',
    '19',
    '20',
    '21',
    '22',
    '23',
    '24',
    '25',
    '26',
    '27',
    '28',
    '29',
    '30',
    '31',
    '32',
    '33',
    '34',
    '35',
    '36',
    '37',
    '38',
    '39',
    '40',
    '41',
    '42',
    '43',
    '44',
    '45',
    '46',
    '47',
    '48',
    '49',
    '50',
    '51',
    '52',
    '53',
    '54',
    '55',
    '56',
    '57',
    '58',
    '59',
  ];
  int selectedHour = 5;
  int previousHour = 4;
  int nextHour = 6;
  int selectedMinute = 0;
  int nextMinute = 1;
  int previousMinute = 59;
  int selectedTime = 0;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return BlocListener<CreateAlarmBloc, CreateAlarmState>(
      listener: (context, state) {
        if (state is CreateAlarmInitial && state.uploading) {
          String hourString = "";
          if (selectedTime >= 5) {
            hourString =
                "${hour[selectedHour]}:${minutes[selectedMinute]} ${time1[selectedTime]}";
          } else {
            hourString =
                "${hour[selectedHour]}:${minutes[selectedMinute]} ${time2[selectedTime]}";
          }

          BlocProvider.of<CreateAlarmBloc>(context).add(Submit(hourString));
        }
      },
      child: Container(
        width: 200,
        height: 120,
        child: Row(
          children: [
            choiceRow(hour, selectedHour, previousHour, nextHour, () {
              changeHour(1);
            }, () {
              changeHour(-1);
            }),
            choiceRow(minutes, selectedMinute, previousMinute, nextMinute, () {
              changeMinute(1);
            }, () {
              changeMinute(-1);
            }),
            timeChoiceRow(),
          ],
        ),
      ),
    );
  }

  Expanded timeChoiceRow() {
    return Expanded(
        child: Container(
      child: Column(
        children: [
          Expanded(
              child: Visibility(
                  visible: selectedTime == 1,
                  child: GestureDetector(
                    onTap: () {
                      changeTime();
                    },
                    child: Text(
                      selectedHour <= 5 ? time1[0] : time2[0],
                      style: choiceTimeStyle(),
                    ),
                  ))),
          Expanded(
            flex: 2,
            child: Container(
                decoration: const BoxDecoration(
                    border: Border.symmetric(
                        horizontal: BorderSide(color: Colors.blue))),
                child: Center(
                    child: Text(
                        selectedHour <= 5
                            ? time1[selectedTime]
                            : time2[selectedTime],
                        style: selectedTimeStyle()))),
          ),
          Expanded(
              child: Visibility(
            visible: selectedTime == 0,
            child: GestureDetector(
              onTap: () {
                changeTime();
              },
              child: Container(
                child: Text(
                  selectedHour <= 5 ? time1[1] : time2[1],
                  style: choiceTimeStyle(),
                ),
              ),
            ),
          )),
        ],
      ),
    ));
  }

  Expanded choiceRow(List<String> list, int current, int previous, int next,
      void Function() add, void Function() substract) {
    return Expanded(
        child: Container(
      child: Column(
        children: [
          Expanded(
              child: GestureDetector(
            onTap: substract,
            child: Text(
              list[previous],
              style: choiceStyle(),
            ),
          )),
          Expanded(
            flex: 2,
            child: Container(
                decoration: const BoxDecoration(
                    border: Border.symmetric(
                        horizontal: BorderSide(color: Colors.blue))),
                child: Center(
                    child: Text(list[current], style: selectedHourStyle()))),
          ),
          Expanded(
              child: GestureDetector(
            onTap: add,
            child: Text(
              list[next],
              style: choiceStyle(),
            ),
          )),
        ],
      ),
    ));
  }

  changeMinute(int value) {
    if (selectedMinute == 0) {
      setState(() {
        selectedMinute = value > 0 ? value + selectedMinute : 59;
      });

      if (selectedMinute == 59) {
        changeHour(-1);
      }
    } else if (selectedMinute == 59) {
      setState(() {
        selectedMinute = value > 0 ? 0 : selectedMinute + value;
      });
      if (selectedMinute == 0) {
        changeHour(1);
      }
    } else {
      setState(() {
        selectedMinute = selectedMinute + value;
      });
    }
    setState(() {
      previousMinute = selectedMinute != 0 ? selectedMinute - 1 : 59;
      nextMinute = selectedMinute != 59 ? selectedMinute + 1 : 0;
    });
  }

  changeTime() {
    setState(() {
      selectedTime = selectedTime == 1 ? 0 : 1;
    });
  }

  changeHour(int number) {
    print(selectedHour <= 5 ? time1[0] : time2[0]);
    if (selectedHour == 0) {
      setState(() {
        selectedHour = number > 0 ? number + selectedHour : 11;
      });

      if (selectedHour == 11) {
        changeTime();
      }
    } else if (this.selectedHour == 11) {
      setState(() {
        selectedHour = number > 0 ? 0 : number + selectedHour;
      });
      if (this.selectedHour == 0) {
        changeTime();
      }
    } else {
      setState(() {
        selectedHour = number + selectedHour;
      });
    }
    setState(() {
      previousHour = selectedHour != 0 ? selectedHour - 1 : 11;
      nextHour = selectedHour != 11 ? selectedHour + 1 : 0;
    });
  }

  final colorChoice = Color(0xff9C9C9C);
  TextStyle selectedHourStyle() {
    return const TextStyle(
        color: Colors.black, fontSize: 30, fontWeight: FontWeight.w800);
  }

  TextStyle selectedTimeStyle() {
    return const TextStyle(
        color: Colors.black, fontSize: 18, fontWeight: FontWeight.w800);
  }

  TextStyle choiceTimeStyle() {
    return TextStyle(
        color: colorChoice, fontSize: 15, fontWeight: FontWeight.w500);
  }

  TextStyle choiceStyle() {
    return TextStyle(
        color: colorChoice, fontSize: 20, fontWeight: FontWeight.w500);
  }
}
