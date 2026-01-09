import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kuafor_randevu_takip_uygulamasi/appointment/bloc/appointment_event.dart';
import 'package:kuafor_randevu_takip_uygulamasi/appointment/bloc/appointment_status.dart';
import '../../Models/service_model.dart';

class AppointmentBloc extends Bloc<AppoinmentsEvent,AppointmentStatus>
{

  AppointmentBloc():super(AppointmentStatus(services: []))
  {
    on<AddServiceForAppointment>(

        (event,emit)
        {
          final updateServices=List<ServiceModel>.from(state.services)..add(event.service);
          emit(AppointmentStatus(services: updateServices));
        }
    );
    on<RemoveServiceForAppoinmentList>((event, emit) {
      final updatedServices = List<ServiceModel>.from(state.services)
        ..removeWhere((service) => service.id == event.id);

      emit(state.copyWith(services: updatedServices));
    });



  }
}