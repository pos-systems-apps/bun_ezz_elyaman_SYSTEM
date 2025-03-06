import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pos_system/features/print_invoice/data/models/invoice_response_model.dart';
import 'package:pos_system/features/print_invoice/data/repo/print_invoice_repo.dart';
import 'package:pos_system/features/print_invoice/logic/print_invoice_state.dart';

class PrintInvoiceCubit extends Cubit<PrintInvoiceState> {
  final PrintInvoiceRepo _printInvoiceRepo;

  PrintInvoiceCubit(this._printInvoiceRepo) : super(InitialState());

  InvoiceResponseModel? invoiceResponseModel;

  getInvoiceDetails(int invoiceId) {
    emit(OnGetInvoiceDetailsLoadingState());
    _printInvoiceRepo.getInvoiceDetails(invoiceId).then((value) {
      value.fold((l) {
        emit(OnGetInvoiceDetailsErrorState());
      }, (r) {
        invoiceResponseModel = r;
        emit(OnGetInvoiceDetailsSuccessState());
      });
    }).catchError((error) {
      emit(OnGetInvoiceDetailsCatchErrorState());
    });
  }

  static PrintInvoiceCubit get(context) => BlocProvider.of(context);
}
