import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pos_system/features/return_invoice/data/repo/return_invoice_repo.dart';
import 'package:pos_system/features/return_invoice/logic/return_invoice_state.dart';

class ReturnInvoiceCubit extends Cubit<ReturnInvoiceState> {
  final ReturnInvoiceRepo _returnInvoiceRepo;

  ReturnInvoiceCubit(this._returnInvoiceRepo) : super(InitialState());

  // DateTime selectedFromDate = DateTime.now();
  // DateTime selectedToDate = DateTime.now();
  //
  // Future<void> selectDate(BuildContext context, bool isFrom) async {
  //   if (Platform.isAndroid) {
  //     DateTime? pickedDate = await showDatePicker(
  //       context: context,
  //       initialDate: isFrom ? selectedFromDate : selectedToDate,
  //       firstDate: DateTime(1900),
  //       lastDate: DateTime(2200),
  //     );
  //     if (pickedDate != null) {
  //       if (isFrom) {
  //         selectedFromDate = pickedDate;
  //       } else {
  //         selectedToDate = pickedDate;
  //       }
  //     }
  //   } else if (Platform.isIOS) {
  //     showModalBottomSheet(
  //       context: context,
  //       builder: (BuildContext builder) {
  //         return SizedBox(
  //           height: 250.h,
  //           child: CupertinoDatePicker(
  //             mode: CupertinoDatePickerMode.date,
  //             initialDateTime: isFrom ? selectedFromDate : selectedToDate,
  //             minimumDate: DateTime(2000),
  //             maximumDate: DateTime(2100),
  //             onDateTimeChanged: (DateTime newDate) {
  //               if (isFrom) {
  //                 selectedFromDate = newDate;
  //               } else {
  //                 selectedToDate = newDate;
  //               }
  //               emit(OnChangeDateState());
  //             },
  //           ),
  //         );
  //       },
  //     );
  //   }
  //   emit(OnChangeDateState());
  // }

  static ReturnInvoiceCubit get(context) => BlocProvider.of(context);
}
