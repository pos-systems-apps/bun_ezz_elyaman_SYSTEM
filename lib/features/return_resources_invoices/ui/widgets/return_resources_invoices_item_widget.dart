// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:pos_system/config/routes/routes.dart';
// import 'package:pos_system/core/utils/app_colors_white_theme.dart';
// import 'package:pos_system/core/utils/extentions.dart';
// import 'package:pos_system/core/utils/spacing.dart';
// import 'package:pos_system/core/utils/styles.dart';
// import 'package:pos_system/core/widgets/button_widget.dart';
// import 'package:pos_system/features/request_resources_invoices/data/models/get_resources_invoices_response_model.dart';
//
// class ReturnResourcesInvoicesItemWidget extends StatelessWidget {
//   final ResourcesInvoices item;
//
//   const ReturnResourcesInvoicesItemWidget({required this.item, super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: double.infinity,
//       margin: EdgeInsets.symmetric(vertical: 8.h),
//       padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
//       decoration: BoxDecoration(
//         color: AppColors.whiteColor,
//         borderRadius: BorderRadius.circular(4.r),
//         border: Border.all(color: AppColors.blueColorEEE),
//       ),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Center(
//             child: Text("ملخص الفاتوره",
//                 style: TextStyles.font16MainColorWeight500),
//           ),
//           verticalSpace(4),
//           _itemTextWidget("رقم الفاتوره", " ${item.id}"),
//           verticalSpace(4),
//           _itemTextWidget("التاريخ", " ${item.date}"),
//           verticalSpace(4),
//           verticalSpace(4),
//           _itemTextWidget("اسم المندوب", " ${item.seller.nameAr}"),
//           verticalSpace(4),
//           // _itemTextWidget("اسم العميل", " ${item.customerName}"),
//           verticalSpace(4),
//
//
//
//           // _itemTextWidget("اسم العميل", " ${item}"),
//
//
//
//           Row(
//             children: [
//               Expanded(
//                 flex: 4,
//                 child: Text("اسم المنتج",
//                     textAlign: TextAlign.start,
//                     maxLines: 1,
//                     style: TextStyles.font10GreyColor78Weight400),
//               ),
//               Spacer(
//                 flex: 1,
//               ),
//               Expanded(
//                 flex: 2,
//                 child: Text("المطلوب",
//                     textAlign: TextAlign.start,
//                     maxLines: 1,
//                     style: TextStyles.font10GreyColor78Weight400),
//               ),
//               Spacer(
//                 flex: 1,
//               ),
//               Expanded(
//                 flex: 2,
//                 child: Text("المتاح",
//                     textAlign: TextAlign.start,
//                     maxLines: 1,
//                     style: TextStyles.font10GreyColor78Weight400),
//               ),
//               Spacer(
//                 flex: 1,
//               ),
//               Expanded(
//                 flex: 2,
//                 child: Text("السعر",
//                     textAlign: TextAlign.start,
//                     maxLines: 1,
//                     style: TextStyles.font10GreyColor78Weight400),
//               ),
//             ],
//           ),
//           verticalSpace(4),
//           Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: item.items
//                   .map(
//                     (element) => Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       _itemsData(
//                           element.productName,
//                           element.requestQuantity.toString(),
//                           element.yourQuantity.toString(),
//                           element.price.toString()),
//                       verticalSpace(4),
//                     ]),
//               )
//                   .toList()),
//
//
//
//           verticalSpace(16),
//           ButtonWidget(
//               isLoading: false,
//               buttonHeight: 40.h,
//               buttonText: "عرض",
//               borderRadius: 4.r,
//               backGroundColor: AppColors.mainColor,
//               borderColor: AppColors.mainColor,
//               textStyle: TextStyles.font16WhiteColorWeight500,
//               onPressed: () {
//                 context.pushNamed(Routes.electronicResourcesInvoicesScreen,
//                     arguments: {"invoiceId": item.id});
//                 // AddCustomerCubit.get(context).clearAddCustomerData();
//               }),
//           verticalSpace(4),
//         ],
//       ),
//     );
//   }
//
//   Text _itemTextWidget(String title, String value) {
//     return Text.rich(
//       textAlign: TextAlign.start,
//       TextSpan(children: [
//         TextSpan(
//             text: title,
//             style: TextStyles.font14GreyColor66Weight400
//                 .copyWith(color: AppColors.greyColor66.withValues(alpha: .5))),
//         TextSpan(
//             text: " : $value ", style: TextStyles.font14GreyColor66Weight400),
//       ]),
//     );
//   }
//   Row _itemsData(String name, String stock, String balance, String price) {
//     return Row(
//       children: [
//         Expanded(
//           flex: 4,
//           child: Text(name,
//               textAlign: TextAlign.start,
//               maxLines: 1,
//               style: TextStyles.font10GreyColor33Weight500),
//         ),
//         Spacer(
//           flex: 1,
//         ),
//         Expanded(
//           flex: 2,
//           child: Text(stock,
//               textAlign: TextAlign.start,
//               maxLines: 1,
//               style: TextStyles.font10BlackColorWeight500),
//         ),
//         Spacer(
//           flex: 1,
//         ),
//         Expanded(
//           flex: 2,
//           child: Text(balance,
//               textAlign: TextAlign.start,
//               maxLines: 1,
//               style: TextStyles.font10BlackColorWeight500),
//         ),
//         Spacer(
//           flex: 1,
//         ),
//         Expanded(
//           flex: 2,
//           child: Text(price,
//               textAlign: TextAlign.start,
//               maxLines: 1,
//               style: TextStyles.font10BlackColorWeight500),
//         ),
//       ],
//     );
//   }
// }
