import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../model/alarm.dart';

part 'alarm_event.dart';
part 'alarm_state.dart';

class AlarmBloc extends Bloc<AlarmEvent, AlarmState> {
  AlarmBloc() : super(AlarmInitial()) {
    on<AlarmEvent>((event, emit) {});
    on<Initial>(((event, emit) => {emit(AlarmLoaded(alarms: []))}));
    on<SaveAlarm>(((event, emit) {
      if (state is AlarmInitial) {
        final newState = AlarmLoaded(alarms: []);
        newState.alarms.add(event.alarm);
        emit(newState);
      } else {
        final currentState = state as AlarmLoaded;
        currentState.alarms.add(event.alarm);
        emit(currentState.copyWith(alarms: currentState.alarms));
      }
    }));
  }
}
