import 'package:alarm_movil/bloc/alarm_bloc.dart';
import 'package:alarm_movil/views/Alarm/alarm-create/CreateAlarm.dart';
import 'package:alarm_movil/views/home/components/noAlarms.dart';
import 'package:alarm_movil/views/styles/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
            Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => CreateAlarmView()));
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

            return Text("yo");
          }
        },
      ),
    );
  }
}
