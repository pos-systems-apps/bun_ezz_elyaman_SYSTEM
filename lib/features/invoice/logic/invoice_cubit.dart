import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pos_system/features/invoice/data/repo/invoice_repo.dart';

import 'invoice_state.dart';

class InvoiceCubit extends Cubit<InvoiceState> {
  final InvoiceRepo _invoiceRepo;

  InvoiceCubit(this._invoiceRepo) : super(InitialState());




  static InvoiceCubit get(context) => BlocProvider.of(context);
}
