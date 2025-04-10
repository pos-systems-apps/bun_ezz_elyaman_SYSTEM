import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:pos_system/core/services/cache_helper.dart';
import 'package:pos_system/core/utils/app_colors_white_theme.dart';
import 'package:pos_system/core/utils/assets_manager.dart';
import 'package:pos_system/core/utils/constant_keys.dart';
import 'package:pos_system/core/utils/spacing.dart';
import 'package:pos_system/core/utils/styles.dart';
import 'package:pos_system/core/widgets/loading_widget.dart';
import 'package:pos_system/features/collections/ui/widgets/collections_body_widget.dart';

class CollectionsScreen extends StatefulWidget {
  const CollectionsScreen({super.key});

  @override
  State<CollectionsScreen> createState() => _CollectionsScreenState();
}

class _CollectionsScreenState extends State<CollectionsScreen> {
  String? admin;

  @override
  void initState() {
    super.initState();
    getStockAdmin();
  }

  getStockAdmin() async {
    admin = await CacheHelper.getSecuredString(ConstantKeys.saveAdminToShared);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      body: SafeArea(
        child: admin == null
            ? Center(
                child: LoadingWidget(color: AppColors.mainColor),
              )
            : Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  verticalSpace(10),
                  Center(
                      child: Text(
                    "التحصيلات النقديه",
                    style: TextStyles.font20BlueColorA4Weight600,
                  )),
                  verticalSpace(16),
                  admin == "1"
                      ? CollectionsBodyWidget()
                      : Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 20.w),
                              child: Lottie.asset(
                                ImageAsset.notPermissionAnimation,
                                repeat: true,
                              ),
                            ),
                            verticalSpace(16),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 24.w),
                              child: Text(
                                "غير مسموح لك بالتحصيلات . اطلب اذن من المدير",
                                textAlign: TextAlign.center,
                                style: TextStyles.font20MainColorWeightBold,
                              ),
                            ),
                          ],
                        ),
                ],
              ),
      ),
    );
  }
}
