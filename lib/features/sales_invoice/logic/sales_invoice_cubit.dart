import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pos_system/core/services/services_locator.dart';
import 'package:pos_system/core/utils/app_constant.dart';
import 'package:pos_system/features/sales_invoice/data/models/get_invoices_response_model.dart';
import 'package:pos_system/features/sales_invoice/data/repo/sales_invoice_repo.dart';
import 'package:pos_system/features/sales_invoice/logic/sales_invoice_state.dart';
import 'package:pos_system/features/splash/data/models/pay_class.dart';

class SalesInvoiceCubit extends Cubit<SalesInvoiceState> {
  final SalesInvoiceRepo _salesInvoiceRepo;

  SalesInvoiceCubit(this._salesInvoiceRepo) : super(InitialState());

  List<Invoices> invoices = [];

  getInvoices() {
    emit(OnGetInvoicesLoadingState());
    _salesInvoiceRepo.getInvoices(AppConstant.orderTypes[0].id).then((value) {
      value.fold((l) {
        emit(OnGetInvoicesErrorState());
      }, (r) {
        invoices = r.invoices;
        emit(OnGetInvoicesSuccessState());
      });
    }).catchError((error) {
      emit(OnGetInvoicesCatchErrorState());
    });
  }

  List<PayClass> pays = getIt<AppConstant>().pays.toList();

  static SalesInvoiceCubit get(context) => BlocProvider.of(context);
}
