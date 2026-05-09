import 'dart:convert';
import 'dart:typed_data';

import 'package:easy_localization/easy_localization.dart';
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
import 'package:pos_system/features/print_invoice/ui/select_printer.dart';
import 'package:pos_system/features/print_invoice/ui/widgets/invoice_shimmer_widget.dart';

import 'package:pos_system/features/print_invoice/ui/widgets/money_widget_1.dart';
import 'package:pos_system/features/print_invoice/ui/widgets/money_widget_2.dart';
import 'package:pos_system/features/print_resources_invoices/logic/print_resources_invoices_state.dart';
import 'package:pos_system/features/print_resources_invoices/logic/print_resources_invoices_cubit.dart';
import 'package:pos_system/features/print_resources_invoices/ui/widgets/money_title_widget_2.dart';
import 'package:widgets_to_image/widgets_to_image.dart';
import 'package:x_printer/x_printer.dart';
import 'package:intl/intl.dart'as intl;

class ElectronicResourcesInvoicesBodyWidget extends StatefulWidget {
  const ElectronicResourcesInvoicesBodyWidget({super.key});

  @override
  State<ElectronicResourcesInvoicesBodyWidget> createState() =>
      _ElectronicResourcesInvoicesBodyWidgetState();
}

class _ElectronicResourcesInvoicesBodyWidgetState
    extends State<ElectronicResourcesInvoicesBodyWidget> {
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
    return BlocBuilder<PrintResourcesInvoicesCubit, PrintResourcesInvoicesState>(
      buildWhen: (previous, current) {
        return current is OnGetResourcesInvoiceDetailsLoadingState ||
            current is OnGetResourcesInvoiceDetailsErrorState ||
            current is OnGetResourcesInvoiceDetailsSuccessState ||
            current is OnGetResourcesInvoiceDetailsCatchErrorState;
      },
      builder: (context, state) {
        final cubit = PrintResourcesInvoicesCubit.get(context);
        final invoice = cubit.resourceInvoice;

        return Expanded(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
            margin: EdgeInsets.symmetric(horizontal: 20.w),
            decoration: BoxDecoration(
              color: AppColors.whiteColor,
              borderRadius: BorderRadius.circular(10.r),
            ),
            child: SingleChildScrollView(
              child: invoice == null
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
                          invoice.createdAt == null
                              ? "-"
                              : intl.DateFormat(
                            "d MMMM yyyy h:mm:ss a",
                            context.locale.languageCode,
                          ).format(invoice.createdAt!.toLocal()),
                          style: TextStyles.font10BlackColorWeight400,
                        ),

                        verticalSpace(10),

                        HorizontalDashedWidget(width: 4, space: 4),

                        verticalSpace(16),

                        MoneyWidget1(
                          text: "رقم طلب الحجز",
                          value: invoice.id.toString(),
                        ),

                        verticalSpace(8),

                        MoneyWidget1(
                          text: "رقم الرحلة",
                          value: invoice.trip?.tripNumber ?? "-",
                        ),

                        verticalSpace(8),

                        MoneyWidget1(
                          text: "حالة الطلب",
                          value: invoice.statusLabel,
                        ),

                        if (invoice.customerName != null) ...[
                          verticalSpace(8),
                          MoneyWidget1(
                            text: "اسم العميل",
                            value: invoice.customerName ?? "-",
                          ),
                        ],

                        if (invoice.customerPhone != null) ...[
                          verticalSpace(8),
                          MoneyWidget1(
                            text: "رقم العميل",
                            value: invoice.customerPhone ?? "-",
                          ),
                        ],

                        if (invoice.customerAddress != null) ...[
                          verticalSpace(8),
                          MoneyWidget1(
                            text: "عنوان العميل",
                            value: invoice.customerAddress ?? "-",
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

                        ReturnMoneyTitleWidget2(),

                        verticalSpace(8),

                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            if (invoice.items.isEmpty)
                              Text(
                                "لا توجد منتجات",
                                style:
                                TextStyles.font10GreyColor33Weight500,
                              ),

                            ...invoice.items.map(
                                  (item) => Column(
                                crossAxisAlignment:
                                CrossAxisAlignment.start,
                                children: [
                                  MoneyWidget2(
                                    text: item.product?.name ?? "-",
                                    quantity:
                                    item.quantity.toStringAsFixed(2),
                                    measure: item.unit?.name ?? "-",
                                    price:
                                    item.unitPrice.toStringAsFixed(2),
                                  ),
                                  verticalSpace(8),
                                ],
                              ),
                            ),
                          ],
                        ),

                        verticalSpace(16),

                        HorizontalDashedWidget(width: 4, space: 4),

                        verticalSpace(16),

                        MoneyWidget1(
                          text: "الإجمالي",
                          value:
                          "${invoice.items.fold<double>(
                            0,
                                (sum, item) => sum + item.subtotal,
                          ).toStringAsFixed(2)} جنيه",
                        ),

                        verticalSpace(50),
                      ],
                    ),
                  ),

                  // StreamBuilder<PrinterStatus>(
                  //   stream: _plugin.statusStream,
                  //   builder: (context, snapshot) {
                  //     if (snapshot.data == null) {
                  //       return _isConnected
                  //           ? ButtonWidget(
                  //         isLoading: false,
                  //         buttonHeight: 48.h,
                  //         borderRadius: 10.r,
                  //         buttonText: "طباعه",
                  //         backGroundColor: AppColors.mainColor,
                  //         textStyle:
                  //         TextStyles.font14WhiteColorWeight500,
                  //         onPressed: () async {
                  //           _selectImage();
                  //         },
                  //       )
                  //           : const SizedBox();
                  //     }
                  //
                  //     return Column(
                  //       children: [
                  //         if (snapshot.data?.status ==
                  //             PeripheralStatus.connected)
                  //           ButtonWidget(
                  //             isLoading: false,
                  //             buttonHeight: 48.h,
                  //             borderRadius: 10.r,
                  //             buttonText: "طباعه",
                  //             backGroundColor: AppColors.mainColor,
                  //             textStyle:
                  //             TextStyles.font14WhiteColorWeight500,
                  //             onPressed: () async {
                  //               _selectImage();
                  //             },
                  //           ),
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
