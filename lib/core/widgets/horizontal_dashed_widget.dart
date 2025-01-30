//
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:magic/core/utils/app_colors_white_theme.dart';
//
// class HorizontalDashedWidget extends StatelessWidget {
//   const HorizontalDashedWidget({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//       height: 1,
//       width: double.infinity,
//       child: CustomPaint(
//         painter: DashedLinePainter(),
//       ),
//     );
//   }
// }
//
// class DashedLinePainter extends CustomPainter {
//   @override
//   void paint(Canvas canvas, Size size) {
//     Paint paint = Paint()
//       ..color = AppColors.greyColorDE
//       ..strokeWidth = 1.h
//       ..strokeCap = StrokeCap.round;
//
//     double dashWidth = 20.w;
//     double dashSpace = 25.w;
//
//     double startX = 10.0;
//     double endX = size.width-10;
//
//     double currentX = startX;
//
//     while (currentX < endX) {
//       canvas.drawLine(Offset(currentX, 0.0), Offset(currentX + dashWidth, 0.0), paint);
//       currentX += dashWidth + dashSpace;
//     }
//   }
//
//   @override
//   bool shouldRepaint(CustomPainter oldDelegate) {
//     return false;
//   }
// }