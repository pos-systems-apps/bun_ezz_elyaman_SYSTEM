// import 'package:easy_localization/easy_localization.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:pos_system/core/utils/app_colors_white_theme.dart';
// import 'package:pos_system/features/collections/logic/collections_cubit.dart';
// import 'package:pos_system/features/collections/logic/collections_state.dart';
// import 'package:pos_system/features/collections/ui/widgets/select_items/collections_select_item_widget.dart';
// import 'package:pos_system/features/collections/ui/widgets/select_items/collections_vertical_divider_widget.dart';
// import 'package:pos_system/features/splash/data/models/pay_class.dart';
//
// class CollectionsPayAccountWidget extends StatelessWidget {
//   const CollectionsPayAccountWidget({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return BlocBuilder<CollectionsCubit, CollectionsState>(
//       buildWhen: (previous, current) {
//         return current is OnChangePaySelectState;
//       },
//       builder: (context, state) {
//         return SingleChildScrollView(
//           scrollDirection: Axis.horizontal,
//           child: Container(
//             height: 56.h,
//             decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(8.r),
//                 border: Border.all(color: AppColors.greyColorDB, width: 1.2)),
//             child: Row(
//               children: CollectionsCubit.get(context)
//                   .pays
//                   .asMap()
//                   .entries
//                   .map((item) {
//                 int index = item.key;
//                 PayClass value = item.value;
//                 return Row(
//                   children: [
//                     GestureDetector(
//                         onTap: () {
//                           CollectionsCubit.get(context)
//                               .changeSelectedPay(value);
//                         },
//                         child: CollectionsSelectItemWidget(
//                             name: context.locale.languageCode == "ar"
//                                 ? value.nameAr
//                                 : value.nameEn,
//                             isSelected: value.id ==
//                                 CollectionsCubit.get(context).selectedPay?.id)),
//                     if (index < CollectionsCubit.get(context).pays.length - 1)
//                       CollectionsVerticalDividerWidget(),
//                   ],
//                 );
//               }).toList(),
//             ),
//           ),
//         );
//       },
//     );
//   }
// }
