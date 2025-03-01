import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pos_system/core/utils/app_colors_white_theme.dart';
import 'package:pos_system/core/utils/spacing.dart';
import 'package:pos_system/core/utils/styles.dart';
import 'package:pos_system/core/widgets/button_widget.dart';
import 'package:pos_system/features/fund_list/ui/widgets/fund_list_selected_date_widget.dart';
import 'package:pos_system/features/fund_list/ui/widgets/fund_list_table_widget.dart';
import 'package:pos_system/features/fund_list/ui/widgets/mandoube_name_widget.dart';
import 'package:pos_system/features/sales_invoice/ui/widgets/invoice_item_widget.dart';

class SalesInvoiceBodyWidget extends StatelessWidget {
  const SalesInvoiceBodyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            InvoiceItemWidget(),
            InvoiceItemWidget(),
            InvoiceItemWidget(),
            InvoiceItemWidget(),
            InvoiceItemWidget(),
            InvoiceItemWidget(),
          ],
        ),
      ),
    );
  }
}
