import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pos_system/config/routes/routes.dart';
import 'package:pos_system/core/services/cache_helper.dart';
import 'package:pos_system/core/utils/app_colors_white_theme.dart';
import 'package:pos_system/core/utils/assets_manager.dart';
import 'package:pos_system/core/utils/constant_keys.dart';
import 'package:pos_system/core/utils/extentions.dart';
import 'package:pos_system/core/utils/spacing.dart';
import 'package:pos_system/core/utils/styles.dart';
import 'package:pos_system/core/widgets/cached_network_image.dart';

class StatisticAppBarWidget extends StatefulWidget {
  const StatisticAppBarWidget({super.key});

  @override
  State<StatisticAppBarWidget> createState() => _StatisticAppBarWidgetState();
}

class _StatisticAppBarWidgetState extends State<StatisticAppBarWidget> {
  String? name;
  String? email;
  String? phone;

  @override
  void initState() {
    super.initState();
    getUserStatus();
  }

  getUserStatus() async {
    name = await CacheHelper.getSecuredString(
        ConstantKeys.saveMandoubeNameToShared);
    email = await CacheHelper.getSecuredString(ConstantKeys.saveEmailToShared);
    phone = await CacheHelper.getSecuredString(ConstantKeys.savePhoneToShared);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150.h,
      width: double.infinity,
      padding: EdgeInsets.only(left: 20.w, right: 20.w, bottom: 20.h),
      decoration: BoxDecoration(
        color: AppColors.mainColor,
        image: DecorationImage(
          image: AssetImage(ImageAsset.backGroundImage),
          fit: BoxFit.fill,
        ),
      ),
      child: SafeArea(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Container(
              height: 47.h,
              width: 47.w,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.r),
                border: Border.all(color: AppColors.whiteColor, width: 2.5),
              ),
              child: CachedNetworkImageWidget(imgUrl: "", radius: 10.r),
            ),
            horizontalSpace(12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    "حياك 👋",
                    style: TextStyles.font12WhiteWeight500,
                  ),
                  verticalSpace(4),
                  Text(
                    name ?? "",
                    maxLines: 1,
                    style: TextStyles.font14WhiteWeight600,
                  ),
                ],
              ),
            ),
            horizontalSpace(12),
            GestureDetector(
                onTap: () {
                  context.pushNamed(Routes.settingScreen);
                },
                child: Container(
                  height: 40.h,
                  width: 40.w,
                  padding: EdgeInsets.all(8.r),
                  decoration: BoxDecoration(
                    color: AppColors.whiteColor,
                    borderRadius: BorderRadius.circular(12.r),
                  ),
                  child: SvgPicture.asset(ImageAsset.drawerICon),
                )),
          ],
        ),
      ),
    );
  }
}
