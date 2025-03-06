import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pos_system/core/utils/assets_manager.dart';
import 'package:pos_system/core/utils/spacing.dart';
import 'package:pos_system/core/utils/styles.dart';
import 'package:pos_system/features/cash_invoice/logic/cash_invoice_cubit.dart';
import 'package:pos_system/features/cash_invoice/logic/cash_invoice_state.dart';
import 'package:pos_system/features/cash_invoice/ui/widgets/cash_invoice_item_widget.dart';
import 'package:pos_system/features/my_requests/ui/widgets/my_requests_shimmer_widget.dart';

class CashInvoiceBodyWidget extends StatelessWidget {
  const CashInvoiceBodyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CashInvoiceCubit, CashInvoiceState>(
      buildWhen: (previous, current) {
        return current is OnGetInvoicesLoadingState ||
            current is OnGetInvoicesSuccessState ||
            current is OnGetInvoicesErrorState ||
            current is OnGetInvoicesCatchErrorState;
      },
      builder: (context, state) {
        if (CashInvoiceCubit.get(context).invoices.isEmpty &&
            state is OnGetInvoicesLoadingState) {
          return Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: MyRequestsShimmerWidget(),
            ),
          );
        } else if (CashInvoiceCubit.get(context).invoices.isEmpty &&
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
              child: Column(
                children: CashInvoiceCubit.get(context)
                    .invoices
                    .map((item) => CashInvoiceItemWidget(
                          item: item,
                        ))
                    .toList(),
              ),
            ),
          );
        }
      },
    );
  }
}
