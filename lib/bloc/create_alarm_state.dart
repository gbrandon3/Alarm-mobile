part of 'create_alarm_bloc.dart';

@immutable
abstract class CreateAlarmState {}

class CreateAlarmInitial extends CreateAlarmState {
  Alarm alarm;
  String fechaString;
  bool uploading;
  List<int> days;
  bool save;
  CreateAlarmInitial(
      {required this.alarm,
      this.fechaString = "",
      this.uploading = false,
      this.days = const [0, 1, 2, 3, 4, 5, 6],
      this.save = false});
  CreateAlarmInitial copyWith(
          {Alarm? alarm,
          String? fechaString,
          bool? uploading,
          List<int>? days,
          bool? save}) =>
      CreateAlarmInitial(
          alarm: alarm ?? this.alarm,
          fechaString: fechaString ?? this.fechaString,
          uploading: uploading ?? this.uploading,
          days: days ?? this.days,
          save: save ?? this.save);
}
