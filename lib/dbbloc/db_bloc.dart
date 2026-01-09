import 'package:bloc/bloc.dart';
import 'package:kuafor_randevu_takip_uygulamasi/dbbloc/db_events.dart';
import 'package:kuafor_randevu_takip_uygulamasi/dbbloc/db_status.dart';
import 'package:kuafor_randevu_takip_uygulamasi/repository/service_repository/service_repository.dart';
import '../locator.dart';

class DbBloc extends Bloc<DbEvents,DbStatus>
{
  DbBloc():super(DbStatus(services:[]))
  {
    on<GetAllOfServicesfromDb>
      (
        (event,emit)
        async{

          final models=await locator<ServiceRepository>().getAllServices();

          emit(state.copyWith(services:models));

        }
    );
  }
}