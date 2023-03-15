import 'package:alarm_movil/alarm_bloc/alarm_bloc.dart';
import 'package:alarm_movil/views/Alarm/alarm-create/CreateAlarm.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../bloc/create_alarm_bloc.dart';
import '../../../model/alarm.dart';

class CreateAlarmBlocProvider extends StatelessWidget {
  Alarm alarm;
  CreateAlarmBlocProvider({required this.alarm});
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return BlocProvider(
      create: (context) => CreateAlarmBloc(alarm),
      child: CreateAlarmView(),
    );
  }
}
