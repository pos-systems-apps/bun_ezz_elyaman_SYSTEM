import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pos_system/core/services/bluetooth_service.dart';
import 'package:pos_system/core/services/services_locator.dart';
import 'package:pos_system/core/utils/app_colors_white_theme.dart';
import 'package:pos_system/core/utils/app_constant.dart';
import 'package:pos_system/core/utils/assets_manager.dart';
import 'package:pos_system/core/utils/spacing.dart';
import 'package:pos_system/core/utils/styles.dart';
import 'package:pos_system/core/widgets/button_widget.dart';
import 'package:pos_system/core/widgets/horizontal_dashed_widget.dart';
import 'package:pos_system/features/print_invoice/logic/print_invoice_cubit.dart';
import 'package:pos_system/features/print_invoice/logic/print_invoice_state.dart';
import 'package:pos_system/features/print_invoice/ui/select_printer.dart';
import 'package:pos_system/features/print_invoice/ui/widgets/invoice_shimmer_widget.dart';
import 'package:pos_system/features/print_invoice/ui/widgets/money_title_widget_2.dart';
import 'package:pos_system/features/print_invoice/ui/widgets/money_widget_1.dart';
import 'package:pos_system/features/print_invoice/ui/widgets/money_widget_2.dart';
import 'package:pos_system/features/print_invoice/ui/widgets/money_widget_3.dart';
import 'package:x_printer/x_printer.dart';
import 'package:widgets_to_image/widgets_to_image.dart';

class ElectronicInvoiceBodyWidget extends StatefulWidget {
  const ElectronicInvoiceBodyWidget({super.key});

  @override
  State<ElectronicInvoiceBodyWidget> createState() =>
      _ElectronicInvoiceBodyWidgetState();
}

