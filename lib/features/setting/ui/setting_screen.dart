import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pos_system/core/utils/app_colors_white_theme.dart';
import 'package:pos_system/core/utils/assets_manager.dart';
import 'package:pos_system/core/utils/spacing.dart';
import 'package:pos_system/core/utils/styles.dart';
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
                      text: "الاحصائيات",
                      image: ImageAsset.setting1Icon,
                      onTap: () {
                        print(122);
                      }),
                  verticalSpace(8),
                  SettingItemWidget(
                      text: "قائمه الصندوق",
                      image: ImageAsset.setting2Icon,
                      onTap: () {
                        print(122);
                      }),
                  verticalSpace(8),
                  SettingItemWidget(
                      text: "انشاء زياره",
                      image: ImageAsset.setting3Icon,
                      onTap: () {
                        print(122);
                      }),
                  verticalSpace(8),
                  SettingItemWidget(
                      text: "انشاء مخطط شهري",
                      image: ImageAsset.setting4Icon,
                      onTap: () {
                        print(122);
                      }),
                  verticalSpace(8),
                  SettingItemWidget(
                      text: "العملاء",
                      image: ImageAsset.setting5Icon,
                      onTap: () {
                        print(122);
                      }),
                  verticalSpace(8),
                  SettingItemWidget(
                      text: "اضافه عميل جديد",
                      image: ImageAsset.setting6Icon,
                      onTap: () {
                        print(122);
                      }),
                  verticalSpace(8),
                  SettingItemWidget(
                      text: "التحويلات",
                      image: ImageAsset.setting7Icon,
                      onTap: () {
                        print(122);
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
                                print(122);
                              })),
                      horizontalSpace(13),
                      Expanded(
                          child: SettingItemWidget(
                              text: "الكورسات",
                              image: ImageAsset.setting2_2Icon,
                              isBig: false,
                              onTap: () {
                                print(122);
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
                                print(122);
                              })),
                      horizontalSpace(13),
                      Expanded(
                          child: SettingItemWidget(
                              text: "المرتبات",
                              image: ImageAsset.setting2_4Icon,
                              isBig: false,
                              onTap: () {
                                print(122);
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
                                print(122);
                              })),
                      horizontalSpace(13),
                      Expanded(
                          child: SettingItemWidget(
                              text: "قائمه الزيارات",
                              image: ImageAsset.setting2_6Icon,
                              isBig: false,
                              onTap: () {
                                print(122);
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
                                print(122);
                              })),
                      horizontalSpace(13),
                      Expanded(
                          child: SettingItemWidget(
                              text: "فواتير البيع",
                              image: ImageAsset.setting2_16Icon,
                              isBig: false,
                              onTap: () {
                                print(122);
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
                                print(122);
                              })),
                      horizontalSpace(13),
                      Expanded(
                          child: SettingItemWidget(
                              text: "فواتير محصله",
                              image: ImageAsset.setting2_9Icon,
                              isBig: false,
                              onTap: () {
                                print(122);
                              })),
                    ],
                  ),
                  verticalSpace(8),
                  Row(
                    children: [
                      Expanded(
                          child: SettingItemWidget(
                              text: "فواتير غير محصله",
                              image: ImageAsset.setting2_9Icon,
                              isBig: false,
                              onTap: () {
                                print(122);
                              })),
                      horizontalSpace(13),
                      Expanded(
                          child: SettingItemWidget(
                              text: "ايصلات نقديه",
                              image: ImageAsset.setting2_10Icon,
                              isBig: false,
                              onTap: () {
                                print(122);
                              })),
                    ],
                  ),
                  verticalSpace(8),
                  Row(
                    children: [
                      Expanded(
                          child: SettingItemWidget(
                              text: "قائمه التحويلات",
                              image: ImageAsset.setting2_11Icon,
                              isBig: false,
                              onTap: () {
                                print(122);
                              })),
                      horizontalSpace(13),
                      Expanded(
                          child: SettingItemWidget(
                              text: "طلبات الحجز",
                              image: ImageAsset.setting2_12Icon,
                              isBig: false,
                              onTap: () {
                                print(122);
                              })),
                    ],
                  ),
                  verticalSpace(8),
                  Row(
                    children: [
                      Expanded(
                          child: SettingItemWidget(
                              text: "طلبات رد الحجز",
                              image: ImageAsset.setting2_13Icon,
                              isBig: false,
                              onTap: () {
                                print(122);
                              })),
                      horizontalSpace(13),
                      Expanded(
                          child: SettingItemWidget(
                              text: "لائحه تصفير الرحلات",
                              image: ImageAsset.setting2_14Icon,
                              isBig: false,
                              onTap: () {
                                print(122);
                              })),
                    ],
                  ),
                  verticalSpace(8),
                  SettingItemWidget(
                      text: "تصفير رحله المندوب",
                      image: ImageAsset.setting2_15Icon,
                      onTap: () {
                        print(122);
                      }),
                  verticalSpace(16),
                  Text(
                    "اعدادات الحساب",
                    style: TextStyles.font16BlackColor2Weight600,
                  ),
                  verticalSpace(16),
                  SettingItemWidget(
                      text: "اللغه",
                      image: ImageAsset.setting3_1Icon,
                      onTap: () {
                        print(122);
                      }),
                  verticalSpace(8),
                  SettingItemWidget(
                      text: "تسجيل الخروج",
                      image: ImageAsset.setting3_2Icon,
                      onTap: () {
                        print(122);
                      }),
                  verticalSpace(8),
                  SettingItemWidget(
                      text: "حذف الحساب",
                      image: ImageAsset.setting3_3Icon,
                      isRed: true,
                      onTap: () {
                        print(122);
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
