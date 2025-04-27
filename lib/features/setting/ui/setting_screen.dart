import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pos_system/config/routes/routes.dart';
import 'package:pos_system/core/services/cache_helper.dart';
import 'package:pos_system/core/utils/app_colors_white_theme.dart';
import 'package:pos_system/core/utils/assets_manager.dart';
import 'package:pos_system/core/utils/constant_keys.dart';
import 'package:pos_system/core/utils/extentions.dart';
import 'package:pos_system/core/utils/spacing.dart';
import 'package:pos_system/core/utils/styles.dart';
import 'package:pos_system/core/widgets/error_alert_dialog.dart';
import 'package:pos_system/features/setting/ui/widgets/setting_app_bar_widget.dart';
import 'package:pos_system/features/setting/ui/widgets/setting_item_widget.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SettingAppBarWidget(),
          verticalSpace(11),
          Expanded(
            child: SingleChildScrollView(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SettingItemWidget(
                      text: "قائمه الصندوق",
                      image: ImageAsset.setting2Icon,
                      onTap: () {
                        context.pushNamed(Routes.fundListScreen);
                      }),
                  verticalSpace(8),
                  SettingItemWidget(
                      text: "انشاء زياره",
                      image: ImageAsset.setting3Icon,
                      onTap: () {
                        context.pushNamed(Routes.createVisitScreen);
                      }),
                  verticalSpace(8),
                  SettingItemWidget(
                      text: "انشاء مخطط شهري",
                      image: ImageAsset.setting4Icon,
                      onTap: () {
                        context.pushNamed(Routes.createMonthlyPlanScreen);
                      }),
                  verticalSpace(8),
                  SettingItemWidget(
                      text: "العملاء",
                      image: ImageAsset.setting5Icon,
                      onTap: () {
                        context.pushNamed(Routes.customersScreen);
                      }),
                  verticalSpace(8),
                  SettingItemWidget(
                      text: "اضافه عميل جديد",
                      image: ImageAsset.setting6Icon,
                      onTap: () {
                        context.pushNamed(Routes.addCustomerScreen);
                      }),
                  verticalSpace(8),
                  SettingItemWidget(
                      text: "اضافة تحويل",
                      image: ImageAsset.setting7Icon,
                      onTap: () async{

                       String?  sales =
                            await CacheHelper.getSecuredString(ConstantKeys.saveSalesToShared);


                       if(sales=="1"){
                         context.pushNamed(Routes.addTransferSectionScreen);
                       }else{
                         ErrorAlertDialog.getDialog(context, "غير مسموح لك باضافة تحويلات . اطلب اذن من المدير");
                       }


                      }),
                  verticalSpace(8),
                  SettingItemWidget(
                      text: "التحويلات",
                      image: ImageAsset.setting7Icon,
                      onTap: () {
                        context.pushNamed(Routes.transferSectionScreen);
                      }),
                  verticalSpace(16),
                  Text(
                    "اخري",
                    style: TextStyles.font16BlackColor2Weight600,
                  ),
                  verticalSpace(16),
                  Row(
                    children: [
                      Expanded(
                          child: SettingItemWidget(
                              text: "توصيات من المدير",
                              image: ImageAsset.setting2_1Icon,
                              isBig: false,
                              onTap: () {
                                context.pushNamed(
                                    Routes.recommendationsFromManagerScreen);
                              })),
                      horizontalSpace(13),
                      Expanded(
                          child: SettingItemWidget(
                              text: "الكورسات",
                              image: ImageAsset.setting2_2Icon,
                              isBig: false,
                              onTap: () {
                                context.pushNamed(Routes.allCoursesScreen);
                              })),
                    ],
                  ),
                  verticalSpace(8),
                  Row(
                    children: [
                      Expanded(
                          child: SettingItemWidget(
                              text: "طلباتك",
                              image: ImageAsset.setting2_3Icon,
                              isBig: false,
                              onTap: () {
                                context.pushNamed(Routes.myRequestsScreen);
                              })),
                      horizontalSpace(13),
                      Expanded(
                          child: SettingItemWidget(
                              text: "المرتبات",
                              image: ImageAsset.setting2_4Icon,
                              isBig: false,
                              onTap: () {
                                context.pushNamed(Routes.salaryScreen,
                                    arguments: {"context": context});
                              })),
                    ],
                  ),
                  verticalSpace(8),
                  Row(
                    children: [
                      Expanded(
                          child: SettingItemWidget(
                              text: "طلبات الاجازه",
                              image: ImageAsset.setting2_5Icon,
                              isBig: false,
                              onTap: () {
                                context.pushNamed(Routes.leaveRequestsScreen);
                              })),
                      horizontalSpace(13),
                      Expanded(
                          child: SettingItemWidget(
                              text: "قائمه الزيارات المطلوبة",
                              image: ImageAsset.setting2_6Icon,
                              isBig: false,
                              onTap: () {
                                context.pushNamed(Routes.visitsListScreen);
                              })),
                    ],
                  ),
                  verticalSpace(8),
                  Row(
                    children: [
                      Expanded(
                          child: SettingItemWidget(
                              text: "قائمه الزيارات المنفذه",
                              image: ImageAsset.setting2_7Icon,
                              isBig: false,
                              onTap: () {
                                context
                                    .pushNamed(Routes.visitsCarriedOutScreen);
                              })),
                      horizontalSpace(13),
                      Expanded(
                          child: SettingItemWidget(
                              text: "فواتير البيع",
                              image: ImageAsset.setting2_16Icon,
                              isBig: false,
                              onTap: () {
                                context.pushNamed(Routes.salesInvoiceScreen);
                              })),
                    ],
                  ),
                  verticalSpace(8),
                  Row(
                    children: [
                      Expanded(
                          child: SettingItemWidget(
                              text: "فواتير المرتجع",
                              image: ImageAsset.setting2_8Icon,
                              isBig: false,
                              onTap: () {
                                context.pushNamed(Routes.returnInvoiceScreen);
                              })),
                      horizontalSpace(13),
                      Expanded(
                          child: SettingItemWidget(
                              text: "ايصلات نقديه",
                              image: ImageAsset.setting2_10Icon,
                              isBig: false,
                              onTap: () {
                                context.pushNamed(Routes.cashInvoiceScreen);
                              })),
                    ],
                  ),
                  verticalSpace(8),
                  Row(
                    children: [
                      Expanded(
                          child: SettingItemWidget(
                              text: "طلبات الحجز",
                              image: ImageAsset.setting2_12Icon,
                              isBig: false,
                              onTap: () {
                                context.pushNamed(
                                    Routes.requestResourcesInvoicesScreen);
                              })),
                      horizontalSpace(13),
                      Expanded(
                          child: SettingItemWidget(
                              text: "طلبات رد الحجز",
                              image: ImageAsset.setting2_13Icon,
                              isBig: false,
                              onTap: () {
                                context.pushNamed(
                                    Routes.returnResourcesInvoicesScreen);
                              })),
                    ],
                  ),
                  verticalSpace(8),
                  Row(
                    children: [
                      // Expanded(
                      //     child: SettingItemWidget(
                      //         text: "لائحه تصفير الرحلات",
                      //         image: ImageAsset.setting2_14Icon,
                      //         isBig: false,
                      //         onTap: () {
                      //           print(122);
                      //         })),
                      // horizontalSpace(13),
                      Expanded(
                          child: SettingItemWidget(
                              text: "تصفير رحله المندوب",
                              image: ImageAsset.setting2_15Icon,
                              onTap: () {
                                context.pushNamed(Routes.zeroingMyTripsScreen);
                              })),
                    ],
                  ),
                  verticalSpace(16),
                  Text(
                    "اعدادات الحساب",
                    style: TextStyles.font16BlackColor2Weight600,
                  ),
                  verticalSpace(16),
                  // SettingItemWidget(
                  //     text: "اللغه",
                  //     image: ImageAsset.setting3_1Icon,
                  //     onTap: () {
                  //       print(122);
                  //     }),
                  verticalSpace(8),
                  SettingItemWidget(
                      text: "تسجيل الخروج",
                      image: ImageAsset.setting3_2Icon,
                      onTap: () async {
                        context.pushNamedAndRemoveUntil(Routes.loginScreen,
                            predicate: (route) => false);
                        await CacheHelper.removeSecureData(
                            ConstantKeys.saveTokenToShared);
                        await CacheHelper.removeSecureData(
                            ConstantKeys.saveMandoubeNameToShared);
                        await CacheHelper.removeSecureData(
                            ConstantKeys.saveEmailToShared);
                        await CacheHelper.removeSecureData(
                            ConstantKeys.savePhoneToShared);
                      }),
                  verticalSpace(8),
                  SettingItemWidget(
                      text: "حذف الحساب",
                      image: ImageAsset.setting3_3Icon,
                      isRed: true,
                      onTap: () async {
                        context.pushNamedAndRemoveUntil(Routes.loginScreen,
                            predicate: (route) => false);
                        await CacheHelper.removeSecureData(
                            ConstantKeys.saveTokenToShared);
                        await CacheHelper.removeSecureData(
                            ConstantKeys.saveMandoubeNameToShared);
                        await CacheHelper.removeSecureData(
                            ConstantKeys.saveEmailToShared);
                        await CacheHelper.removeSecureData(
                            ConstantKeys.savePhoneToShared);
                      }),
                  verticalSpace(60),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