class _ElectronicInvoiceBodyWidgetState
    extends State<ElectronicInvoiceBodyWidget> {
  final _plugin = XPrinter();
  bool _isConnected = false;
  WidgetsToImageController imageController = WidgetsToImageController();
  Uint8List? imageBytes;

  @override
  void initState() {
    super.initState();
    try {
      WidgetsBinding.instance.addPostFrameCallback(
        (_) {
          _getCurrentState();
        },
      );

      _plugin.statusStream.listen((event) {
        print(">>> status: ${event.status.name}");
        _getCurrentState();
      });
    } catch (error) {
      // BluetoothPermissionHandler.init();
    }
  }

  void _getCurrentState() {
    try {
      _plugin.isConnected.then((value) {
        print(">>> isConnected: $value");
        setState(() {
          _isConnected = value;
        });
      });
    } catch (error) {}
  }

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

  void _selectImage() async {
    try {
      final bytes = await imageController.capture();
      imageBytes = bytes;
      if (imageBytes != null) {
        _printImage(imageBytes!);
      }
    } catch (error) {
      AppConstant.toast("لم يتم الاتصال بالطابعة ", AppColors.redColor);
    }
  }

  void _printImage(Uint8List bytes) async {
    try {
      final String base64Image = base64Encode(bytes);
      _plugin.printImage(base64Image, width: 460);
      _plugin.cutPaper();
    } catch (error) {
      AppConstant.toast("لم يتم الاتصال بالطابعة ", AppColors.redColor);
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PrintInvoiceCubit, PrintInvoiceState>(
      buildWhen: (previous, current) {
        return current is OnGetInvoiceDetailsLoadingState ||
            current is OnGetInvoiceDetailsErrorState ||
            current is OnGetInvoiceDetailsSuccessState ||
            current is OnGetInvoiceDetailsCatchErrorState;
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
              child: PrintInvoiceCubit.get(context).invoiceResponseModel == null
                  ? InvoiceShimmerWidget()
                  : Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        WidgetsToImage(
                          controller: imageController,
                          child: Column(
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
                                PrintInvoiceCubit.get(context)
                                    .invoiceResponseModel!
                                    .invoice
                                    .date,
                                style: TextStyles.font10BlackColorWeight400,
                              ),
                              verticalSpace(10),
                              HorizontalDashedWidget(width: 4, space: 4),
                              verticalSpace(16),
                              MoneyWidget1(
                                  text: "اسم المندوب",
                                  value: PrintInvoiceCubit.get(context)
                                      .invoiceResponseModel!
                                      .invoice
                                      .seller
                                      .name),
                              verticalSpace(8),
                              // MoneyWidget1(
                              //     text: "السجل التجاري",
                              //     value: AppConstant.commercialRegistry),
                              // verticalSpace(8),
                              // MoneyWidget1(
                              //     text: "الرقم الضريبي",
                              //     value: AppConstant.numberTax),
                              verticalSpace(8),
                              MoneyWidget1(
                                  text: "كود العربه",
                                  value: PrintInvoiceCubit.get(context)
                                      .invoiceResponseModel!
                                      .invoice
                                      .seller
                                      .vehicleCode),
                              verticalSpace(8),
                              MoneyWidget1(
                                  text: "كود المندوب",
                                  value: PrintInvoiceCubit.get(context)
                                      .invoiceResponseModel!
                                      .invoice
                                      .seller
                                      .mandoubeCode),
                              verticalSpace(8),
                              MoneyWidget1(
                                  text: "اسم العميل",
                                  value: PrintInvoiceCubit.get(context)
                                      .invoiceResponseModel!
                                      .invoice
                                      .customer
                                      .name),
                              verticalSpace(8),
                              // MoneyWidget1(
                              //     text: "نوع الفاتورة",
                              //     value: PrintInvoiceCubit.get(context)
                              //                 .invoiceResponseModel!
                              //                 .invoice
                              //                 .type ==
                              //             "7"
                              //         ? AppConstant.orderTypes[1].nameAr
                              //         : AppConstant.orderTypes[0].nameAr),
                              verticalSpace(8),
                              MoneyWidget1(
                                  text: "طريقه الدفع",
                                  value: getIt<AppConstant>()
                                      .pays
                                      .firstWhere((item2) =>
                                          item2.id ==
                                          PrintInvoiceCubit.get(context)
                                              .invoiceResponseModel!
                                              .invoice
                                              .paymentType)
                                      .nameAr
                                      .toString()),
                              verticalSpace(16),


                              HorizontalDashedWidget(width: 4, space: 4),
                              verticalSpace(16),
                              MoneyTitleWidget2(),
                              verticalSpace(8),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  // ...PrintInvoiceCubit.get(context)
                                  //     .invoiceResponseModel!
                                  //     .invoice
                                  //     .details
                                  //     .map((item) => Column(
                                  //           crossAxisAlignment:
                                  //               CrossAxisAlignment.start,
                                  //           children: [
                                  //             MoneyWidget2(
                                  //                 text: item.nameAr,
                                  //                 quantity: item.quantity
                                  //                     .toStringAsFixed(2),
                                  //                 measure: item.unit == 0
                                  //                     ? AppConstant
                                  //                         .measureUnits[1]
                                  //                         .nameAr
                                  //                     : AppConstant
                                  //                         .measureUnits[0]
                                  //                         .nameAr,
                                  //                 price: item.price
                                  //                     .toStringAsFixed(2)),
                                  //             verticalSpace(8),
                                  //           ],
                                  //         )),
                                ],
                              ),
                              verticalSpace(24),
                              HorizontalDashedWidget(width: 4, space: 4),
                              verticalSpace(16),
                              Row(
                                children: [
                                  Text("ملخص الطلب",
                                      textAlign: TextAlign.start,
                                      maxLines: 2,
                                      style: TextStyles
                                          .font10GreyColor78Weight400),
                                ],
                              ),
                              verticalSpace(8),
                              MoneyWidget3(
                                  text: "اجمالي الفاتوره",
                                  value:
                                      " 'جنيه' ${AppConstant.confirmRoundTo3Numbers(PrintInvoiceCubit.get(context).invoiceResponseModel!.invoice.orderAmount + PrintInvoiceCubit.get(context).invoiceResponseModel!.invoice.productsDiscount + PrintInvoiceCubit.get(context).invoiceResponseModel!.invoice.extraDiscount- PrintInvoiceCubit.get(context).invoiceResponseModel!.invoice.totalTax)}"),
                              verticalSpace(8),
                              MoneyWidget3(
                                  text: "خصم المنتج",
                                  value:
                                      " 'جنيه' ${AppConstant.confirmRoundTo3Numbers(PrintInvoiceCubit.get(context).invoiceResponseModel!.invoice.productsDiscount)}"),
                              verticalSpace(8),
                              MoneyWidget3(
                                  text: "خصم اضافي",
                                  value:
                                      " 'جنيه'  ${AppConstant.confirmRoundTo3Numbers(PrintInvoiceCubit.get(context).invoiceResponseModel!.invoice.extraDiscount)}"),
                              verticalSpace(8),
                              MoneyWidget3(
                                  text: "الضريبة",
                                  value: " 'جنيه'  ${AppConstant.confirmRoundTo3Numbers(PrintInvoiceCubit.get(context).invoiceResponseModel!.invoice.totalTax)}"),
                              verticalSpace(24),
                              HorizontalDashedWidget(width: 4, space: 4),
                              verticalSpace(16),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Expanded(
                                      child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text("الإجمالى",
                                          maxLines: 1,
                                          style: TextStyles
                                              .font10GreyColor33Weight500),
                                      verticalSpace(4),
                                      Text.rich(TextSpan(children: [
                                        TextSpan(
                                          text: "الاسعار شاملة الضريبة ",
                                          style: TextStyles
                                              .font10GreyColorA5Weight400,
                                        ),
                                        TextSpan(
                                          text: "*",
                                          style: TextStyles
                                              .font14RedColorWeight400,
                                        ),
                                      ])),
                                    ],
                                  )),
                                  Text(
                                      " 'جنيه'  ${AppConstant.confirmRoundTo3Numbers(PrintInvoiceCubit.get(context).invoiceResponseModel!.invoice.orderAmount)}",
                                      style: TextStyles
                                          .font12greyColor33Weight600),
                                ],
                              ),



                              verticalSpace(24),



                              if (PrintInvoiceCubit.get(context)
                                      .invoiceResponseModel!
                                      .invoice
                                      .type ==
                                  "4")
                                MoneyWidget3(
                                    text: "المبلغ المدفوع",
                                    value:
                                        " 'جنيه'  ${AppConstant.confirmRoundTo3Numbers(PrintInvoiceCubit.get(context).invoiceResponseModel!.invoice.collectedCash)}"),
                              if (PrintInvoiceCubit.get(context)
                                      .invoiceResponseModel!
                                      .invoice
                                      .type ==
                                  "4")
                                verticalSpace(8),
                              if (PrintInvoiceCubit.get(context)
                                      .invoiceResponseModel!
                                      .invoice
                                      .type ==
                                  "4")
                                MoneyWidget3(
                                    text: "المبلغ المتبقي",
                                    value:
                                        " 'جنيه'  ${AppConstant.confirmRoundTo3Numbers(PrintInvoiceCubit.get(context).invoiceResponseModel!.invoice.orderAmount   - PrintInvoiceCubit.get(context).invoiceResponseModel!.invoice.collectedCash)}"),
                              verticalSpace(30),
                            ],
                          ),
                        ),

                        ///print
                        StreamBuilder<PrinterStatus>(
                          stream: _plugin.statusStream,
                          builder: (context, snapshot) {
                            if (snapshot.data == null) {
                              return _isConnected
                                  ? ButtonWidget(
                                      isLoading: false,
                                      buttonHeight: 48.h,
                                      borderRadius: 10.r,
                                      buttonText: "طباعه",
                                      backGroundColor: AppColors.mainColor,
                                      textStyle:
                                          TextStyles.font14WhiteColorWeight500,
                                      onPressed: () async {
                                        if (snapshot.data != null) {
                                          _selectImage();
                                        } else {
                                          AppConstant.toast(
                                              "لم يتم الاتصال بالطابعة ",
                                              AppColors.redColor);
                                        }
                                      })
                                  : SizedBox();
                            }
                            return Column(
                              children: [
                                if (snapshot.data?.status ==
                                    PeripheralStatus.connected)
                                  ButtonWidget(
                                      isLoading: false,
                                      buttonHeight: 48.h,
                                      borderRadius: 10.r,
                                      buttonText: "طباعه",
                                      backGroundColor: AppColors.mainColor,
                                      textStyle:
                                          TextStyles.font14WhiteColorWeight500,
                                      onPressed: () async {
                                        if (snapshot.data != null) {
                                          _selectImage();
                                        } else {
                                          AppConstant.toast(
                                              "لم يتم الاتصال بالطابعة ",
                                              AppColors.redColor);
                                        }
                                      })
                              ],
                            );
                          },
                        ),


                        verticalSpace(16),
                        _selectDeviceWidget(),
                        verticalSpace(50),
                      ],
                    ),
            ),
          ),
        );
      },
    );
  }

  _selectDeviceWidget() {
    return _isConnected
        ? ButtonWidget(
            isLoading: false,
            buttonHeight: 48.h,
            borderRadius: 10.r,
            buttonText: "حدد جهاز",
            backGroundColor: AppColors.secondColor,
            textStyle: TextStyles.font14WhiteColorWeight500,
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                return SelectPrinter(plugin: _plugin);
              }));
            })
        : ButtonWidget(
            isLoading: false,
            buttonHeight: 48.h,
            borderRadius: 10.r,
            buttonText: "اتصال بالبلوتوث",
            backGroundColor: AppColors.secondColor,
            textStyle: TextStyles.font14WhiteColorWeight500,
            onPressed: () async {
              await BluetoothPermissionHandler.init(true);
            });
  }
}
