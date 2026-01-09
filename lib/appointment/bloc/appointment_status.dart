import '../../Models/service_model.dart';
class AppointmentStatus{
  final List<ServiceModel> services;

  AppointmentStatus({required this.services});

  AppointmentStatus copyWith({List<ServiceModel> ?servicesFromDb,List<ServiceModel> ? services})
  {
    return
        AppointmentStatus(
            services: services ??this.services
        );
  }
}