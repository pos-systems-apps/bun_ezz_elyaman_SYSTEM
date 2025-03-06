import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pos_system/features/cash_invoice/data/models/cash_invoices_response_model.dart';
import 'package:pos_system/features/cash_invoice/data/repo/cash_invoice_repo.dart';
import 'package:pos_system/features/cash_invoice/logic/cash_invoice_state.dart';

class CashInvoiceCubit extends Cubit<CashInvoiceState> {
  final CashInvoiceRepo _cashInvoiceRepo;

  CashInvoiceCubit(this._cashInvoiceRepo) : super(InitialState());

  List<CashInvoice> invoices = [];

  getCashInvoice() {
    emit(OnGetInvoicesLoadingState());
    _cashInvoiceRepo.getCashInvoice().then((value) {
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

  static CashInvoiceCubit get(context) => BlocProvider.of(context);
}
