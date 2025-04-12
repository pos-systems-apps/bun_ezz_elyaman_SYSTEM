import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:pos_system/core/utils/assets_manager.dart';
import 'package:pos_system/features/add_request_resources/logic/add_request_resources_cubit.dart';
import 'package:pos_system/features/add_request_resources/logic/add_request_resources_state.dart';
import 'package:pos_system/features/add_request_resources/ui/add_request_resources_widgets/product_and_category_selected/add_request_resources_category_widget.dart';
import 'package:pos_system/features/sales/ui/sales_section_widget/sales_widgets/product_and_category_selected/categories_shimmer_widget.dart';

class AddRequestResourcesCategoriesWidget extends StatelessWidget {
  const AddRequestResourcesCategoriesWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AddRequestResourcesCubit, AddRequestResourcesState>(
      buildWhen: (previous, current) {
        return current is OnChangeSelectedCategoryState ||
            current is OnGetCategoryLoadingState ||
            current is OnGetCategorySuccessState ||
            current is OnGetCategoryErrorState ||
            current is OnGetCategoryCatchErrorState;
      },
      builder: (context, state) {
        if (AddRequestResourcesCubit.get(context).categories.isEmpty &&
            state is OnGetCategoryLoadingState) {
          return CategoriesShimmerWidget();
        } else if (AddRequestResourcesCubit.get(context).categories.isEmpty &&
            state is! OnGetCategoryLoadingState) {
          return Lottie.asset(
            ImageAsset.notFoundAnimation,
            height: 85.h,
            repeat: true,
            fit: BoxFit.fitHeight,
          );
        } else {
          return SingleChildScrollView(
            padding: EdgeInsets.symmetric(vertical: 24.h),
            scrollDirection: Axis.horizontal,
            controller: AddRequestResourcesCubit.get(context).categoriesScrollController,
            child: Row(
              children: AddRequestResourcesCubit.get(context)
                  .categories
                  .map(
                    (item) => GestureDetector(
                        onTap: () {
                          AddRequestResourcesCubit.get(context).changeSelectedCategory(item);
                        },
                        child: AddRequestResourcesCategoryWidget(
                            category: item,
                            isSelected: item.id ==
                                AddRequestResourcesCubit.get(context).selectedCategory?.id)),
                  )
                  .toList(),
            ),
          );
        }
      },
    );
  }
}
