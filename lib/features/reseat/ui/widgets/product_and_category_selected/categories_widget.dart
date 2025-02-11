import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pos_system/features/sales/data/models/category_response.dart';
import 'package:pos_system/features/sales/logic/sales_cubit.dart';
import 'package:pos_system/features/sales/logic/sales_state.dart';
import 'package:pos_system/features/sales/ui/widgets/product_and_category_selected/sales_category_widget.dart';

class CategoriesWidget extends StatelessWidget {
  const CategoriesWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SalesCubit, SalesState>(
      buildWhen: (previous, current) {
        return current is OnChangeSelectedCategoryState;
      },
      builder: (context, state) {
        return SingleChildScrollView(
          padding: EdgeInsets.symmetric(vertical: 24.h),
          scrollDirection: Axis.horizontal,
          child: Text("data"),
          // Row(
          //   children: SalesCubit.get(context)
          //       .categories
          //       .map(
          //         (item) => GestureDetector(
          //             onTap: () {
          //               SalesCubit.get(context).changeSelectedCategory(item);
          //             },
          //             child: CategoryWidget(
          //                category: Category(id: id, name: name, image: image, type: type),
          //                 isSelected: item.id ==
          //                     SalesCubit.get(context).selectedCategory?.id)),
          //       )
          //       .toList(),
          // ),
        );
      },
    );
  }
}
