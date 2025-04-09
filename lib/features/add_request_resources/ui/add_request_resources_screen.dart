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
import 'package:pos_system/features/add_request_resources/ui/add_request_resources_widgets/add_request_resources_body_widget.dart';

class AddRequestResourcesScreen extends StatefulWidget {
  const AddRequestResourcesScreen({super.key});

  @override
  State<AddRequestResourcesScreen> createState() =>
      _AddRequestResourcesScreenState();
}

class _AddRequestResourcesScreenState extends State<AddRequestResourcesScreen> {
  String? stock ;

  @override
  void initState() {
    super.initState();
    getStockStatus();
  }

  getStockStatus() async {
    stock = await CacheHelper.getSecuredString(ConstantKeys.saveStockToShared);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      body: SafeArea(
          child: stock == null
              ? Center(
                  child: LoadingWidget(color: AppColors.mainColor),
                )
              : Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    verticalSpace(10),
                    Center(
                        child: Text(
                      "التوريدات",
                      style: TextStyles.font20BlueColorA4Weight600,
                    )),
                    verticalSpace(16),
                    stock == "1"
                        ? AddRequestResourcesBodyWidget()
                        : Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Padding(
                                padding:  EdgeInsets.symmetric(horizontal: 20.w),
                                child: Lottie.asset(
                                  ImageAsset.notPermissionAnimation,
                                  repeat: true,
                                ),
                              ),
                              verticalSpace(16),
                              Padding(
                                padding:  EdgeInsets.symmetric(horizontal: 24.w),
                                child: Text(
                                  "غير مسموح لك بالتوريدات اطلب اذن من المدير",
                                  textAlign: TextAlign.center,
                                  style: TextStyles.font20MainColorWeightBold,
                                ),
                              ),
                            ],
                          ),
                  ],
                )),
    );
  }
}
