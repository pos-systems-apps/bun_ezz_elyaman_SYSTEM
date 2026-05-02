import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pos_system/core/utils/app_colors_white_theme.dart';
import 'package:pos_system/core/utils/assets_manager.dart';
import 'package:pos_system/core/utils/spacing.dart';
import 'package:pos_system/core/utils/styles.dart';
import 'package:pos_system/features/customers/logic/customers_cubit.dart';
import 'package:pos_system/features/customers/logic/customers_state.dart';
import 'package:pos_system/features/customers/ui/widgets/customers_search_user_widget.dart';
import 'package:pos_system/features/customers/ui/widgets/customers_shimmer_widget.dart';

class CustomersBodyWidget extends StatelessWidget {
  const CustomersBodyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomersSearchUserWidget(),
            verticalSpace(16),
            Expanded(
                child: BlocBuilder<CustomersCubit, CustomersState>(
              buildWhen: (previous, current) {
                return current is OnGetUsersLoadingState ||
                    current is OnGetUsersSuccessState ||
                    current is OnGetUsersErrorState ||
                    current is OnGetUsersCatchErrorState;
              },
              builder: (context, state) {
                if (CustomersCubit.get(context).users.isEmpty &&
                    state is OnGetUsersLoadingState) {
                  return CustomersShimmerWidget();
                } else if (CustomersCubit.get(context).users.isEmpty &&
                    state is! OnGetUsersLoadingState) {
                  return Center(
                    child: Column(
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
                  return ListView.separated(
                    padding: EdgeInsets.zero,
                    shrinkWrap: true,
                    itemCount: CustomersCubit.get(context).users.length,
                    separatorBuilder: (context, index) {
                      return verticalSpace(16);
                    },
                    itemBuilder: (context, index) {
                      return Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: 16.w, vertical: 16.h),
                        decoration: BoxDecoration(
                            color: AppColors.whiteColor,
                            borderRadius: BorderRadius.circular(4.r),
                            border: Border.all(color: AppColors.blueColorEEE)),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(CustomersCubit.get(context)
                                      .users[index]
                                      .name
                                 ,
                              maxLines: 2,
                              style: TextStyles.font16BlackWeight500,
                            ),
                            verticalSpace(4),
                            if(CustomersCubit.get(context).users[index].address!=null)

                              Text(
                                "العنوان : ${CustomersCubit.get(context).users[index].address}",
                                maxLines: 1,
                                style: TextStyles.font14GreyColor66Weight400),
                            verticalSpace(4),
                            if(CustomersCubit.get(context).users[index].phone!=null)
                              Text(
                                "الهاتف : ${CustomersCubit.get(context).users[index].phone}",
                                maxLines: 1,
                                style: TextStyles.font14GreyColor66Weight400),
                            verticalSpace(4),
                            if(CustomersCubit.get(context).users[index].email!=null)
                            Text(
                                "الاميل : ${CustomersCubit.get(context).users[index].email}",
                                maxLines: 1,
                                style: TextStyles.font14GreyColor66Weight400),
                            verticalSpace(4),
                            // Row(
                            //   children: [
                            //     Text.rich(
                            //       TextSpan(children: [
                            //         TextSpan(
                            //           text: "الرصيد",
                            //           style:
                            //               TextStyles.font14GreyColor66Weight400,
                            //         ),
                            //         // TextSpan(
                            //         //   text:
                            //         //       "${AppConstant.currency} ${(CustomersCubit.get(context).users[index].balance
                            //         //           + CustomersCubit.get(context).users[index].discount -
                            //         //           CustomersCubit.get(context).users[index].credit).abs().toStringAsFixed(2)}",
                            //         //   style: TextStyles
                            //         //       .font14GreyColor66Weight400
                            //         //       .copyWith(
                            //         //           color: AppColors.greenColor7C),
                            //         // ),
                            //       ]),
                            //     ),
                            //     // const Spacer(),
                            //     // Text(
                            //     //   (CustomersCubit.get(context).users[index].balance
                            //     //       + CustomersCubit.get(context).users[index].discount -
                            //     //       CustomersCubit.get(context).users[index].credit) <
                            //     //           0
                            //     //       ? "مدين"
                            //     //       : "دائن",
                            //     //   style: TextStyles.font14GreyColor66Weight400
                            //     //       .copyWith(color: AppColors.yellowColor19),
                            //     // ),
                            //     const Spacer(),
                            //   ],
                            // ),
                          ],
                        ),
                      );
                    },
                  );
                }
              },
            )),
          ],
        ),
      ),
    );
  }
}
