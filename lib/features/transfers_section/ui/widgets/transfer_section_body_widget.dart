// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:pos_system/core/utils/assets_manager.dart';
// import 'package:pos_system/core/utils/spacing.dart';
// import 'package:pos_system/core/utils/styles.dart';
// import 'package:pos_system/features/transfers_section/logic/transfer_section_cubit.dart';
// import 'package:pos_system/features/transfers_section/logic/transfer_section_state.dart';
// import 'package:pos_system/features/transfers_section/ui/widgets/transaction_section_item_widget.dart';
// import 'package:pos_system/features/transfers_section/ui/widgets/transaction_section_shimmer_widget.dart';
//
// class TransferSectionBodyWidget extends StatelessWidget {
//   const TransferSectionBodyWidget({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return BlocBuilder<TransferSectionCubit, TransferSectionState>(
//       buildWhen: (previous, current) {
//         return current is OnGetTransactionSectionLoadingState ||
//             current is OnGetTransactionSectionSuccessState ||
//             current is OnGetTransactionSectionErrorState ||
//             current is OnGetTransactionSectionCatchErrorState;
//       },
//       builder: (context, state) {
//         if (TransferSectionCubit.get(context).transactionSection.isEmpty &&
//             state is OnGetTransactionSectionLoadingState) {
//           return Expanded(child: TransactionSectionShimmerWidget());
//         } else if (TransferSectionCubit.get(context)
//                 .transactionSection
//                 .isEmpty &&
//             state is! OnGetTransactionSectionLoadingState) {
//           return Center(
//             child: Column(
//               children: [
//                 Image.asset(ImageAsset.notFoundImage),
//                 verticalSpace(24),
//                 Text(
//                   "لا يوجد بايانات",
//                   style: TextStyles.font20MainColorWeightBold,
//                 ),
//               ],
//             ),
//           );
//         } else {
//           return Expanded(
//             child: SingleChildScrollView(
//               padding: EdgeInsets.symmetric(horizontal: 20.w),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: TransferSectionCubit.get(context)
//                     .transactionSection
//                     .map((item) => TransactionSectionItemWidget(
//                           item: item,
//                         ))
//                     .toList(),
//               ),
//             ),
//           );
//         }
//       },
//     );
//   }
// }
