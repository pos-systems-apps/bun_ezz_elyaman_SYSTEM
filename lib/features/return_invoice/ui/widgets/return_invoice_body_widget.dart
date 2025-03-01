import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pos_system/features/return_invoice/ui/widgets/return_invoice_item_widget.dart';

class ReturnInvoiceBodyWidget extends StatelessWidget {
  const ReturnInvoiceBodyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ReturnInvoiceItemWidget(),
            ReturnInvoiceItemWidget(),
            ReturnInvoiceItemWidget(),
            ReturnInvoiceItemWidget(),
            ReturnInvoiceItemWidget(),
            ReturnInvoiceItemWidget(),
          ],
        ),
      ),
    );
  }
}
