import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../model/alarm.dart';

part 'alarm_event.dart';
part 'alarm_state.dart';

class AlarmBloc extends Bloc<AlarmEvent, AlarmState> {
  AlarmBloc() : super(AlarmInitial()) {
    on<AlarmEvent>((event, emit) {});
    on<Initial>(((event, emit) => {emit(AlarmLoaded(alarms: []))}));
  }
}
