import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pos_system/features/cash_invoice/ui/widgets/cash_invoice_item_widget.dart';

class CashInvoiceBodyWidget extends StatelessWidget {
  const CashInvoiceBodyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CashInvoiceItemWidget(),
            CashInvoiceItemWidget(),
            CashInvoiceItemWidget(),
            CashInvoiceItemWidget(),
            CashInvoiceItemWidget(),
            CashInvoiceItemWidget(),
          ],
        ),
      ),
    );
  }
}
