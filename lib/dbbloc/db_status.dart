import '../Models/service_model.dart';

class DbStatus{
  final List<ServiceModel> services;

  DbStatus({required this.services});

  DbStatus copyWith({List<ServiceModel> ?services})
  {
    return DbStatus(services: services??this.services);
  }
}