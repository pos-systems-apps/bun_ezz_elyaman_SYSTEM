import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pos_system/features/print_cash_invoice/data/models/invoice_cash_response_model.dart';
import 'package:pos_system/features/print_cash_invoice/data/repo/print_cash_invoice_repo.dart';
import 'package:pos_system/features/print_cash_invoice/logic/print_cash_invoice_state.dart';

class PrintCashInvoiceCubit extends Cubit<PrintCashInvoiceState> {
  final PrintCashInvoiceRepo _printCashInvoiceRepo;

  PrintCashInvoiceCubit(this._printCashInvoiceRepo) : super(InitialState());

  InvoiceCashResponseModel? invoiceCashResponseModel;

  getCashInvoiceDetails(int instalmentID) {
    emit(OnGetCashInvoiceDetailsLoadingState());
    _printCashInvoiceRepo.getCashInvoiceDetails(instalmentID).then((value) {
      value.fold((l) {
        emit(OnGetCashInvoiceDetailsErrorState());
      }, (r) {
        invoiceCashResponseModel = r;
        emit(OnGetCashInvoiceDetailsSuccessState());
      });
    }).catchError((error) {
      emit(OnGetCashInvoiceDetailsCatchErrorState());
    });
  }

  static PrintCashInvoiceCubit get(context) => BlocProvider.of(context);
}
