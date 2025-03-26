import 'dart:math';

class ImageAsset {


///animation
  static const String collectionDoneAnimation = 'assets/animation/confirm_collection_animation.json';
  static const String requestResourceDoneAnimation = 'assets/animation/request_resources_animation.json';
  static const String loadingAnimation = 'assets/animation/loading_animation.json';
  static const String notFoundAnimation = 'assets/animation/not_found_animation.json';

///images
  static const String backGroundImage = 'assets/images/back_ground_image.png';
  static const String logoImage = 'assets/images/logo_image_2.png';
  // static const String logoImage = 'assets/images/logo_image.png';
  static const String chartBackGroundImage = 'assets/images/chart_background_image.png';
  static const String notFoundImage = 'assets/images/not_found.png';
///icons
  static const String scanICon = 'assets/icons/scan_icon.svg';
  static const String chartICon = 'assets/icons/chart_icon.svg';
  static const String collectionsICon = 'assets/icons/collections_icon.svg';
  static const String salesICon = 'assets/icons/sales_icon.svg';
  static const String ordersICon = 'assets/icons/orders_icon.svg';
  static const String drawerICon = 'assets/icons/drawer_icon.svg';

  static const String statics1ICon = 'assets/icons/statics_1_icon.svg';
  static const String statics2ICon = 'assets/icons/statics_2_icon.svg';
  static const String statics3ICon = 'assets/icons/statics_3_icon.svg';
  static const String statics4ICon = 'assets/icons/statics_4_icon.svg';
  static const String reseatICon = 'assets/icons/reseat_icon.svg';
  static const String setting1Icon = 'assets/icons/setting_1_icon.svg';
  static const String setting2Icon = 'assets/icons/setting_2_icon.svg';
  static const String setting3Icon = 'assets/icons/setting_3_icon.svg';
  static const String setting4Icon = 'assets/icons/setting_4_icon.svg';
  static const String setting5Icon = 'assets/icons/setting_5_icon.svg';
  static const String setting6Icon = 'assets/icons/setting_6_icon.svg';
  static const String setting7Icon = 'assets/icons/setting_7_icon.svg';

  static const String icon1 = 'assets/icons/icon_1.svg';
  static const String icon2 = 'assets/icons/icon_2.svg';
  static const String icon3 = 'assets/icons/icon_3.svg';
  static const String icon4 = 'assets/icons/icon_4.svg';
  static const String icon5 = 'assets/icons/icon_5.svg';
  static const String icon6 = 'assets/icons/icon_6.svg';
  static const String icon7 = 'assets/icons/icon_7.svg';
  static const String icon8 = 'assets/icons/icon_8.svg';
  static const String icon9 = 'assets/icons/icon_9.svg';

  static const String icon10 = 'assets/icons/icon_10.svg';
  static const String icon11 = 'assets/icons/icon_11.svg';
  static const String icon12 = 'assets/icons/icon_12.svg';
  static const String icon13 = 'assets/icons/icon_13.svg';
  static const String calenderIcon = 'assets/icons/calendar_icon.svg';





  static const String setting2_1Icon = 'assets/icons/setting_2_1_icon.svg';
  static const String setting2_2Icon = 'assets/icons/setting_2_2_icon.svg';
  static const String setting2_3Icon = 'assets/icons/setting_2_3_icon.svg';
  static const String setting2_4Icon = 'assets/icons/setting_2_4_icon.svg';
  static const String setting2_5Icon = 'assets/icons/setting_2_5_icon.svg';
  static const String setting2_6Icon = 'assets/icons/setting_2_6_icon.svg';
  static const String setting2_7Icon = 'assets/icons/setting_2_7_icon.svg';
  static const String setting2_8Icon = 'assets/icons/setting_2_8_icon.svg';
  static const String setting2_9Icon = 'assets/icons/setting_2_9_icon.svg';
  static const String setting2_10Icon = 'assets/icons/setting_2_10_icon.svg';
  static const String setting2_11Icon = 'assets/icons/setting_2_11_icon.svg';
  static const String setting2_12Icon = 'assets/icons/setting_2_12_icon.svg';
  static const String setting2_13Icon = 'assets/icons/setting_2_13_icon.svg';
  static const String setting2_14Icon = 'assets/icons/setting_2_14_icon.svg';
  static const String setting2_15Icon = 'assets/icons/setting_2_15_icon.svg';
  static const String setting2_16Icon = 'assets/icons/setting_2_16_icon.svg';
  static const String setting3_1Icon = 'assets/icons/setting_3_1_icon.svg';
  static const String setting3_2Icon = 'assets/icons/setting_3_2_icon.svg';
  static const String setting3_3Icon = 'assets/icons/setting_3_3_icon.svg';



  static random1(){
    List<String> images = [
      statics1ICon,
      statics3ICon,
      statics4ICon,
    ];
    int randomNumber = Random().nextInt(images.length);
    return images[randomNumber];
  }

  static const String searchICon = 'assets/icons/search_icon.svg';
  static const String moneyICon = 'assets/icons/money_icon.svg';
  static const String moreICon = 'assets/icons/more_icon.svg';
  static const String addImageICon = 'assets/icons/add_image_icon.svg';

}
