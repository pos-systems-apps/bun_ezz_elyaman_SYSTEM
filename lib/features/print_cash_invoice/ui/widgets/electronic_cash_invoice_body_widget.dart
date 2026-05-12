import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pos_system/core/services/bluetooth_service.dart';
import 'package:pos_system/core/utils/app_colors_white_theme.dart';
import 'package:pos_system/core/utils/app_constant.dart';
import 'package:pos_system/core/utils/assets_manager.dart';
import 'package:pos_system/core/utils/spacing.dart';
import 'package:pos_system/core/utils/styles.dart';
import 'package:pos_system/core/widgets/button_widget.dart';
import 'package:pos_system/core/widgets/horizontal_dashed_widget.dart';
import 'package:pos_system/features/print_cash_invoice/logic/print_cash_invoice_cubit.dart';
import 'package:pos_system/features/print_cash_invoice/logic/print_cash_invoice_state.dart';
import 'package:pos_system/features/print_invoice/ui/widgets/invoice_shimmer_widget.dart';
import 'package:pos_system/features/print_invoice/ui/widgets/money_widget_1.dart';
import 'package:pos_system/features/print_invoice/ui/widgets/money_widget_3.dart';
import 'package:pos_system/features/print_invoice/ui/select_printer.dart';

class ElectronicCashInvoiceBodyWidget extends StatefulWidget {
  const ElectronicCashInvoiceBodyWidget({super.key});

  @override
  State<ElectronicCashInvoiceBodyWidget> createState() =>
      _ElectronicCashInvoiceBodyWidgetState();
}

