part of 'create_alarm_bloc.dart';

@immutable
abstract class CreateAlarmEvent {}

class SetType extends CreateAlarmEvent {
  String type;
  SetType(this.type);
}

class SetDate extends CreateAlarmEvent {
  String date;
  List<int> days;
  SetDate(this.date, this.days);
}

class AddContacts extends CreateAlarmEvent {
  List<String> contacts;
  AddContacts(this.contacts);
}

class AddNotificar extends CreateAlarmEvent {
  String val;
  AddNotificar(this.val);
}

class AddRepeter extends CreateAlarmEvent {
  String val;
  AddRepeter(this.val);
}

class AddDay extends CreateAlarmEvent {
  List<int> day;
  AddDay(this.day);
}

class submitting extends CreateAlarmEvent {
  String nombre, descipcion, fecha, lugar;
  submitting(this.nombre, this.descipcion, this.fecha, this.lugar);
}

class Submit extends CreateAlarmEvent {
  String hour;
  Submit(this.hour);
}
