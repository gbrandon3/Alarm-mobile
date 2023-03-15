import 'package:alarm_movil/alarm_bloc/alarm_bloc.dart';
import 'package:bloc/bloc.dart';
import 'package:faker/faker.dart';
import 'package:meta/meta.dart';

import '../model/alarm.dart';

part 'create_alarm_event.dart';
part 'create_alarm_state.dart';

class CreateAlarmBloc extends Bloc<CreateAlarmEvent, CreateAlarmState> {
  CreateAlarmBloc(Alarm alarm) : super(CreateAlarmInitial(alarm: alarm)) {
    on<CreateAlarmEvent>((event, emit) {
      // TODO: implement event handler
    });
    on<SetType>((event, emit) {
      final currentSate = state as CreateAlarmInitial;
      if (event.type != currentSate.alarm.tipo) {
        currentSate.alarm = currentSate.alarm.copyWith(tipo: event.type);

        emit(currentSate.copyWith(alarm: currentSate.alarm));
      }
    });
    on<SetDate>((event, emit) {
      final currentSate = state as CreateAlarmInitial;
      if (event.date != currentSate.fechaString) {
        print(currentSate.fechaString);
        emit(currentSate.copyWith(fechaString: event.date, days: event.days));
      }
    });
    on<AddContacts>((event, emit) {
      final currentSate = state as CreateAlarmInitial;
      currentSate.alarm = currentSate.alarm.copyWith(contacts: event.contacts);
      emit(currentSate.copyWith(alarm: currentSate.alarm));
    });
    on<AddNotificar>((event, emit) {
      final currentSate = state as CreateAlarmInitial;
      if (currentSate.alarm.ajuste.notificarAntes != event.val) {
        currentSate.alarm.ajuste =
            currentSate.alarm.ajuste.copyWith(notificarAntes: event.val);
        emit(currentSate.copyWith(alarm: currentSate.alarm));
      }
    });
    on<AddRepeter>((event, emit) {
      final currentSate = state as CreateAlarmInitial;
      if (currentSate.alarm.ajuste.notificarCada != event.val) {
        currentSate.alarm.ajuste =
            currentSate.alarm.ajuste.copyWith(notificarCada: event.val);
        emit(currentSate.copyWith(alarm: currentSate.alarm));
      }
    });
    on<submitting>((event, emit) {
      final currentState = state as CreateAlarmInitial;
      currentState.alarm = currentState.alarm.copyWith(
          nombre: event.nombre,
          descripcion: event.descipcion,
          fecha: event.fecha,
          lugar: event.lugar);
      emit(currentState.copyWith(uploading: true, alarm: currentState.alarm));
    });
    on<AddDay>((event, emit) {
      final currentState = state as CreateAlarmInitial;
      emit(currentState.copyWith(days: event.day));
    });
    on<Submit>((event, emit) {
      final currentState = state as CreateAlarmInitial;
      var alarma = currentState.alarm;
      if (alarma.nombre.isEmpty) {
        alarma = alarma.copyWith(nombre: alarma.tipo);
      }

      if (currentState.alarm.tipo == "Evento") {
        alarma.fecha = alarma.fecha + " " + event.hour;
      } else {
        final List<String> days = ["D", "L", "M", "X", "J", "V", "S"];
        if (currentState.days.isNotEmpty) {
          var daysSeleted = currentState.days;
          List<int> listDay = [];
          for (var daiy in daysSeleted) {
            listDay.add(daiy);
          }
          listDay.sort((e1, e2) => e1.compareTo(e2));
          String daysS = "";
          for (var day in daysSeleted) {
            daysS = daysS + days[day];
          }
          print(daysS);
          alarma = alarma.copyWith(fecha: daysS + " " + event.hour);
        } else {
          alarma.fecha = currentState.fechaString + " " + event.hour;
        }
      }
      emit(currentState.copyWith(uploading: false, save: true, alarm: alarma));
    });
  }
  @override
  Future<void> close() {
    // TODO: implement close
    print("entro");

    return super.close();
  }
}
