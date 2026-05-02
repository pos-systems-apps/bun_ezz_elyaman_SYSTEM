import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:pos_system/core/services/location_service.dart';
import 'package:pos_system/core/services/services_locator.dart';
import 'package:pos_system/core/utils/app_constant.dart';
import 'package:pos_system/features/login/data/models/login_response_model.dart';
import 'package:pos_system/features/login/data/models/update_user_location_request.dart';

import '../../../core/services/cache_helper.dart';
import '../../../core/utils/constant_keys.dart';
import '../data/models/login_request_model.dart';
import '../data/repo/login_repo.dart';
import 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final LoginRepo _loginRepo;

  LoginCubit(this._loginRepo) : super(InitialState());

  login(String email, String password) {
    emit(OnLoginLoadingState());
    _loginRepo
        .login(LoginRequestModel(email: email, password: password))
        .then((value) {
      value.fold((l) {
        emit(OnLoginErrorState(error: l.message));
      }, (r) async {
        await saveUserToken(r);
        Position? position = await YourLocation.getCurrentLocation();
        await _loginRepo.updateUseLocation(UpdateUserLocationRequest(
            latitude: position?.latitude ?? 0,
            longitude: position?.longitude ?? 0));
        emit(OnLoginSuccessState());
      });
    }).catchError((error) {
      emit(OnLoginCatchErrorState(error: "error".tr()));
    });
  }

  Future<void> saveUserToken(LoginResponseModel loginResponse) async {

    await CacheHelper.setSecuredString(ConstantKeys.saveMandoubeNameToShared,
        loginResponse.data.delegate.name);
    await CacheHelper.setSecuredString(
        ConstantKeys.saveEmailToShared, loginResponse.data.delegate.email);
    await CacheHelper.setSecuredString(
        ConstantKeys.savePhoneToShared, loginResponse.data.delegate.phone);
    await CacheHelper.setSecuredString(
        ConstantKeys.saveTokenToShared, loginResponse.data.token);

  }

  static LoginCubit get(context) => BlocProvider.of(context);
}
