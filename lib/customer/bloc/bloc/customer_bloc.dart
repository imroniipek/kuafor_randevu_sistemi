import 'package:bloc/bloc.dart';
import 'package:kuafor_randevu_takip_uygulamasi/customer/bloc/status/customer_status.dart';
import 'package:kuafor_randevu_takip_uygulamasi/repository/service_repository/service_repository.dart';
import '../../../locator.dart';
import '../events/customer_event.dart';
class CustomerBloc extends Bloc<CustomerEvent,CustomerStatus>
{
  CustomerBloc():super(CustomerStatus(status: PageStatus.idle,models:[]))
  {
    on<CustomerEvent>(
        (event,emit)
        async{

          try
          {
            final models=await locator<ServiceRepository>().getAllServices();
            if(models.isNotEmpty)
              {
                emit(state.copyWith(status:PageStatus.success,models:models));
              }
          }
          catch(e)
          {
            emit(state.copyWith(status:PageStatus.error));
          }
        }
    );
  }
}