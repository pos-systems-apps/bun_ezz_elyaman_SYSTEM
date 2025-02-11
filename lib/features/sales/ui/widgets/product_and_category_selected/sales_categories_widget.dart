import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:pos_system/core/utils/assets_manager.dart';
import 'package:pos_system/features/sales/logic/sales_cubit.dart';
import 'package:pos_system/features/sales/logic/sales_state.dart';
import 'package:pos_system/features/sales/ui/widgets/product_and_category_selected/categories_shimmer_widget.dart';
import 'package:pos_system/features/sales/ui/widgets/product_and_category_selected/sales_category_widget.dart';

class SalesCategoriesWidget extends StatelessWidget {
  const SalesCategoriesWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SalesCubit, SalesState>(
      buildWhen: (previous, current) {
        return current is OnChangeSelectedCategoryState ||
            current is OnGetCategoryLoadingState ||
            current is OnGetCategorySuccessState ||
            current is OnGetCategoryErrorState ||
            current is OnGetCategoryCatchErrorState;
      },
      builder: (context, state) {
        if (SalesCubit.get(context).categories.isEmpty &&
            state is OnGetCategoryLoadingState) {
          return Lottie.asset(
            ImageAsset.notFoundAnimation,
            height: 85.h,
            repeat: true,
            fit: BoxFit.fitHeight,
          );
        }else if (SalesCubit.get(context).categories.isEmpty &&
            state is! OnGetCategoryLoadingState) {
          return CategoriesShimmerWidget();
        } else {
          return SingleChildScrollView(
            padding: EdgeInsets.symmetric(vertical: 24.h),
            scrollDirection: Axis.horizontal,
            controller: SalesCubit.get(context).categoriesScrollController,
            child: Row(
              children: SalesCubit.get(context)
                  .categories
                  .map(
                    (item) => GestureDetector(
                        onTap: () {
                          SalesCubit.get(context).changeSelectedCategory(item);
                        },
                        child: SalesCategoryWidget(
                            category: item,
                            isSelected: item.id ==
                                SalesCubit.get(context).selectedCategory?.id)),
                  )
                  .toList(),
            ),
          );
        }
      },
    );
  }
}
