import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pos_system/core/services/services_locator.dart';
import 'package:pos_system/core/utils/app_colors_white_theme.dart';
import 'package:pos_system/core/utils/assets_manager.dart';
import 'package:pos_system/core/utils/styles.dart';
import 'package:pos_system/features/button_navigation/entities/button_navigation_items.dart';

import 'package:pos_system/features/button_navigation/logic/button_navigation_state.dart';
import 'package:pos_system/features/collections/logic/collections_cubit.dart';
import 'package:pos_system/features/collections/ui/collections_screen.dart';
import 'package:pos_system/features/sales/logic/sales_cubit.dart';
import 'package:pos_system/features/sales/ui/sales_screen.dart';
import 'package:pos_system/features/statistics/ui/statistics_screen.dart';

class ButtonNavigationCubit extends Cubit<ButtonNavigationState> {
  ButtonNavigationCubit() : super(InitialState());

  int selectedIndex = 0;

  changeSelectedTap(int value) {
    selectedIndex = value;
    emit(OnChangeTapState());
  }

  Widget buttonBarBody() {
    switch (selectedIndex) {
      case 0:
        return StatisticsScreen();
      case 1:
        return BlocProvider(
          create: (context) => CollectionsCubit(getIt()),
          child: CollectionsScreen(),
        );
      case 2:
        return BlocProvider(
          create: (context) => SalesCubit(getIt()),
          child: SalesScreen(),
        );
      case 3:
        return StatisticsScreen();

      default:
        return StatisticsScreen();
    }
  }

  List<Item> buttonBarItems(context) => [
        Item(
            image: SvgPicture.asset(
              ImageAsset.chartICon,
              color: ButtonNavigationCubit.get(context).selectedIndex == 0
                  ? AppColors.blackColor
                  : AppColors.greyColorBD,
            ),
            title: "buttonNavigation1".tr(),
            titleTextStyle: TextStyles.font10GreyColorBDWeight500.copyWith(
              color: ButtonNavigationCubit.get(context).selectedIndex == 0
                  ? AppColors.blackColor
                  : AppColors.greyColorBD,
            )),
        Item(
            image: SvgPicture.asset(
              ImageAsset.collectionsICon,
              color: ButtonNavigationCubit.get(context).selectedIndex == 1
                  ? AppColors.blackColor
                  : AppColors.greyColorBD,
            ),
            title: "buttonNavigation2".tr(),
            titleTextStyle: TextStyles.font10GreyColorBDWeight500.copyWith(
              color: ButtonNavigationCubit.get(context).selectedIndex == 1
                  ? AppColors.blackColor
                  : AppColors.greyColorBD,
            )),
        Item(
            image: SvgPicture.asset(
              ImageAsset.salesICon,
              color: ButtonNavigationCubit.get(context).selectedIndex == 2
                  ? AppColors.blackColor
                  : AppColors.greyColorBD,
            ),
            title: "buttonNavigation3".tr(),
            titleTextStyle: TextStyles.font10GreyColorBDWeight500.copyWith(
              color: ButtonNavigationCubit.get(context).selectedIndex == 2
                  ? AppColors.blackColor
                  : AppColors.greyColorBD,
            )),
        Item(
            image: SvgPicture.asset(
              ImageAsset.ordersICon,
              color: ButtonNavigationCubit.get(context).selectedIndex == 3
                  ? AppColors.blackColor
                  : AppColors.greyColorBD,
            ),
            title: "buttonNavigation4".tr(),
            titleTextStyle: TextStyles.font10GreyColorBDWeight500.copyWith(
              color: ButtonNavigationCubit.get(context).selectedIndex == 3
                  ? AppColors.blackColor
                  : AppColors.greyColorBD,
            )),
      ];

  static ButtonNavigationCubit get(context) => BlocProvider.of(context);
}
