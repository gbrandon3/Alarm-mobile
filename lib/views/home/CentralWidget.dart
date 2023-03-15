import 'package:alarm_movil/views/home/contacts/contacts.dart';
import 'package:alarm_movil/views/home/home.dart';
import 'package:alarm_movil/views/home/settings/settingAccount.dart';
import 'package:alarm_movil/views/styles/style.dart';
import 'package:flutter/material.dart';

import '../../model/alarm.dart';
import '../Alarm/alarm-create/CreateAlarmBlocProvider.dart';
import 'calendar/calendar.dart';

class CentralWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return CentralWidgetState();
  }
}

class CentralWidgetState extends State<CentralWidget> {
  int index = 0;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  final titleBar = ["Alarmas creadas", "Agenda", "Contactos", "Configuracion"];
  final widgetOptions = <Widget>[
    Home(),
    Calendar(),
    Contacts(),
    SettingAccount(),
  ];
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      floatingActionButton: Visibility(
          visible: index == 0,
          child: FloatingActionButton(
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
              })),
      appBar: AppBar(
        title: Text(
          titleBar[index].toUpperCase(),
          style: titulo(),
        ),
      ),
      body: widgetOptions[index],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: index,
        onTap: (value) => {
          setState(() {
            if (index != value) {
              index = value;
            }
          })
        },
        showSelectedLabels: false,
        showUnselectedLabels: false,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              label: '',
              icon: Container(
                decoration: BoxDecoration(
                  color: index == 0 ? primaryColor : Colors.transparent,
                  shape: BoxShape.circle,
                ),
                height: 50,
                width: 50,
                child: Center(
                    child: Icon(
                  Icons.home,
                  color: index == 0 ? Colors.white : Color(0xff9C9C9C),
                )),
              )),
          BottomNavigationBarItem(
              label: '',
              icon: Container(
                decoration: BoxDecoration(
                  color: index == 1 ? primaryColor : Colors.transparent,
                  shape: BoxShape.circle,
                ),
                height: 50,
                width: 50,
                child: Center(
                    child: Icon(
                  Icons.calendar_today,
                  color: index == 1 ? Colors.white : Color(0xff9C9C9C),
                )),
              )),
          BottomNavigationBarItem(
              label: '',
              icon: Container(
                decoration: BoxDecoration(
                  color: index == 2 ? primaryColor : Colors.transparent,
                  shape: BoxShape.circle,
                ),
                height: 50,
                width: 50,
                child: Center(
                    child: Icon(
                  Icons.account_box,
                  color: index == 2 ? Colors.white : Color(0xff9C9C9C),
                )),
              )),
          BottomNavigationBarItem(
              label: '',
              icon: Container(
                decoration: BoxDecoration(
                  color: index == 3 ? primaryColor : Colors.transparent,
                  shape: BoxShape.circle,
                ),
                height: 50,
                width: 50,
                child: Center(
                    child: Icon(
                  Icons.settings,
                  color: index == 3 ? Colors.white : Color(0xff9C9C9C),
                )),
              )),
        ],
      ),
    );
  }
}
