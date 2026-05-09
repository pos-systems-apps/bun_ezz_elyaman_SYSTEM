import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pos_system/features/print_resources_invoices/data/models/invoice_resources_response_model.dart';
import 'package:pos_system/features/print_resources_invoices/data/repo/print_resources_invoices_repo.dart';
import 'package:pos_system/features/print_resources_invoices/logic/print_resources_invoices_state.dart';

class PrintResourcesInvoicesCubit extends Cubit<PrintResourcesInvoicesState> {
  final PrintResourcesInvoicesRepo _printResourcesInvoicesRepo;

  PrintResourcesInvoicesCubit(this._printResourcesInvoicesRepo)
      : super(InitialState());

  InvoiceResourceModel? resourceInvoice;

  getInvoiceDetails(int invoiceId) {
    emit(OnGetResourcesInvoiceDetailsLoadingState());
    _printResourcesInvoicesRepo
        .getResourcesInvoiceDetails(invoiceId)
        .then((value) {
      value.fold((l) {
        emit(OnGetResourcesInvoiceDetailsErrorState());
      }, (r) {
        resourceInvoice = r.data;
        emit(OnGetResourcesInvoiceDetailsSuccessState());
      });
    }).catchError((error) {
      emit(OnGetResourcesInvoiceDetailsCatchErrorState());
    });
  }

  static PrintResourcesInvoicesCubit get(context) => BlocProvider.of(context);
}
