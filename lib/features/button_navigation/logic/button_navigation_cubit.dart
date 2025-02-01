import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:pos_system/features/button_navigation/logic/button_navigation_state.dart';

class ButtonNavigationCubit extends Cubit<ButtonNavigationState> {
  ButtonNavigationCubit() : super(InitialState());

  // MotionTabBarController? motionTabBarController;
  //

  int selectedIndex=0;
  changeSelectedTap(int value) {
    selectedIndex = value;
    emit(OnChangeTapState());
  }

  // Widget bodyScreen() {
  //   switch (motionTabBarController?.index) {
  //     case 3:
  //       return BlocProvider(
  //         create: (context) => HomeCubit(getIt())
  //           ..getServices()
  //           ..getPartners()
  //           ..getOurWork(),
  //         child: HomeScreen(),
  //       );
  //     case 2:
  //       return BlocProvider(
  //         create: (context) => CartCubit(getIt())..getCartOrders(),
  //         child: CartScreen(
  //           isRoute: false,
  //         ),
  //       );
  //     case 1:
  //       return BlocProvider(
  //         create: (context) => OrderCubit(getIt())..getOrders(),
  //         child: const OrdersScreen(
  //           isRoute: false,
  //         ),
  //       );
  //
  //     case 0:
  //       return BlocProvider(
  //         create: (context) => ProfileCubit(getIt()),
  //         child: ProfileScreen(),
  //       );
  //
  //     default:
  //       return const SizedBox.shrink();
  //   }
  // }

  static ButtonNavigationCubit get(context) => BlocProvider.of(context);
}
