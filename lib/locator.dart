import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get_it/get_it.dart';
import 'package:kuafor_randevu_takip_uygulamasi/repository/service_repository/service_repository.dart';

GetIt locator = GetIt.instance;

void setupLocator()
{
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  locator.registerLazySingleton(() => ServiceRepository(firestore));
}
