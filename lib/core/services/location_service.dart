// import 'package:geolocator/geolocator.dart';
// import 'package:magic/core/services/cache_helper.dart';
// import 'package:magic/core/utils/constant_keys.dart';
//
// class YourLocation {
//   static Future<void> getLocation() async {
//     LocationPermission permission;
//     bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
//     if (serviceEnabled) {
//       permission = await Geolocator.checkPermission();
//       if (permission == LocationPermission.deniedForever) {
//         return;
//       }
//       if (permission == LocationPermission.denied) {
//         permission = await Geolocator.requestPermission();
//         if (permission != LocationPermission.whileInUse &&
//             permission != LocationPermission.always) {
//           return;
//         }
//       }
//
//       Position position = await Geolocator.getCurrentPosition(
//           desiredAccuracy: LocationAccuracy.high);
//       await CacheHelper.setData(
//           ConstantKeys.saveLatitudeToShared, position.latitude);
//       await CacheHelper.setData(
//           ConstantKeys.saveLongitudeToShared, position.longitude);
//     } else {
//       return;
//     }
//   }
// }