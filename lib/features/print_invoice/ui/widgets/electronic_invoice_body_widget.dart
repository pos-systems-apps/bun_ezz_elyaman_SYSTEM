import 'dart:convert';
import 'dart:typed_data';
import 'package:intl/intl.dart' as intl;
import 'package:easy_localization/easy_localization.dart';
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
import 'package:pos_system/features/print_invoice/data/models/invoice_response_model.dart';
import 'package:pos_system/features/print_invoice/logic/print_invoice_cubit.dart';
import 'package:pos_system/features/print_invoice/logic/print_invoice_state.dart';
import 'package:pos_system/features/print_invoice/ui/select_printer.dart';
import 'package:pos_system/features/print_invoice/ui/widgets/invoice_shimmer_widget.dart';
import 'package:pos_system/features/print_invoice/ui/widgets/money_title_widget_2.dart';
import 'package:pos_system/features/print_invoice/ui/widgets/money_widget_1.dart';
import 'package:pos_system/features/print_invoice/ui/widgets/money_widget_2.dart';
import 'package:pos_system/features/print_invoice/ui/widgets/money_widget_3.dart';
 import 'package:widgets_to_image/widgets_to_image.dart';

class ElectronicInvoiceBodyWidget extends StatefulWidget {
  const ElectronicInvoiceBodyWidget({super.key});

  @override
  State<ElectronicInvoiceBodyWidget> createState() =>
      _ElectronicInvoiceBodyWidgetState();
}

