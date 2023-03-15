part of 'alarm_bloc.dart';

@immutable
abstract class AlarmEvent {}

class Initial extends AlarmEvent {}

class CreateAlarm extends AlarmEvent {}

class EditAlarm extends AlarmEvent {}

class DeleteAlarm extends AlarmEvent {
  int index;
  DeleteAlarm({required this.index});
}

class DetailAlarm extends AlarmEvent {}

class SaveAlarm extends AlarmEvent {
  Alarm alarm;
  int index;
  SaveAlarm(this.alarm, this.index);
}
