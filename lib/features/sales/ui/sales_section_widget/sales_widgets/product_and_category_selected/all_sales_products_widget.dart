import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:pos_system/core/utils/assets_manager.dart';
import 'package:pos_system/features/sales/logic/sales_cubit.dart';
import 'package:pos_system/features/sales/logic/sales_state.dart';
import 'package:pos_system/features/sales/ui/sales_section_widget/sales_widgets/product_and_category_selected/all_products_and_search_products_widget.dart';
import 'package:pos_system/features/sales/ui/sales_section_widget/sales_widgets/product_and_category_selected/category_products_shimmer_widget.dart';

class AllSalesProductsWidget extends StatelessWidget {
  const AllSalesProductsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SalesCubit, SalesState>(
      buildWhen: (previous, current) {
        return current is OnChangeSelectedProductState ||
            current is OnGetCategoryProductsLoadingState ||
            current is OnGetCategoryProductsSuccessState ||
            current is OnGetCategoryProductsErrorState ||
            current is OnGetCategoryProductsCatchErrorState ||


            current is OnGetSearchProductsLoadingState ||
            current is OnGetSearchProductsSuccessState ||
            current is OnGetSearchProductsErrorState ||
            current is OnGetSearchProductsCatchErrorState;
      },
      builder: (context, state) {
        print(21212121);
        if (SalesCubit.get(context).searchProductController.text.isNotEmpty) {
          if (SalesCubit.get(context).searchProducts.isEmpty &&
              state is OnGetSearchProductsLoadingState) {
            return CategoryProductsShimmerWidget();
          } else if (SalesCubit.get(context).searchProducts.isEmpty &&
              state is! OnGetSearchProductsLoadingState) {
            return Lottie.asset(
              ImageAsset.notFoundAnimation,
              height: 210.h,
              repeat: true,
              fit: BoxFit.fitHeight,
            );
          } else {
            return AllProductsAndSearchProductsWidget(isSearch: true);
          }
        } else {
          if (SalesCubit.get(context).products.isEmpty &&
              state is OnGetCategoryProductsLoadingState) {
            return CategoryProductsShimmerWidget();
          } else if (SalesCubit.get(context).products.isEmpty &&
              state is! OnGetCategoryProductsLoadingState) {
            return Lottie.asset(
              ImageAsset.notFoundAnimation,
              height: 210.h,
              repeat: true,
              fit: BoxFit.fitHeight,
            );
          } else {
            return AllProductsAndSearchProductsWidget(isSearch: false);
          }
        }
      },
    );
  }
}
