import '../../Models/service_model.dart';
abstract class AppoinmentsEvent{}
class AddServiceForAppointment extends AppoinmentsEvent
{
  final ServiceModel service;
  AddServiceForAppointment({required this.service});
}
class RemoveServiceForAppoinmentList extends AppoinmentsEvent
{
  final String id;
  RemoveServiceForAppoinmentList({required this.id});
}