class _ElectronicCashInvoiceBodyWidgetState
    extends State<ElectronicCashInvoiceBodyWidget> {
  // final _plugin = XPrinter();
  // bool _isConnected = false;
  // WidgetsToImageController imageController = WidgetsToImageController();
  // Uint8List? imageBytes;
  //
  // @override
  // void initState() {
  //   super.initState();
  //   try {
  //     WidgetsBinding.instance.addPostFrameCallback(
  //       (_) {
  //         _getCurrentState();
  //       },
  //     );
  //
  //     _plugin.statusStream.listen((event) {
  //       print(">>> status: ${event.status.name}");
  //       _getCurrentState();
  //     });
  //   } catch (error) {
  //     // BluetoothPermissionHandler.init();
  //   }
  // }
  //
  // void _getCurrentState() {
  //   try {
  //     _plugin.isConnected.then((value) {
  //       print(">>> isConnected: $value");
  //       setState(() {
  //         _isConnected = value;
  //       });
  //     });
  //   } catch (error) {}
  // }

  // ButtonWidget _buildDisconnectButton() {
  //   return ButtonWidget(
  //       isLoading: false,
  //       buttonHeight: 48.h,
  //       borderRadius: 10.r,
  //       buttonText: "قطع الاتصال",
  //       backGroundColor: AppColors.secondColor,
  //       textStyle: TextStyles.font14WhiteColorWeight500,
  //       onPressed: () {
  //         _plugin.disconnect();
  //       });
  // }

  // void _selectImage() async {
  //   try {
  //     final bytes = await imageController.capture();
  //     imageBytes = bytes;
  //     if (imageBytes != null) {
  //       _printImage(imageBytes!);
  //     }
  //   } catch (error) {
  //     AppConstant.toast("لم يتم الاتصال بالطابعة ", AppColors.redColor);
  //   }
  // }
  //
  // void _printImage(Uint8List bytes) async {
  //   try {
  //     final String base64Image = base64Encode(bytes);
  //     _plugin.printImage(base64Image, width: 460);
  //     _plugin.cutPaper();
  //   } catch (error) {
  //     AppConstant.toast("لم يتم الاتصال بالطابعة ", AppColors.redColor);
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PrintCashInvoiceCubit, PrintCashInvoiceState>(
      buildWhen: (previous, current) {
        return current is OnGetCashInvoiceDetailsLoadingState ||
            current is OnGetCashInvoiceDetailsErrorState ||
            current is OnGetCashInvoiceDetailsSuccessState ||
            current is OnGetCashInvoiceDetailsCatchErrorState;
      },
      builder: (context, state) {
        return Expanded(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
            margin: EdgeInsets.symmetric(horizontal: 20.w),
            decoration: BoxDecoration(
                color: AppColors.whiteColor,
                borderRadius: BorderRadius.circular(10.r)),
            child: SingleChildScrollView(
              child: PrintCashInvoiceCubit.get(context)
                          .invoiceCashResponseModel ==
                      null
                  ? InvoiceShimmerWidget()
                  : Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        // WidgetsToImage(
                        //   controller: imageController,
                        //   child:
                        // ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Image.asset(
                              ImageAsset.logoImage,
                              height: 66.h,
                              width: 80.w,
                              fit: BoxFit.cover,
                            ),
                            verticalSpace(10),
                            Text(
                              PrintCashInvoiceCubit.get(context)
                                  .invoiceCashResponseModel!
                                  .data?.collectionDate.toString()
                                  .split("T")[0]??'',
                              style: TextStyles.font10BlackColorWeight400,
                            ),
                            verticalSpace(10),
                            HorizontalDashedWidget(width: 4, space: 4),
                            verticalSpace(16),
                            Center(
                              child: Text("ايصال تحصيل نقدية",
                                  textAlign: TextAlign.start,
                                  maxLines: 2,
                                  style:
                                  TextStyles.font16BlackColorWeight600),
                            ),
                            verticalSpace(8),
                            MoneyWidget1(
                                text: "رقم الايصال",
                                value: '${PrintCashInvoiceCubit.get(context)
                                    .invoiceCashResponseModel!
                                    .data?.id??''}'),
                            verticalSpace(8),
                            // MoneyWidget1(
                            //     text: "اسم المندوب",
                            //     value: PrintCashInvoiceCubit.get(context)
                            //         .invoiceCashResponseModel!
                            //         .data?
                            //         .seller
                            //         .name),
                            verticalSpace(8),
                            // MoneyWidget1(
                            //     text: "السجل التجاري",
                            //     value: AppConstant.commercialRegistry),
                            // verticalSpace(8),
                            // MoneyWidget1(
                            //     text: "الرقم الضريبي",
                            //     value: AppConstant.numberTax),

                            // verticalSpace(8),
                            // MoneyWidget1(
                            //     text: "كود العربه",
                            //     value: PrintCashInvoiceCubit.get(context)
                            //         .invoiceCashResponseModel!
                            //         .data?
                            //         .seller
                            //         .vehicleCode),
                            // verticalSpace(8),
                            // MoneyWidget1(
                            //     text: "كود المندوب",
                            //     value: PrintCashInvoiceCubit.get(context)
                            //         .invoiceCashResponseModel!
                            //         .cashInvoice
                            //         .seller
                            //         .mandoubeCode),
                            verticalSpace(8),
                            MoneyWidget1(
                                text: "اسم العميل",
                                value: PrintCashInvoiceCubit.get(context)
                                    .invoiceCashResponseModel!
                                    .data?.customer?.name??''
                            ),
                            // verticalSpace(8),
                            // MoneyWidget1(
                            //     text: "رقم العميل الضريبي",
                            //     value: PrintCashInvoiceCubit.get(context)
                            //         .invoiceCashResponseModel!
                            //         .cashInvoice
                            //         .customer
                            //         .taxNumber),
                            // verticalSpace(8),
                            // MoneyWidget1(
                            //     text: "السجل التجاري للعميل",
                            //     value: PrintCashInvoiceCubit.get(context)
                            //         .invoiceCashResponseModel!
                            //         .cashInvoice
                            //         .customer
                            //         .comercialHistory),

                            verticalSpace(16),
                            HorizontalDashedWidget(width: 4, space: 4),
                            verticalSpace(16),
                            // MoneyWidget3(
                            //     text: "المبغ الكلي",
                            //     value:
                            //         " 'جنيه'  ${PrintCashInvoiceCubit.get(context).invoiceCashResponseModel?.data?.totalAmount??''}"),
                            verticalSpace(8),
                            MoneyWidget3(
                                text: "الملاحظة",
                                value:
                                " 'جنيه'  ${PrintCashInvoiceCubit.get(context).invoiceCashResponseModel?.data?.notes??''}"),
                            verticalSpace(8),

                            verticalSpace(24),
                            HorizontalDashedWidget(width: 4, space: 4),
                            verticalSpace(16),
                            MoneyWidget3(
                                text: "المبلغ المدفوع",
                                value:
                                " 'جنيه'  ${PrintCashInvoiceCubit.get(context).invoiceCashResponseModel?.data?.totalAmount??''}"),
                            verticalSpace(50),

                          ],
                        ),

                        ///print
                        // StreamBuilder<PrinterStatus>(
                        //   stream: _plugin.statusStream,
                        //   builder: (context, snapshot) {
                        //     if (snapshot.data == null) {
                        //       return _isConnected
                        //           ? ButtonWidget(
                        //               isLoading: false,
                        //               buttonHeight: 48.h,
                        //               borderRadius: 10.r,
                        //               buttonText: "طباعه",
                        //               backGroundColor: AppColors.mainColor,
                        //               textStyle:
                        //                   TextStyles.font14WhiteColorWeight500,
                        //               onPressed: () async {
                        //                 if (snapshot.data != null) {
                        //                   _selectImage();
                        //                 } else {
                        //                   AppConstant.toast(
                        //                       "لم يتم الاتصال بالطابعة ",
                        //                       AppColors.redColor);
                        //                 }
                        //               })
                        //           : SizedBox();
                        //     }
                        //     return Column(
                        //       children: [
                        //         if (snapshot.data?.status ==
                        //             PeripheralStatus.connected)
                        //           ButtonWidget(
                        //               isLoading: false,
                        //               buttonHeight: 48.h,
                        //               borderRadius: 10.r,
                        //               buttonText: "طباعه",
                        //               backGroundColor: AppColors.mainColor,
                        //               textStyle:
                        //                   TextStyles.font14WhiteColorWeight500,
                        //               onPressed: () async {
                        //                 if (snapshot.data != null) {
                        //                   _selectImage();
                        //                 } else {
                        //                   AppConstant.toast(
                        //                       "لم يتم الاتصال بالطابعة ",
                        //                       AppColors.redColor);
                        //                 }
                        //               })
                        //       ],
                        //     );
                        //   },
                        // ),
                        // verticalSpace(16),
                        // _selectDeviceWidget(),
                        verticalSpace(50),
                      ],
                    ),
            ),
          ),
        );
      },
    );
  }

  // _selectDeviceWidget() {
  //   return _isConnected
  //       ? ButtonWidget(
  //           isLoading: false,
  //           buttonHeight: 48.h,
  //           borderRadius: 10.r,
  //           buttonText: "حدد جهاز",
  //           backGroundColor: AppColors.secondColor,
  //           textStyle: TextStyles.font14WhiteColorWeight500,
  //           onPressed: () {
  //             Navigator.of(context).push(MaterialPageRoute(builder: (context) {
  //               return SelectPrinter(plugin: _plugin);
  //             }));
  //           })
  //       : ButtonWidget(
  //           isLoading: false,
  //           buttonHeight: 48.h,
  //           borderRadius: 10.r,
  //           buttonText: "اتصال بالبلوتوث",
  //           backGroundColor: AppColors.secondColor,
  //           textStyle: TextStyles.font14WhiteColorWeight500,
  //           onPressed: () async {
  //             await BluetoothPermissionHandler.init(true);
  //           });
  // }
}
