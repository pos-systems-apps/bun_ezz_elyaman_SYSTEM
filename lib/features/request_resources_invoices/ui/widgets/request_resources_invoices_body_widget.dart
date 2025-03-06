import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pos_system/core/utils/assets_manager.dart';
import 'package:pos_system/core/utils/spacing.dart';
import 'package:pos_system/core/utils/styles.dart';
import 'package:pos_system/features/my_requests/ui/widgets/my_requests_shimmer_widget.dart';
import 'package:pos_system/features/request_resources_invoices/logic/request_resources_invoices_cubit.dart';
import 'package:pos_system/features/request_resources_invoices/logic/request_resources_invoices_state.dart';
import 'package:pos_system/features/request_resources_invoices/ui/widgets/request_resources_invoices_item_widget.dart';


class RequestResourcesInvoicesBodyWidget extends StatelessWidget {
  const RequestResourcesInvoicesBodyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RequestResourcesInvoicesCubit, RequestResourcesInvoicesState>(
      buildWhen: (previous, current) {
        return current is OnGetInvoicesLoadingState ||
            current is OnGetInvoicesSuccessState ||
            current is OnGetInvoicesErrorState ||
            current is OnGetInvoicesCatchErrorState;
      },
      builder: (context, state) {
        if (RequestResourcesInvoicesCubit.get(context).reservations.isEmpty &&
            state is OnGetInvoicesLoadingState) {
          return Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: MyRequestsShimmerWidget(),
            ),
          );
        } else if (RequestResourcesInvoicesCubit.get(context).reservations.isEmpty &&
            state is! OnGetInvoicesLoadingState) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(ImageAsset.notFoundImage),
                verticalSpace(24),
                Text(
                  "لا يوجد بايانات",
                  style: TextStyles.font20MainColorWeightBold,
                ),
              ],
            ),
          );
        } else {
          return Expanded(
            child: SingleChildScrollView(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Column(
                children: RequestResourcesInvoicesCubit.get(context)
                    .reservations
                    .map((item) => RequestResourcesInvoicesItemWidget(item: item,))
                    .toList(),
              ),
            ),
          );
        }
      },
    );
  }
}
