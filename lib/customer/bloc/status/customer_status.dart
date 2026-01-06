import '../../../Models/service_model.dart';
enum PageStatus{idle,success,error}
class CustomerStatus{
  final PageStatus status;

  final List<ServiceModel> models;

  CustomerStatus({required this.status,required this.models});

  CustomerStatus copyWith({PageStatus ?status,List<ServiceModel> ? models})
  {
    return
        CustomerStatus(
            status: status?? this.status,
            models: models?? this.models
        );
  }
}
