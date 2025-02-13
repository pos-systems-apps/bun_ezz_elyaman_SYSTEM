import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pos_system/core/utils/spacing.dart';

import 'package:pos_system/features/sales/data/entities/order_type_class.dart';
import 'package:pos_system/features/sales/ui/reseat_widgets/products_selected/products_selected_widget.dart';
import 'package:pos_system/features/sales/ui/reseat_widgets/reseat_order_type/reseat_order_types_widget.dart';
import 'package:pos_system/features/sales/ui/reseat_widgets/search_user_widget.dart';

class ReseatBodyWidget extends StatelessWidget {

  const ReseatBodyWidget({ super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ReseatOrderTypesWidget(),
            verticalSpace(24),
            SearchUserWidget(),
            verticalSpace(24),
            ProductsSelectedWidget(),



            verticalSpace(40),
          ],
        ),
      ),
    );
  }
}
