import '../../Models/service_model.dart';

enum PageStatus{idle,error,success,loading}


class AppointmentStatus{
  final PageStatus status;
  final List<ServiceModel> services;
  final String date;
  final String dateForDb;

  AppointmentStatus({required this.services,required this.date,required this.dateForDb,required this.status});

  AppointmentStatus copyWith({List<ServiceModel> ? services,String ? date,String ? dateForDb,PageStatus? status})
  {
    return
        AppointmentStatus(
            services: services ??this.services,
            date:date?? this.date,
            dateForDb: dateForDb??this.dateForDb,
            status:status??this.status
        );
  }
}