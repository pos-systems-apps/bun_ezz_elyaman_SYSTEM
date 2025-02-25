import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pos_system/features/invoice/data/models/invoice_response_model.dart';
import 'package:pos_system/features/invoice/data/repo/invoice_repo.dart';
import 'package:pos_system/features/invoice/logic/invoice_state.dart';

class InvoiceCubit extends Cubit<InvoiceState> {
  final InvoiceRepo _invoiceRepo;

  InvoiceCubit(this._invoiceRepo) : super(InitialState());

  InvoiceResponseModel? invoiceResponseModel;

  getInvoiceDetails(int invoiceId) {
    emit(OnGetInvoiceDetailsLoadingState());
    _invoiceRepo.getInvoiceDetails(invoiceId).then((value) {
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

  static InvoiceCubit get(context) => BlocProvider.of(context);
}