class _ElectronicInvoiceBodyWidgetState
    extends State<ElectronicInvoiceBodyWidget> {
  // final _plugin = XPrinter();
  // bool _isConnected = false;
  WidgetsToImageController imageController = WidgetsToImageController();
  // Uint8List? imageBytes;

  @override
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
    return BlocBuilder<PrintInvoiceCubit, PrintInvoiceState>(
      buildWhen: (previous, current) {
        return current is OnGetInvoiceDetailsLoadingState ||
            current is OnGetInvoiceDetailsErrorState ||
            current is OnGetInvoiceDetailsSuccessState ||
            current is OnGetInvoiceDetailsCatchErrorState;
      },
      builder: (context, state) {
        final cubit = PrintInvoiceCubit.get(context);
        final InvoiceDetailsDataModel? invoice = cubit.invoiceResponseModel?.data;

        if (invoice == null) {
          return Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
              margin: EdgeInsets.symmetric(horizontal: 20.w),
              decoration: BoxDecoration(
                color: AppColors.whiteColor,
                borderRadius: BorderRadius.circular(10.r),
              ),
              child: InvoiceShimmerWidget(),
            ),
          );
        }

        final bool isReturnInvoice = invoice.isReturn;
        final String invoiceNumber = invoice.invoiceNumber;
        final double invoiceTotal = invoice.finalAmount;
        final List<InvoiceItemModel> items = invoice.items ?? [];
        final List<InvoicePaymentModel> payments = invoice.payments ?? [];

        return Expanded(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
            margin: EdgeInsets.symmetric(horizontal: 20.w),
            decoration: BoxDecoration(
              color: AppColors.whiteColor,
              borderRadius: BorderRadius.circular(10.r),
            ),
            child: SingleChildScrollView(
              child: Column(
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
                          invoice.date == null
                              ? "-"
                              : intl.DateFormat(
                            "d MMMM yyyy h:mm:ss a",
                            context.locale.languageCode,
                          ).format(invoice.date!.toLocal()),
                          style: TextStyles.font10BlackColorWeight400,
                        ),

                        verticalSpace(10),

                        HorizontalDashedWidget(width: 4, space: 4),

                        verticalSpace(16),

                        MoneyWidget1(
                          text: isReturnInvoice ? "رقم المرتجع" : "رقم الفاتورة",
                          value: invoiceNumber,
                        ),

                        verticalSpace(8),

                        MoneyWidget1(
                          text: isReturnInvoice
                              ? "حالة المرتجع"
                              : "حالة الفاتورة",
                          value: invoice.statusLabel,
                        ),

                        verticalSpace(8),

                        MoneyWidget1(
                          text: "اسم العميل",
                          value: invoice.customer?.name ?? "-",
                        ),

                        if (!isReturnInvoice) ...[
                          verticalSpace(8),
                          MoneyWidget1(
                            text: "رقم العميل",
                            value: invoice.customer?.phone ?? "-",
                          ),
                        ],

                        if (!isReturnInvoice) ...[
                          verticalSpace(8),
                          MoneyWidget1(
                            text: "طريقة الدفع",
                            value: invoice.paymentMethodLabel ?? "-",
                          ),
                        ],

                        if (isReturnInvoice && invoice.order != null) ...[
                          verticalSpace(8),
                          MoneyWidget1(
                            text: "فاتورة البيع الأصلية",
                            value: invoice.order?.orderNumber ?? "-",
                          ),
                        ],

                        if (invoice.notes != null &&
                            invoice.notes!.trim().isNotEmpty) ...[
                          verticalSpace(8),
                          MoneyWidget1(
                            text: "ملاحظات",
                            value: invoice.notes ?? "-",
                          ),
                        ],

                        verticalSpace(16),

                        HorizontalDashedWidget(width: 4, space: 4),

                        verticalSpace(16),

                        MoneyTitleWidget2(),

                        verticalSpace(8),

                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            if (items.isEmpty)
                              Text(
                                "لا توجد منتجات",
                                style: TextStyles.font10GreyColor33Weight500,
                              ),

                            ...items.map(
                                  (item) {
                                return Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    MoneyWidget2(
                                      text: item.product?.name ?? "-",
                                      quantity: item.quantity.toStringAsFixed(2),
                                      measure: item.unit?.name ?? "-",
                                      price: item.unitPrice.toStringAsFixed(2),
                                    ),
                                    verticalSpace(8),
                                  ],
                                );
                              },
                            ),
                          ],
                        ),

                        verticalSpace(24),

                        HorizontalDashedWidget(width: 4, space: 4),

                        verticalSpace(16),

                        Row(
                          children: [
                            Text(
                              isReturnInvoice ? "ملخص المرتجع" : "ملخص الطلب",
                              textAlign: TextAlign.start,
                              maxLines: 2,
                              style: TextStyles.font10GreyColor78Weight400,
                            ),
                          ],
                        ),

                        verticalSpace(8),

                        MoneyWidget3(
                          text: isReturnInvoice
                              ? "إجمالي المرتجع"
                              : "الإجمالي قبل الخصم",
                          value:
                          "جنيه ${AppConstant.confirmRoundTo3Numbers(invoice.subtotal)}",
                        ),

                        if (!isReturnInvoice) ...[
                          verticalSpace(8),
                          MoneyWidget3(
                            text: "الخصم",
                            value:
                            "جنيه ${AppConstant.confirmRoundTo3Numbers(invoice.discountAmount)}",
                          ),

                          verticalSpace(8),

                          MoneyWidget3(
                            text: "الضريبة",
                            value:
                            "جنيه ${AppConstant.confirmRoundTo3Numbers(invoice.taxAmount)}",
                          ),
                        ],

                        verticalSpace(24),

                        HorizontalDashedWidget(width: 4, space: 4),

                        verticalSpace(16),

                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    isReturnInvoice
                                        ? "قيمة الاسترداد"
                                        : "الإجمالى",
                                    maxLines: 1,
                                    style: TextStyles.font10GreyColor33Weight500,
                                  ),

                                  if (!isReturnInvoice) ...[
                                    verticalSpace(4),
                                    Text.rich(
                                      TextSpan(
                                        children: [
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
                                        ],
                                      ),
                                    ),
                                  ],
                                ],
                              ),
                            ),
                            Text(
                              "جنيه ${AppConstant.confirmRoundTo3Numbers(invoiceTotal)}",
                              style: TextStyles.font12greyColor33Weight600,
                            ),
                          ],
                        ),

                        if (!isReturnInvoice) ...[
                          verticalSpace(24),

                          MoneyWidget3(
                            text: "المبلغ المدفوع",
                            value:
                            "جنيه ${AppConstant.confirmRoundTo3Numbers(invoice.paidAmount)}",
                          ),

                          verticalSpace(8),

                          MoneyWidget3(
                            text: "المبلغ المتبقي",
                            value:
                            "جنيه ${AppConstant.confirmRoundTo3Numbers(invoice.remainingAmount)}",
                          ),
                        ],

                        if (!isReturnInvoice && payments.isNotEmpty) ...[
                          verticalSpace(24),

                          HorizontalDashedWidget(width: 4, space: 4),

                          verticalSpace(16),

                          Row(
                            children: [
                              Text(
                                "المدفوعات",
                                textAlign: TextAlign.start,
                                maxLines: 2,
                                style: TextStyles.font10GreyColor78Weight400,
                              ),
                            ],
                          ),

                          verticalSpace(8),

                          ...payments.map(
                                (payment) => Column(
                              children: [
                                MoneyWidget3(
                                  text: payment.paymentMethod,
                                  value:
                                  "جنيه ${AppConstant.confirmRoundTo3Numbers(payment.amount)}",
                                ),
                                verticalSpace(8),
                              ],
                            ),
                          ),
                        ],

                        verticalSpace(30),
                      ],
                    ),
                  ),

                  verticalSpace(50),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
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
