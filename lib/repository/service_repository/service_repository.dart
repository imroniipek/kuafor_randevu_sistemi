import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:kuafor_randevu_takip_uygulamasi/Models/service_model.dart';
import 'package:kuafor_randevu_takip_uygulamasi/repository/general_repository.dart';

class ServiceRepository extends GeneralRepository
{
  final FirebaseFirestore _db;

  ServiceRepository(this._db);
  @override
  Future<List<ServiceModel>> getAllServices()
  async {
    List<ServiceModel>models=[];

    final snapshot = await _db.collection("services").get();

    for(var document in snapshot.docs)
      {
        final theModel=ServiceModel.fromMap(document.id, document.data());
        models.add(theModel);
      }
    return models;

  }
  
}


