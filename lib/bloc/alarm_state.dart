part of 'alarm_bloc.dart';

@immutable
abstract class AlarmState {}

class AlarmInitial extends AlarmState {}

class AlarmLoaded extends AlarmState {
  List<Alarm> alarms;
  AlarmLoaded({required this.alarms});
}
