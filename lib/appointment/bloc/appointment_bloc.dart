import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:kuafor_randevu_takip_uygulamasi/appointment/bloc/appointment_event.dart';
import 'package:kuafor_randevu_takip_uygulamasi/appointment/bloc/appointment_status.dart';
import '../../Models/service_model.dart';
import '../../core/consts.dart';

class AppointmentBloc extends Bloc<AppoinmentsEvent,AppointmentStatus>
{

  AppointmentBloc():super(AppointmentStatus(services: [],
    date:Consts.converttoDate(DateTime.now()),
    dateForDb: DateFormat("dd.MM.yyyy").format(DateTime.now(),),
    status:PageStatus.idle,
  ))
  {
    on<AddServiceForAppointment>(

        (event,emit)
        {
          final updateServices=List<ServiceModel>.from(state.services)..add(event.service);
          emit(state.copyWith(services: updateServices));
        }
    );
    on<RemoveServiceForAppoinmentList>((event, emit) {
      final updatedServices = List<ServiceModel>.from(state.services)..removeWhere((service) => service.id == event.id);
      emit(state.copyWith(services: updatedServices));
    });

    on<ChooseTheDate>((event, emit) {
      final now = DateTime.now();
      final today = DateTime(now.year, now.month, now.day);
      final selectedDate = DateTime(event.date.year, event.date.month, event.date.day);
      if (selectedDate.isBefore(today))
      {
        emit(state.copyWith(status: PageStatus.error));
        emit(state.copyWith(status: PageStatus.idle));
      }
      else {
        emit(state.copyWith(date: Consts.converttoDate(event.date),
          dateForDb: DateFormat("dd.MM.yyyy").format(event.date),
          status: PageStatus.success,
        ));
      }
    });
  }
}