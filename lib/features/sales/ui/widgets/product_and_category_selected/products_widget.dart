import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pos_system/features/sales/logic/sales_cubit.dart';
import 'package:pos_system/features/sales/logic/sales_state.dart';
import 'package:pos_system/features/sales/ui/widgets/product_and_category_selected/product_widget.dart';

class ProductsWidget extends StatelessWidget {
  const ProductsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SalesCubit, SalesState>(
      buildWhen: (previous, current) {
        return current is OnChangeSelectedProductState;
      },
      builder: (context, state) {
        return GridView.builder(
            padding: EdgeInsets.zero,
            shrinkWrap: true,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 13.w,
              mainAxisSpacing: 16.h,
              childAspectRatio: 1 / 1.8,
            ),
            physics: const BouncingScrollPhysics(),
            itemCount: SalesCubit.get(context).products.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  if (SalesCubit.get(context).selectedProductsIsContainProduct(
                      SalesCubit.get(context).products[index])) {
                    SalesCubit.get(context).removeProductFromSelectedProducts(
                        SalesCubit.get(context).products[index]);
                  } else {
                    SalesCubit.get(context).addProductToSelectedProducts(
                        SalesCubit.get(context).products[index]);
                  }
                },
                child: ProductWidget(
                    name: SalesCubit.get(context).products[index].name,
                    isSelected: SalesCubit.get(context)
                        .selectedProductsIsContainProduct(
                            SalesCubit.get(context).products[index])),
              );
            });
      },
    );
  }
}
