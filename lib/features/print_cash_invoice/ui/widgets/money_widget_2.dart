// import 'package:flutter/material.dart';
// import 'package:pos_system/core/utils/styles.dart';
//
// class MoneyWidget2 extends StatelessWidget {
//   final String text;
//   final String quantity;
//   final String measure;
//   final String price;
//
//   const MoneyWidget2(
//       {required this.text,
//       required this.quantity,
//       required this.measure,
//       required this.price,
//       super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       children: [
//         Expanded(
//           flex: 4,
//           child: Text(text,
//               textAlign: TextAlign.start,
//               maxLines: 1,
//               style: TextStyles.font10GreyColor33Weight500),
//         ),
//         Spacer(
//           flex: 1,
//         ),
//         Expanded(
//           flex: 2,
//           child: Text(quantity,
//               textAlign: TextAlign.start,
//               maxLines: 1,
//               style: TextStyles.font10BlackColorWeight500),
//         ),
//         Spacer(
//           flex: 1,
//         ),
//         Expanded(
//           flex: 2,
//           child: Text(measure,
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
