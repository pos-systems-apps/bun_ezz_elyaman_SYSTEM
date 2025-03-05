import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:pos_system/core/utils/assets_manager.dart';
import 'package:pos_system/features/add_request_resources/logic/add_request_resources_cubit.dart';
import 'package:pos_system/features/add_request_resources/logic/add_request_resources_state.dart';
import 'package:pos_system/features/add_request_resources/ui/add_request_resources_widgets/product_and_category_selected/add_request_resources_products_and_search_widget.dart';
import 'package:pos_system/features/sales/ui/sales_widgets/product_and_category_selected/category_products_shimmer_widget.dart';

class AddRequestResourcesProductsWidget extends StatelessWidget {
  const AddRequestResourcesProductsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AddRequestResourcesCubit, AddRequestResourcesState>(
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
        if (AddRequestResourcesCubit.get(context).searchProductController.text.isNotEmpty) {
          if (AddRequestResourcesCubit.get(context).searchProducts.isEmpty &&
              state is OnGetSearchProductsLoadingState) {
            return CategoryProductsShimmerWidget();
          } else if (AddRequestResourcesCubit.get(context).searchProducts.isEmpty &&
              state is! OnGetSearchProductsLoadingState) {
            return Lottie.asset(
              ImageAsset.notFoundAnimation,
              height: 210.h,
              repeat: true,
              fit: BoxFit.fitHeight,
            );
          } else {
            return AddRequestResourcesProductsAndSearchWidget(isSearch: true);
          }
        } else {
          if (AddRequestResourcesCubit.get(context).products.isEmpty &&
              state is OnGetCategoryProductsLoadingState) {
            return CategoryProductsShimmerWidget();
          } else if (AddRequestResourcesCubit.get(context).products.isEmpty &&
              state is! OnGetCategoryProductsLoadingState) {
            return Lottie.asset(
              ImageAsset.notFoundAnimation,
              height: 210.h,
              repeat: true,
              fit: BoxFit.fitHeight,
            );
          } else {
            return AddRequestResourcesProductsAndSearchWidget(isSearch: false);
          }
        }
      },
    );
  }
}
