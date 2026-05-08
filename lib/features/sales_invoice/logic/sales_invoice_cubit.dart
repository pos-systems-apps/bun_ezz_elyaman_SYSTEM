import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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

  List<InvoiceModel> invoices = [];
  List<InvoiceCustomerModel> customers = [];

  InvoiceCustomerModel? selectedCustomerName;

  void getInvoices() {
    emit(OnGetInvoicesLoadingState());

    _salesInvoiceRepo.getInvoices(AppConstant.orderTypes[0].id).then((value) {
      value.fold(
            (l) {
          emit(OnGetInvoicesErrorState());
        },
            (r) {
          invoices = r.data;

          customers.clear();

          for (final invoice in invoices) {
            final customer = invoice.customer;

            if (customer == null) continue;

            final bool exists = customers.any(
                  (element) => element.id == customer.id,
            );

            if (!exists) {
              customers.add(customer);
            }
          }

          emit(OnGetInvoicesSuccessState());
        },
      );
    }).catchError((error) {
      emit(OnGetInvoicesCatchErrorState());
    });
  }

  void changeName(InvoiceCustomerModel value) {
    selectedCustomerName = value;
    emit(OnChangeNameState());
  }

  DateTime? selectedDate;

  void pickDate(BuildContext context) async {
    DateTime? date = await showDatePicker(
      context: context,
      initialDate: selectedDate ?? DateTime.now(),
      firstDate: DateTime(2020),
      lastDate: DateTime.now(),
      locale: const Locale("ar"), // للغة العربية لو عايز
    );
    if (date != null) {
        selectedDate = date;
    }
    emit(OnChangeDateState());

  }

  List<PayClass> pays = getIt<AppConstant>().pays.toList();

  static SalesInvoiceCubit get(context) => BlocProvider.of(context);
}
