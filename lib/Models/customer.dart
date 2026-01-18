import 'package:kuafor_randevu_takip_uygulamasi/Models/appoinment.dart';
class Customer{
  final String id;

  final String name;

  final String surname;

  final String phoneNumber;

  final List<Appointment> appointments;

  Customer({required this.id,required this.name,required this.surname,required this.phoneNumber,required this.appointments});

  Map<String,dynamic> convertToMap()=>{"appointments":appointments};
  factory Customer.fromDb(String id,Map<String,dynamic>map,List<Appointment>appointments)
  {
    return Customer(
      id:id,
      name:map["name"],
      surname: map["surname"],
      phoneNumber: map["phoneNumber"],
      appointments: appointments
    );
  }
}