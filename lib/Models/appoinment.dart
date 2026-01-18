
import 'package:kuafor_randevu_takip_uygulamasi/Models/hairdresser.dart';

import 'service_model.dart';

class Appointment{

  final String time;

  final String date;

  final bool isItAccepted;

  final HairDresser hairDresser;

  final List<ServiceModel> models;

  Appointment({required this.time,required this.date,required this.isItAccepted,required this.hairDresser,required this.models});



  factory Appointment.fromDb(Map<String,dynamic> map,HairDresser hairdresser,List<ServiceModel>serviceModels)
  {
    return Appointment(
        time: map["time"],
        date: map["date"],
        isItAccepted:map["isAcceptable"],
        hairDresser: hairdresser,
        models:serviceModels
    );
  }




}