// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:pos_system/core/services/services_locator.dart';
// import 'package:pos_system/core/utils/app_constant.dart';
// import 'package:pos_system/features/request_resources_invoices/data/models/get_resources_invoices_response_model.dart';
// import 'package:pos_system/features/request_resources_invoices/data/repo/request_resources_invoices_repo.dart';
// import 'package:pos_system/features/return_resources_invoices/logic/return_resources_invoices_state.dart';
// import 'package:pos_system/features/splash/data/models/pay_class.dart';
//
// class ReturnResourcesInvoicesCubit extends Cubit<ReturnResourcesInvoicesState> {
//   final RequestResourcesInvoicesRepo _requestResourcesInvoicesRepo;
//
//   ReturnResourcesInvoicesCubit(this._requestResourcesInvoicesRepo) : super(InitialState());
//
//   List<ResourcesInvoices> reservations = [];
//
//   getRequestResourcesInvoices() {
//     emit(OnGetInvoicesLoadingState());
//     _requestResourcesInvoicesRepo.getRequestResourcesInvoices(AppConstant.resourcesTypes[1].id).then((value) {
//       value.fold((l) {
//         emit(OnGetInvoicesErrorState());
//       }, (r) {
//         reservations = r.reservations;
//         emit(OnGetInvoicesSuccessState());
//       });
//     }).catchError((error) {
//       emit(OnGetInvoicesCatchErrorState());
//     });
//   }
//
//   List<PayClass> pays = getIt<AppConstant>().pays.toList();
//
//   static ReturnResourcesInvoicesCubit get(context) => BlocProvider.of(context);
// }
