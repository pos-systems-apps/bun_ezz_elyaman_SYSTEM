// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:pos_system/core/utils/app_colors_white_theme.dart';
// import 'package:pos_system/core/utils/assets_manager.dart';
// import 'package:pos_system/core/utils/styles.dart';
// import 'package:pos_system/features/collections/logic/collections_cubit.dart';
// import 'package:pos_system/features/collections/logic/collections_state.dart';
//
// class CollectionItemsWidget extends StatelessWidget {
//   const CollectionItemsWidget({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//
//     return BlocBuilder<CollectionsCubit, CollectionsState>(
//       buildWhen: (previous, current) {
//         return current is OnAddItemState ||
//             current is OnRemoveItemState ||
//             current is OnClearItemsState;
//       },
//       builder: (context, state) {
//         return Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             TextFormField(
//               controller: CollectionsCubit.get(context).itemController,
//               style: TextStyles.font14BlackColorWeight400,
//               keyboardType: TextInputType.text,
//               textInputAction: TextInputAction.done,
//               onFieldSubmitted: (value) {
//                 CollectionsCubit.get(context).addItem(value);
//                 CollectionsCubit.get(context).itemController.clear();
//               },
//               decoration: InputDecoration(
//                 hintText: "ادخل العنصر واضغط Enter",
//                 hintStyle: TextStyles.font14GreyColor87Weight400,
//                 filled: true,
//                 fillColor: AppColors.whiteColor,
//                 contentPadding: EdgeInsets.symmetric(
//                   horizontal: 16.w,
//                   vertical: 16.h,
//                 ),
//                 prefixIcon: Padding(
//                   padding: EdgeInsets.symmetric(
//                     horizontal: 20.w,
//                     vertical: 10.h,
//                   ),
//                   child: SvgPicture.asset(
//                     ImageAsset.moreICon,
//                   ),
//                 ),
//                 suffixIcon: IconButton(
//                   onPressed: () {
//                     CollectionsCubit.get(context).addItem(CollectionsCubit.get(context).itemController.text);
//                     CollectionsCubit.get(context).itemController.clear();
//                   },
//                   icon: Icon(
//                     Icons.add_circle_outline,
//                     color: AppColors.mainColor,
//                     size: 24.sp,
//                   ),
//                 ),
//                 focusedBorder: OutlineInputBorder(
//                   borderSide: BorderSide(
//                     color: AppColors.greyColorDB,
//                     width: 1.3,
//                   ),
//                   borderRadius: BorderRadius.circular(8.r),
//                 ),
//                 enabledBorder: OutlineInputBorder(
//                   borderSide: BorderSide(
//                     color: AppColors.greyColorDB,
//                     width: 1.3,
//                   ),
//                   borderRadius: BorderRadius.circular(8.r),
//                 ),
//                 errorBorder: OutlineInputBorder(
//                   borderSide: BorderSide(
//                     color: AppColors.redColor,
//                     width: 1.3,
//                   ),
//                   borderRadius: BorderRadius.circular(8.r),
//                 ),
//                 focusedErrorBorder: OutlineInputBorder(
//                   borderSide: BorderSide(
//                     color: AppColors.redColor,
//                     width: 1.3,
//                   ),
//                   borderRadius: BorderRadius.circular(8.r),
//                 ),
//               ),
//             ),
//
//             SizedBox(height: 12.h),
//
//             if (CollectionsCubit.get(context).items.isEmpty)
//               Text(
//                 "لم يتم إضافة عناصر بعد",
//                 style: TextStyles.font14GreyColor87Weight400,
//               )
//             else
//               Container(
//                 width: double.infinity,
//                 padding: EdgeInsets.all(12.w),
//                 decoration: BoxDecoration(
//                   color: AppColors.whiteColor,
//                   borderRadius: BorderRadius.circular(8.r),
//                   border: Border.all(
//                     color: AppColors.greyColorDB,
//                     width: 1.3,
//                   ),
//                 ),
//                 child: Wrap(
//                   spacing: 8.w,
//                   runSpacing: 8.h,
//                   children: CollectionsCubit.get(context).items.asMap().entries.map((entry) {
//                     final index = entry.key;
//                     final item = entry.value;
//
//                     return Container(
//                       padding: EdgeInsets.symmetric(
//                         horizontal: 10.w,
//                         vertical: 8.h,
//                       ),
//                       decoration: BoxDecoration(
//                         color: AppColors.greyColorDB.withOpacity(0.25),
//                         borderRadius: BorderRadius.circular(20.r),
//                       ),
//                       child: Row(
//                         mainAxisSize: MainAxisSize.min,
//                         children: [
//                           Text(
//                             item,
//                             style: TextStyles.font14BlackColorWeight400,
//                           ),
//                           SizedBox(width: 6.w),
//                           InkWell(
//                             onTap: () {
//                               CollectionsCubit.get(context).removeItem(index);
//                             },
//                             child: Icon(
//                               Icons.close,
//                               size: 18.sp,
//                               color: AppColors.redColor,
//                             ),
//                           ),
//                         ],
//                       ),
//                     );
//                   }).toList(),
//                 ),
//               ),
//           ],
//         );
//       },
//     );
//   }
// }