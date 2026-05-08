import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pos_system/core/services/services_locator.dart';
import 'package:pos_system/core/utils/app_constant.dart';
import 'package:pos_system/features/return_invoice/logic/return_invoice_state.dart';
import 'package:pos_system/features/sales_invoice/data/models/get_invoices_response_model.dart';
import 'package:pos_system/features/sales_invoice/data/repo/sales_invoice_repo.dart';
import 'package:pos_system/features/splash/data/models/pay_class.dart';

class ReturnInvoiceCubit extends Cubit<ReturnInvoiceState> {
  final SalesInvoiceRepo _salesInvoiceRepo;

  ReturnInvoiceCubit(this._salesInvoiceRepo) : super(InitialState());

  List<InvoiceModel> returnInvoices = [];
  List<InvoiceCustomerModel> customers = [];

  getReturnInvoices() {
    emit(OnGetInvoicesLoadingState());
    _salesInvoiceRepo.getInvoices(AppConstant.orderTypes[1].id).then((value) {
      value.fold((l) {
        emit(OnGetInvoicesErrorState());
      }, (r) {
        returnInvoices = r.data;
        for (var i in r.data) {
          bool exists = customers.any((element) => element.id == i.customer!.id);
          if (!exists) {
            customers.add(i.customer!);
          }
        }
        emit(OnGetInvoicesSuccessState());
      });
    }).catchError((error) {
      emit(OnGetInvoicesCatchErrorState());
    });
  }

  InvoiceCustomerModel? selectedCustomerName;

  changeName(InvoiceCustomerModel value) {
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

  static ReturnInvoiceCubit get(context) => BlocProvider.of(context);
}
