import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pos_system/core/utils/app_colors_white_theme.dart';
import 'package:pos_system/core/utils/assets_manager.dart';
import 'package:pos_system/core/utils/spacing.dart';
import 'package:pos_system/core/utils/styles.dart';
import 'package:pos_system/core/widgets/button_widget.dart';
import 'package:pos_system/features/my_requests/ui/widgets/my_requests_shimmer_widget.dart';
import 'package:pos_system/features/sales_invoice/data/models/get_invoices_response_model.dart';
import 'package:pos_system/features/sales_invoice/logic/sales_invoice_cubit.dart';
import 'package:pos_system/features/sales_invoice/logic/sales_invoice_state.dart';
import 'package:pos_system/features/sales_invoice/ui/widgets/filter_name.dart';
import 'package:pos_system/features/sales_invoice/ui/widgets/invoice_item_widget.dart';

class SalesInvoiceBodyWidget extends StatelessWidget {
  const SalesInvoiceBodyWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SalesInvoiceCubit, SalesInvoiceState>(
      buildWhen: (previous, current) {
        return current is OnGetInvoicesLoadingState ||
            current is OnGetInvoicesSuccessState ||
            current is OnGetInvoicesErrorState ||
            current is OnChangeNameState ||
            current is OnChangeDateState ||
            current is OnGetInvoicesCatchErrorState;
      },
      builder: (context, state) {
        if (SalesInvoiceCubit.get(context).invoices.isEmpty &&
            state is OnGetInvoicesLoadingState) {
          return Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: MyRequestsShimmerWidget(),
            ),
          );
        } else if (SalesInvoiceCubit.get(context).invoices.isEmpty &&
            state is! OnGetInvoicesLoadingState) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(ImageAsset.notFoundImage),
                verticalSpace(24),
                Text(
                  "لا يوجد بايانات",
                  style: TextStyles.font20MainColorWeightBold,
                ),
              ],
            ),
          );
        } else {
          return Expanded(
            child: SingleChildScrollView(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Column(children: [
                FilterName(),
                verticalSpace(10),
                Row(
                  children: [
                    Expanded(
                        child: ButtonWidget(
                            isLoading: false,
                            buttonText: SalesInvoiceCubit.get(context)
                                        .selectedDate ==
                                    null
                                ? "اختر التاريخ"
                                : "${SalesInvoiceCubit.get(context).selectedDate!.year}-${SalesInvoiceCubit.get(context).selectedDate!.month.toString().padLeft(2, '0')}-${SalesInvoiceCubit.get(context).selectedDate!.day.toString().padLeft(2, '0')}",
                            textStyle: TextStyles.font16WhiteColorWeight500,
                            buttonHeight: 40.h,
                            borderRadius: 4.r,
                            backGroundColor: AppColors.mainColor,
                            borderColor: AppColors.mainColor,
                            onPressed: () {
                              SalesInvoiceCubit.get(context).pickDate(context);
                            })),
                  ],
                ),
                verticalSpace(10),

                ...SalesInvoiceCubit.get(context)
                    .invoices
                    .where((ele) {
                  final selectedCustomer =
                      SalesInvoiceCubit.get(context).selectedCustomerName;

                  if (selectedCustomer == null) {
                    return true;
                  }

                  return ele.customer?.id == selectedCustomer.id;
                })
                    .where((ele) {
                  final selectedDate =
                      SalesInvoiceCubit.get(context).selectedDate;

                  if (selectedDate == null) {
                    return true;
                  }

                  if (ele.date == null) {
                    return false;
                  }

                  final invoiceDate = ele.date!.toLocal();

                  return invoiceDate.year == selectedDate.year &&
                      invoiceDate.month == selectedDate.month &&
                      invoiceDate.day == selectedDate.day;
                })
                    .map((item) {
                  return InvoiceItemWidget(
                    item: item,
                  );
                }),
              ]),
            ),
          );
        }
      },
    );
  }
}
