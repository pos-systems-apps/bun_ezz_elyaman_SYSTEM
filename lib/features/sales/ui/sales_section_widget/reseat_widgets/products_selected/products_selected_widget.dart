import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pos_system/features/sales/logic/sales_cubit.dart';
import 'package:pos_system/features/sales/logic/sales_state.dart';
import 'package:pos_system/features/sales/ui/sales_section_widget/reseat_widgets/products_selected/product_selected_widget.dart';

class ProductsSelectedWidget extends StatelessWidget {
  const ProductsSelectedWidget({super.key});

  @override
  Widget build(BuildContext context) {

    if (SalesCubit.get(context).selectedProducts.isEmpty) {
      return SizedBox.shrink();
    } else {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: SalesCubit.get(context)
            .selectedProducts
            .map((item) => ProductSelectedWidget(
          selectedProduct: item,
        ))
            .toList(),
      );
    }
    return BlocBuilder<SalesCubit, SalesState>(
      buildWhen: (previous, current) {
        return current is OnChangeSelectedProductState;
      },
      builder: (context, state) {


      },
    );
  }
}
