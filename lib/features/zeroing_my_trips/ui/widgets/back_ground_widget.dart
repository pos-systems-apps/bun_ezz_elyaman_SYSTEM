// import 'package:easy_localization/easy_localization.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:pos_system/core/utils/extentions.dart';
//
// import '../../../../core/utils/app_colors_white_theme.dart';
// import '../../../../core/utils/assets_manager.dart';
// import '../../../../core/utils/spacing.dart';
// import '../../../../core/utils/styles.dart';
//
// class BackGroundWidget extends StatelessWidget {
//   const BackGroundWidget({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         Container(
//           height: context.height / 2,
//           padding: EdgeInsets.symmetric(horizontal: 30.w),
//           decoration: BoxDecoration(
//             color: AppColors.mainColor,
//             image: DecorationImage(
//               image: AssetImage(ImageAsset.backGroundImage),
//               fit: BoxFit.fill,
//             ),
//           ),
//           width: double.infinity,
//           child: SafeArea(
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.start,
//               crossAxisAlignment: CrossAxisAlignment.center,
//               children: [
//                 Image.asset(
//                   ImageAsset.logoImage,
//                   height: 60.r,
//                   width: 60.r,
//                 ),
//                 Text(
//                   "login.welcome".tr(),
//                   textAlign: TextAlign.center,
//                   style: TextStyles.font32WhiteColorWeightBold,
//                 ),
//                 verticalSpace(12),
//                 Text(
//                   "login.subtitle".tr(),
//                   textAlign: TextAlign.center,
//                   style: TextStyles.font12WhiteColorWeightBold,
//                 ),
//               ],
//             ),
//           ),
//         ),
//         Expanded(
//           child: Container(
//             width: double.infinity,
//             color: AppColors.whiteColor,
//             child: Column(
//               children: [
//                 Spacer(),
//                 GestureDetector(
//                   onTap: () {
//                     if (context.locale.languageCode == 'en') {
//                       context.setLocale(Locale('ar', 'EG'));
//                     } else {
//                       context.setLocale(Locale('en', 'US'));
//                     }
//                   },
//                   child: Container(
//                     padding:
//                         EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
//                     decoration: BoxDecoration(
//                       color: AppColors.mainColor,
//                       borderRadius: BorderRadius.circular(8.r),
//                     ),
//                     child: Row(
//                       mainAxisSize: MainAxisSize.min,
//                       children: [
//                         Icon(
//                           Icons.language,
//                           color: AppColors.whiteColor,
//                         ),
//                         horizontalSpace(10),
//                         Text(
//                           context.locale.languageCode == 'en'
//                               ? 'Change to Arabic'
//                               : 'تغيير إلى الإنجليزية',
//                           maxLines: 1,
//                           style: TextStyles.font14WhiteColorWeight500,
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//                 verticalSpace(20),
//               ],
//             ),
//           ),
//         ),
//       ],
//     );
//   }
// }
