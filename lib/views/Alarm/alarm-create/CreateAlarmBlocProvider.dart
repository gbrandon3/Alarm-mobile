import 'package:alarm_movil/alarm_bloc/alarm_bloc.dart';
import 'package:alarm_movil/views/Alarm/alarm-create/CreateAlarm.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../bloc/create_alarm_bloc.dart';
import '../../../model/alarm.dart';

class CreateAlarmBlocProvider extends StatelessWidget {
  Alarm alarm;
  int index;
  CreateAlarmBlocProvider({required this.alarm, this.index = -1});
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return BlocProvider(
      create: (context) => CreateAlarmBloc(alarm, index),
      child: CreateAlarmView(
        editAlarm: alarm.tipo != "" ? alarm : null,
      ),
    );
  }
}
